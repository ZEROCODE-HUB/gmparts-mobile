# Publicar cambios en la app móvil

Hay dos caminos. Elegir mal el camino no es grave: Shorebird bloquea el parche si el cambio
no es parcheable. Lo que sí es grave es **forzarlo** con `--allow-native-diffs` o
`--allow-asset-diffs`; eso produce apps que crashean en el teléfono sin ningún aviso previo.

## La regla

> **Es parche si el cambio toca únicamente archivos `.dart` dentro de `lib/`.
> Cualquier otra cosa es release de tienda.**

Comprobación mecánica antes de parchear:

```bash
git diff --name-only release/1.0.9+37..HEAD | grep -vE '^lib/.*\.dart$'
```

Si **no imprime nada**, es parche. Si imprime algo, es release. Se admiten como excepción
`*.md`, `test/` y `tests/`, que no entran en el binario.

| Cambio | Camino |
|---|---|
| Lógica Dart, widgets, validaciones, textos | Parche |
| Archivo `.dart` nuevo | Parche |
| Textos de `lib/flutter_flow/internationalization.dart` | Parche |
| Subir un paquete **Dart puro** (`timeago`, `easy_debounce`…) | Parche, validando con `dry_run` |
| Añadir o actualizar un plugin con parte nativa | **Release** |
| Cualquier cosa en `assets/`, `images/`, iconos, fuentes | **Release** |
| `android/`, `AndroidManifest.xml`, Gradle, `google-services.json` | **Release** |
| Subir la versión de Flutter | **Release** |
| Cloud Functions o reglas de Firestore | Ninguno de los dos: va por Firebase |

Trampa de este repo: los assets se declaran **por directorio** (`- assets/images/`), así que
basta con dejar caer un PNG en la carpeta para cambiar el manifiesto y bloquear el parche.

## Parche (el día a día)

1. Rama desde `master`, el arreglo **solo en Dart**, PR, merge a `master`.
2. Lanzar **Android Patch (Shorebird)** con `release_version` = la que está en campo y
   `dry_run` marcado.
3. Si valida, relanzar con `dry_run` desmarcado.
4. Avisar al taller: **abrir la app, cerrarla desde apps recientes y volver a abrirla.** El
   cambio se ve en la **segunda** apertura; la primera solo descarga.

### Reglas que duelen si se olvidan

- **En un parche NUNCA se toca la línea `version:` de `pubspec.yaml`.** Cambiarla apunta el
  parche a una release que nadie tiene instalada.
- **Todo parche sale de `master`.** Los parches no se heredan entre releases: si parcheas
  `1.0.9+37` y luego publicas `1.0.9+45`, quienes instalen la nueva solo tienen el arreglo
  si está en el código del que salió.
- **No hay rollback en el plan gratuito.** Un parche malo se corrige con otro parche. Eso
  funciona salvo si el parche rompe el **arranque**: ahí el teléfono queda inservible hasta
  reinstalar.
- **Nunca parchear `lib/main.dart` ni la ruta de arranque** sin probarlo antes en un teléfono
  físico instalando el APK de la release y aplicándole el parche.
- Si hay **varias releases vivas** en campo, un arreglo hay que publicarlo una vez por cada
  una. Conviene una release de tienda al mes para consolidar el parque.

## Release de tienda

1. Merge a `master`.
2. Lanzar **Android Release (Shorebird)**. El resumen del workflow da la release version.
3. Etiquetar: `git tag release/1.0.9+<n> && git push --tags`.
4. Subir el AAB a Play. Repartir el APK a quien no pase por Play.

El `versionCode` sale de `github.run_number`, que es monótono: Play nunca lo rechaza por
duplicado. El `versionName` (`1.0.9`) se sube a mano en `pubspec.yaml`, y solo al publicar.

**El APK autofirmado no espera a Play.** En cuanto termina el workflow ya es parcheable, así
que el taller puede tener OTA funcionando sin esperar a la revisión.

Un teléfono no puede tener a la vez la versión de Play y la autofirmada: hay que desinstalar
una antes de instalar la otra.

## Cosas que romperían los parches

- Activar `minifyEnabled`, `--obfuscate`, `--split-debug-info` o `--split-per-abi`.
- Cambiar la versión de Flutter sin hacer release.
- Construir el AAB y el APK en ejecuciones distintas: serían dos releases de Shorebird y
  harían falta dos parches. Por eso ambos salen de una sola invocación.
