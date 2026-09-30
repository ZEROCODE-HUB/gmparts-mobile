import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';

/// Selector en hoja inferior, con buscador.
///
/// Sustituye a `FlutterFlowDropDown` en las listas largas. El desplegable nativo se abria
/// sobre el propio campo: con 1028 clientes ocupaba la pantalla entera, sin forma clara de
/// cerrarlo, y en modo multiple pintaba las casillas con el color por defecto —oscuro sobre
/// fondo oscuro—, asi que no se distinguia lo marcado de lo no marcado.
///
/// Lo usan Cliente, Tecnico de servicio e Inventario del vehiculo.
class OpcionSelector {
  const OpcionSelector({required this.valor, required this.etiqueta, this.detalle});

  /// Lo que se devuelve al elegir. Para un cliente es el ID DEL DOCUMENTO, nunca el
  /// nombre: hay 19 clientes con el nombre exactamente repetido.
  final String valor;

  final String etiqueta;

  /// Texto secundario en gris —el documento, la marca—. Entra en la busqueda, que es como
  /// se separan dos homonimos.
  final String? detalle;
}

/// El campo que se ve en el formulario y abre la hoja al tocarlo.
///
/// Imita al `FlutterFlowDropDown` que sustituye —mismo alto, mismo relleno, misma flecha—
/// para que el formulario no cambie de aspecto a medias.
class CampoSelector extends StatelessWidget {
  const CampoSelector({
    super.key,
    required this.texto,
    required this.onTap,
    this.pista = 'Seleccione',
    this.habilitado = true,
  });

  /// Lo elegido. Vacio muestra `pista` en gris.
  final String texto;
  final String pista;
  final VoidCallback onTap;

  /// Deshabilitado se ve apagado y no abre nada: se usa para exigir un paso previo.
  final bool habilitado;

  @override
  Widget build(BuildContext context) {
    final t = FlutterFlowTheme.of(context);
    final vacio = texto.trim().isEmpty;
    return InkWell(
      onTap: habilitado ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: t.accent2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                vacio ? pista : texto,
                overflow: TextOverflow.ellipsis,
                style: t.titleSmall.override(
                  font: GoogleFonts.montserrat(),
                  color: habilitado
                      ? (vacio ? t.secondaryText : t.accent1)
                      : t.secondaryText,
                  letterSpacing: 0.0,
                ),
              ),
            ),
            Icon(
              Icons.expand_circle_down_outlined,
              color: habilitado ? t.primary : t.secondaryText,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}

List<OpcionSelector> _filtrar(List<OpcionSelector> opciones, String q) {
  final t = q.trim().toLowerCase();
  if (t.isEmpty) return opciones;
  final partes = t.split(RegExp(r'\s+'));
  return opciones.where((o) {
    final texto = (o.etiqueta + ' ' + (o.detalle ?? '')).toLowerCase();
    return partes.every(texto.contains);
  }).toList();
}

Widget _cabecera(BuildContext context, String titulo, int total) {
  final t = FlutterFlowTheme.of(context);
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 8, 8, 0),
    child: Row(
      children: [
        Expanded(
          child: Text(
            total > 0 ? titulo + ' (' + total.toString() + ')' : titulo,
            style: t.titleMedium.override(
              font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              color: t.primaryText,
              letterSpacing: 0.0,
            ),
          ),
        ),
        // Cerrar explicito. El desplegable anterior solo se cerraba tocando fuera, y
        // ocupando toda la pantalla no habia «fuera» que tocar.
        IconButton(
          icon: Icon(Icons.close, color: t.secondaryText),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Cerrar',
        ),
      ],
    ),
  );
}

