import 'package:flutter/foundation.dart';
import 'package:sociodotabuleiro/backend/backend.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/modify_address/modify_address_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'settings_list_address_model.dart';
export 'settings_list_address_model.dart';

class SettingsListAddressWidget extends StatefulWidget {
  const SettingsListAddressWidget({super.key});

  @override
  State<SettingsListAddressWidget> createState() =>
      _SettingsListAddressWidgetState();
}

class _SettingsListAddressWidgetState extends State<SettingsListAddressWidget> {
  late SettingsListAddressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsListAddressModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SettingsListAddress'});
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SETTINGS_LIST_ADDRESS_SettingsListAddres');
      logFirebaseEvent('SettingsListAddress_update_page_state');
      _model.address = currentUserDocument?.address;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserReference == null) {
       return Center(child: Text('No user reference available.'));
    }
    else {
        return Title(
        title: 'SettingsListAddress',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector( 
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('SETTINGS_LIST_ADDRESS_arrow_back_rounded');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Endereços',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineMediumFamily),
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: StreamBuilder<DocumentSnapshot>(
              stream: currentUserReference?.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Erro ao carregar dados"));
                } else if (!snapshot.hasData || snapshot.data?.data() == null) {
                  return const Center(child: Text("Nenhum endereço salvo"));
                }

                final addressData = snapshot.data!.data() as Map<String, dynamic>?;
                final address = AddressStruct.fromMap(addressData!['address']);

                return address != null
                    ? _buildAddressContent(context, address)
                    : const Center(child: Text("Nenhum endereço salvo"));
              },
            ),
          ),
        ),
      );
    }
  }

  Widget _buildAddressContent(BuildContext context, AddressStruct address) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Endereços Salvos',
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                            fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                          ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 24.0,
                      buttonSize: 48.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () {
                        // Add new address functionality here
                        if (kDebugMode) {
                          print('Add Address button pressed');
                        }
                      },
                    ),
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            address?.name ?? 'Principal',
                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context).bodyLargeFamily),
                                ),
                          ),
                          Text(
                           '${address?.street ?? ''}, ${address?.number ?? ''}',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                ),
                          ),
                          Text(
                             '${address?.city ?? ''}, ${address?.state ?? ''} - ${address?.zip ?? ''}',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                buttonSize: 40.0,
                                fillColor: const Color(0xFFE3F2FD),
                                icon: Icon(
                                  Icons.edit,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  final updatedAddress = await showModalBottomSheet<AddressStruct>(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => WebViewAware(
                                      child: Padding(
                                        padding: MediaQuery.viewInsetsOf(context),
                                        child: ModifyAddressWidget(address: address),
                                      ),
                                    ),
                                  );
                                   if (updatedAddress != null) {
                                      setState(() {
                                        address = updatedAddress; // Update the state with the new address
                                      });
                                    }
                                  // if (updatedAddress != null) {
                                  //   await currentUserReference!.update({
                                  //     'address': updatedAddress.toMap(), // Ensure toJson() is implemented in AddressStruct
                                  //   });
                                  // }
                                },
                              ),
                              const SizedBox(width: 8.0),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                buttonSize: 40.0,
                                fillColor: const Color(0xFFFFEBEE),
                                icon: Icon(
                                  Icons.delete,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  // await currentUserReference!.update({
                                    // 'address': FieldValue.delete(),
                                  // });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ].around(const SizedBox(height: 24.0)),
      ),
    );
  }
}
