import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_model.dart';
export 'privacy_model.dart';

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({super.key});

  static String routeName = 'privacy';
  static String routePath = '/privacy';

  @override
  State<PrivacyWidget> createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late PrivacyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = FlutterFlowTheme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: _theme.primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'TÉRMINOS Y CONDICIONES DE USO – GM PART',
                      textAlign: TextAlign.center,
                      style: _theme.bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: _theme
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: _theme
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 600.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Al acceder y utilizar la aplicación GM PARTS, el usuario acepta plenamente los términos y condiciones aquí establecidos. Esta aplicación ha sido desarrollada con el propósito de ofrecer a sus usuarios un acceso práctico, moderno y eficiente a servicios y productos relacionados con el ámbito automotriz, principalmente repuestos, accesorios, catálogos o cualquier otro tipo de información relacionada. El uso de esta aplicación implica la aceptación voluntaria y consciente de las condiciones aquí detalladas, por lo que se recomienda leerlas detenidamente antes de utilizar cualquier funcionalidad.\n\nGM PARTS está dirigida únicamente a personas mayores de edad, con plena capacidad legal para celebrar contratos. Al utilizar esta app, el usuario declara bajo su responsabilidad que cumple con esta condición. En caso de que una persona menor de edad acceda a la aplicación, se entenderá que lo hace bajo supervisión, consentimiento y total responsabilidad de sus padres o tutores legales.\n\nToda la información proporcionada por los usuarios al registrarse, crear una cuenta o interactuar con la app deberá ser verdadera, exacta, actual y completa. El usuario es responsable de mantener la confidencialidad de sus datos de acceso, así como de todas las actividades que ocurran dentro de su cuenta. GM PARTS no se hace responsable por el uso no autorizado de cuentas o cualquier daño derivado del incumplimiento de esta obligación por parte del usuario.\n\nLa totalidad del contenido publicado en la aplicación, incluyendo, pero no limitado a textos, imágenes, logotipos, nombres comerciales, marcas, íconos, código fuente, bases de datos, y demás elementos gráficos o tecnológicos, pertenece a GM PARTS o a sus respectivos propietarios y está protegida por la legislación nacional e internacional en materia de propiedad intelectual. Queda terminantemente prohibida la reproducción, distribución, modificación, publicación o cualquier otro uso no autorizado de dichos contenidos sin el consentimiento expreso y por escrito de los titulares de los derechos.\n\nEl usuario se compromete a utilizar la aplicación de manera responsable, ética y conforme a la ley. No está permitido el uso de GM PARTS con fines fraudulentos, maliciosos, difamatorios o contrarios a la moral y buenas costumbres. Tampoco se permite la carga o difusión de contenido ofensivo, ilegal, o que infrinja derechos de terceros. GM PARTS se reserva el derecho de suspender o eliminar cuentas que incumplan estas condiciones, sin previo aviso y sin que ello genere derecho a compensación alguna.\n\nLa disponibilidad de la aplicación puede estar sujeta a interrupciones temporales o permanentes, por razones técnicas, de mantenimiento o de fuerza mayor. GM PARTS no garantiza el acceso continuo o ininterrumpido a sus servicios, y no será responsable por pérdidas o daños que puedan derivarse de la imposibilidad de acceder a la app en determinados momentos.\n\nLa aplicación puede contener enlaces o referencias a páginas web de terceros. Estos enlaces son proporcionados únicamente como referencia y conveniencia para el usuario. GM PARTS no controla ni garantiza el contenido, las políticas de privacidad ni el funcionamiento de estos sitios externos, y no asume responsabilidad alguna por ellos. El acceso a estos sitios corre exclusivamente por cuenta y riesgo del usuario.\n\nEl uso de GM PARTS se realiza bajo la exclusiva responsabilidad del usuario. La aplicación se ofrece “tal cual” y “según disponibilidad”, sin garantías de ningún tipo, ya sean expresas o implícitas. GM PARTS no garantiza que la información contenida en la app sea precisa, completa o actualizada, ni que los servicios estén libres de errores, virus o interrupciones.\n\nEn ningún caso GM PARTS, sus representantes, socios, empleados o afiliados serán responsables por daños directos, indirectos, incidentales, especiales, punitivos o consecuentes derivados del uso o imposibilidad de uso de la aplicación, incluso cuando se haya advertido de la posibilidad de tales daños.\n\nGM PARTS se reserva el derecho de modificar total o parcialmente los presentes términos y condiciones en cualquier momento. Las modificaciones serán efectivas desde su publicación en la aplicación. Es responsabilidad del usuario revisar periódicamente esta sección para mantenerse informado. El uso continuado de la app tras la actualización de los términos implicará su aceptación total.\n\nEste acuerdo se rige por la legislación vigente en el territorio de Perú. Cualquier disputa o conflicto relacionado con estos términos será sometido a la jurisdicción de los tribunales competentes del mismo territorio, renunciando expresamente el usuario a cualquier otro fuero que pudiera corresponderle.\n\nPara cualquier duda, reclamo o sugerencia relacionada con estos términos, el usuario podrá comunicarse a través de los canales de contacto habilitados en la misma aplicación o en futuras actualizaciones del sistema.\n\nGM PARTS puede recopilar ciertos datos personales necesarios para el funcionamiento de sus servicios, tales como nombre, correo electrónico, ubicación o historial de navegación dentro de la aplicación. Dichos datos serán tratados de forma confidencial y conforme a la legislación vigente en materia de protección de datos. El usuario acepta expresamente el tratamiento de esta información con fines operativos, comerciales y estadísticos.',
                          style:
                              _theme.bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: _theme
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: _theme
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: _theme
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