Widget _buscador(BuildContext context, ValueChanged<String> onChanged, String pista) {
  final t = FlutterFlowTheme.of(context);
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
    child: TextField(
      // Sin autofocus a proposito: abrir la hoja no debe levantar el teclado y comerse
      // media lista antes de que se vea nada.
      autofocus: false,
      onChanged: onChanged,
      style: t.bodyMedium.override(color: t.primaryText, letterSpacing: 0.0),
      decoration: InputDecoration(
        hintText: pista,
        hintStyle: t.bodyMedium.override(color: t.secondaryText, letterSpacing: 0.0),
        prefixIcon: Icon(Icons.search, color: t.secondaryText, size: 20),
        filled: true,
        fillColor: t.primaryBackground,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _vacio(BuildContext context, String texto) {
  final t = FlutterFlowTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(28),
    child: Center(
      child: Text(texto,
          style: t.bodyMedium.override(color: t.secondaryText, letterSpacing: 0.0)),
    ),
  );
}

BoxDecoration _hoja(BuildContext context) => BoxDecoration(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
    );

/// Elegir UNA opcion. Devuelve el `valor` elegido, o null si se cerro sin elegir.
Future<String?> abrirSelectorUnico(
  BuildContext context, {
  required String titulo,
  required List<OpcionSelector> opciones,
  String? seleccionado,
  String pista = 'Buscar...',
  String vacio = 'Sin resultados',
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      var filtradas = opciones;
      return StatefulBuilder(
        builder: (ctx, setSheetState) {
          final t = FlutterFlowTheme.of(ctx);
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
              decoration: _hoja(ctx),
              height: MediaQuery.of(ctx).size.height * 0.82,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cabecera(ctx, titulo, filtradas.length),
                  _buscador(ctx, (q) => setSheetState(() => filtradas = _filtrar(opciones, q)),
                      pista),
                  Expanded(
                    child: filtradas.isEmpty
                        ? _vacio(ctx, vacio)
                        : ListView.separated(
                            itemCount: filtradas.length,
                            separatorBuilder: (_, __) =>
                                Divider(height: 1, color: t.alternate),
                            itemBuilder: (_, i) {
                              final o = filtradas[i];
                              final elegido = o.valor == seleccionado;
                              return ListTile(
                                title: Text(
                                  o.etiqueta,
                                  style: t.bodyMedium.override(
                                    color: t.primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight:
                                        elegido ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                                subtitle: (o.detalle ?? '').isEmpty
                                    ? null
                                    : Text(o.detalle!,
                                        style: t.bodySmall.override(
                                            color: t.secondaryText, letterSpacing: 0.0)),
                                trailing: elegido
                                    ? Icon(Icons.check_circle, color: t.primary, size: 22)
                                    : null,
                                onTap: () => Navigator.of(ctx).pop(o.valor),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

/// Elegir VARIAS. Devuelve la lista elegida, o null si se cerro sin confirmar.
Future<List<String>?> abrirSelectorMultiple(
  BuildContext context, {
  required String titulo,
  required List<OpcionSelector> opciones,
  required List<String> seleccionados,
  String pista = 'Buscar...',
  String vacio = 'Sin resultados',
}) {
  return showModalBottomSheet<List<String>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      var filtradas = opciones;
      final marcados = <String>{...seleccionados};
      return StatefulBuilder(
        builder: (ctx, setSheetState) {
          final t = FlutterFlowTheme.of(ctx);
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
              decoration: _hoja(ctx),
              height: MediaQuery.of(ctx).size.height * 0.82,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cabecera(ctx, titulo, marcados.length),
                  _buscador(ctx, (q) => setSheetState(() => filtradas = _filtrar(opciones, q)),
                      pista),
                  Expanded(
                    child: filtradas.isEmpty
                        ? _vacio(ctx, vacio)
                        : ListView.separated(
                            itemCount: filtradas.length,
                            separatorBuilder: (_, __) =>
                                Divider(height: 1, color: t.alternate),
                            itemBuilder: (_, i) {
                              final o = filtradas[i];
                              final marcado = marcados.contains(o.valor);
                              return CheckboxListTile(
                                value: marcado,
                                controlAffinity: ListTileControlAffinity.leading,
                                // Colores explicitos: el desplegable anterior pintaba las
                                // casillas con el color por defecto y sobre el fondo oscuro
                                // no se veia lo que estaba marcado.
                                activeColor: t.primary,
                                checkColor: t.info,
                                side: BorderSide(color: t.secondaryText, width: 2),
                                title: Text(
                                  o.etiqueta.trim(),
                                  style: t.bodyMedium
                                      .override(color: t.primaryText, letterSpacing: 0.0),
                                ),
                                onChanged: (v) => setSheetState(() {
                                  if (v == true) {
                                    marcados.add(o.valor);
                                  } else {
                                    marcados.remove(o.valor);
                                  }
                                }),
                              );
                            },
                          ),
                  ),
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                      child: SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: t.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () => Navigator.of(ctx).pop(marcados.toList()),
                          child: Text(
                            'Listo (' + marcados.length.toString() + ')',
                            style: t.titleSmall.override(color: t.info, letterSpacing: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
