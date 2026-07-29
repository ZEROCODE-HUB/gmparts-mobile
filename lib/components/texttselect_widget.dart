import '/components/textcomponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'texttselect_model.dart';
export 'texttselect_model.dart';

class TexttselectWidget extends StatefulWidget {
  const TexttselectWidget({
    super.key,
    String? text,
    String? pagselect,
    required this.selects,
  })  : this.text = text ?? '',
        this.pagselect = pagselect ?? 'pagselect';

  final String text;
  final String pagselect;
  final Future Function()? selects;

  @override
  State<TexttselectWidget> createState() => _TexttselectWidgetState();
}

class _TexttselectWidgetState extends State<TexttselectWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late TexttselectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TexttselectModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FaIcon(
                FontAwesomeIcons.users,
                color: _theme.primaryBackground,
                size: 24.0,
              ),
              wrapWithModel(
                model: _model.textcomponentModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: TextcomponentWidget(
                  nombre: widget.text,
                  pagselect: widget.pagselect,
                ),
              ),
            ].divide(SizedBox(width: 10.0)),
          ),
        ].divide(SizedBox(width: 10.0)),
      ),
    );
  }
}
