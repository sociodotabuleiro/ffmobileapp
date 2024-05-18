import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _profileUrlImage =
          prefs.getString('ff_profileUrlImage') ?? _profileUrlImage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _profileUrlImage = '';
  String get profileUrlImage => _profileUrlImage;
  set profileUrlImage(String value) {
    _profileUrlImage = value;
    prefs.setString('ff_profileUrlImage', value);
  }

  String _userAddress = '';
  String get userAddress => _userAddress;
  set userAddress(String value) {
    _userAddress = value;
  }

  LatLng? _userAddressLatLng;
  LatLng? get userAddressLatLng => _userAddressLatLng;
  set userAddressLatLng(LatLng? value) {
    _userAddressLatLng = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
