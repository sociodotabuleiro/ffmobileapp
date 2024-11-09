import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import '/backend/supabase/supabase.dart';
import 'backend/firebase/firebase_config.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'index.dart';

import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '/auth/get_fcm_token.dart';

import 'package:uni_links/uni_links.dart';

import 'deep_link_handler.dart';
import 'package:logger/logger.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

final Logger _logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await checkAppVersion();

  final environmentValues = FFDevEnvironmentValues();
  await environmentValues.initialize();

  await initFirebase();

  await SupaFlow.initialize();

  await FlutterFlowTheme.initialize();

  // Set up FCM token refresh listener
  setupFcmTokenListener();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  final calendar_iagfh0AppState = calendar_iagfh0_app_state.FFAppState();
  await calendar_iagfh0AppState.initializePersistedState();

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => appState,
      ),
      ChangeNotifierProvider(
        create: (context) => calendar_iagfh0AppState,
      ),
    ],
    child: MyApp(
        analytics: analytics,
        observer: observer,),
  ));
}

void setupFcmTokenListener() {
  // Initial FCM token check and add if necessary
  FirebaseMessaging.instance.getToken().then((fcmToken) {
    if (fcmToken != null) {
      addFcmTokenIfNotExists(
        fcmToken,
        Platform.isIOS ? 'iOS' : 'Android',
      );
    }
  });

  // Listen for token refresh events
  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
    addFcmTokenIfNotExists(
      newToken,
      Platform.isIOS ? 'iOS' : 'Android',
    );
  });
}

Future<void> checkAppVersion() async {
  final prefs = await SharedPreferences.getInstance();
  final currentVersion = (await PackageInfo.fromPlatform()).version;
  final cachedVersion = prefs.getString('app_version');

  if (cachedVersion == null || cachedVersion != currentVersion) {
    await clearAppCache(preserveUserSession: true);
    await prefs.setString('app_version', currentVersion);
  }
}

Future<void> clearAppCache({bool preserveUserSession = true}) async {
  // Use your cache-clearing approach here. For example, you can use FlutterSecureStorage or SharedPreferences.
  final prefs = await SharedPreferences.getInstance();
  
  // Preserve user authentication session if needed
  if (preserveUserSession) {
    final userToken = prefs.getString('auth_token'); // Store user auth token
    await prefs.clear(); // Clear all cached data
    if (userToken != null) {
      await prefs.setString('auth_token', userToken); // Restore auth token
    }
  } else {
    await prefs.clear(); // Clear all data without preserving session
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  MyApp({required this.analytics, required this.observer});
  
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
     _initDeepLinkListener();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier,  observers: [widget.observer]);
    userStream = sociodotabuleiroFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 2000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void _initDeepLinkListener() {
    _sub = uriLinkStream.listen((Uri? uri) async {
      if (uri != null && uri.scheme == 'com.sociodotabuleiro.app') {
        final navigationData = await handleIncomingUri(uri);
        if (mounted && navigationData != null) {
          GoRouter.of(context).go(
            navigationData['route'],
            extra: navigationData['extra'],
          );
        }
      }
    }, onError: (err) {
      _logger.e('Failed to handle URI: $err');
    });
  }


  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    _sub?.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'sociodotabuleiro',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('pt'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
