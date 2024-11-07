import 'dart:async';
import 'dart:convert';
import 'serialization_util.dart';
import '../backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/logo_sdt.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'login': ParameterData.none(),
  'addProfilePersonalInfo': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'addProfileAddress': ParameterData.none(),
  'addProfileGames': ParameterData.none(),
  'addProfilePicture': ParameterData.none(),
  'addProfilePhoneNumber': ParameterData.none(),
  'addProfileCodeConfirmation': ParameterData.none(),
  'gamesList': ParameterData.none(),
  'Profile': ParameterData.none(),
  'gameDetails': (data) async {
    final allParams = {
      'gameObject': await getDocumentParameter<GamesRecord>(
          data, 'gameObject', GamesRecord.fromSnapshot),
      'gameName': getParameter<String>(data, 'gameName'),
    };
    return ParameterData(
      requiredParams: {
        'gameName': serializeParam(
          allParams['gameName'],
          ParamType.String,
        ),
      },
      allParams: allParams,
    );
  },
  'toRentList': (data) async => ParameterData(
        allParams: {
          'gameObject': await getDocumentParameter<GamesRecord>(
              data, 'gameObject', GamesRecord.fromSnapshot),
        },
      ),
  'addProfileAddress2': ParameterData.none(),
  'signUp': ParameterData.none(),
  'DashboardResponsive': ParameterData.none(),
  'gameListAdmin': ParameterData.none(),
  'myGames': ParameterData.none(),
  'myCart': ParameterData.none(),
  'payment01': ParameterData.none(),
  'Checkout': ParameterData.none(),
  'saveActions': ParameterData.none(),
  'AddGames': ParameterData.none(),
  'loginLudopedia': ParameterData.none(),
  'deliveryStatus': ParameterData.none(),
  'termandconditions': ParameterData.none(),
  'changePassword': ParameterData.none(),
  'Settings1Notifications': ParameterData.none(),
  'Settings2EditProfile': ParameterData.none(),
  'SettingsListAddress': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
