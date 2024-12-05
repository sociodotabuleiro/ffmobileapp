import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_basic_model.dart';
export 'notification_basic_model.dart';
import '/backend/schema/enums/enums.dart';

class NotificationBasicWidget extends StatefulWidget {
  const NotificationBasicWidget({
    super.key,
    required this.notificationRef,
  });

  final DocumentReference? notificationRef;

  @override
  State<NotificationBasicWidget> createState() =>
      _NotificationBasicWidgetState();
}

class _NotificationBasicWidgetState extends State<NotificationBasicWidget> {
  late NotificationBasicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationBasicModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NOTIFICATION_BASIC_notification_basic_ON');
      logFirebaseEvent('notification_basic_backend_call');
      _model.notificationObject =
          await NotificationsRecord.getDocumentOnce(widget.notificationRef!);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

   

   Widget _getNotificationIcon(NotificationTypes type) {
    switch (type) {
      case NotificationTypes.GAME_RENTED:
      case NotificationTypes.ORDER_ACCEPTED_BY_OWNER:
        return Image.asset(
          'assets/images/pedido_confirmado-8.png',
          width: 24.0,
          height: 24.0,
        );
      case NotificationTypes.SEARCHING_DRIVER:
        return Image.asset(
          'assets/images/pedido_pendente-8.png',
          width: 24.0,
          height: 24.0,
        );
      case NotificationTypes.DRIVER_GOING_RENTER:
      case NotificationTypes.DRIVER_GOING_OWNER:
        return Image.asset(
          'assets/images/pedido_a_entregar-8.png',
          width: 24.0,
          height: 24.0,
        );
      case NotificationTypes.ORDER_DELIVERED_RENTER:
        return Image.asset(
          'assets/images/pedido_entregue-8.png',
          width: 24.0,
          height: 24.0,
        );
      case NotificationTypes.ORDER_DELIVERED_OWNER:
        return Image.asset(
          'assets/images/pedido_devolvido-8.png',
          width: 24.0,
          height: 24.0,
        );
      default:
        return const Icon(
          Icons.notifications,
          color: Color(0xFF4B39EF),
          size: 24.0,
        );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFE6EDF3),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFD1E0FF),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Color(0xFF4B39EF),
                  size: 24.0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _model.notificationObject!.title,
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyLargeFamily),
                              ),
                        ),
                        Text(
                          dateTimeFormat(
                            "relative",
                            _model.notificationObject!.date!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelSmallFamily),
                              ),
                        ),
                      ],
                    ),
                    Text(
                      _model.notificationObject!.message.maybeHandleOverflow(
                        maxChars: 50,
                        replacement: '…',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ].divide(const SizedBox(height: 4.0)),
                ),
              ),
            ].divide(const SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}
