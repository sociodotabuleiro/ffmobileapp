import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _profileUrlImage = await secureStorage.getString('ff_profileUrlImage') ??
          _profileUrlImage;
    });
    await _safeInitAsync(() async {
      _userAddress =
          await secureStorage.getString('ff_userAddress') ?? _userAddress;
    });
    await _safeInitAsync(() async {
      _userAddressLatLng = latLngFromString(
              await secureStorage.getString('ff_userAddressLatLng')) ??
          _userAddressLatLng;
    });
    await _safeInitAsync(() async {
      _followingUsers = (await secureStorage.getStringList('ff_followingUsers'))
              ?.map((path) => path.ref)
              .toList() ??
          _followingUsers;
    });
    await _safeInitAsync(() async {
      _firstSessionlogin =
          await secureStorage.getBool('ff_firstSessionlogin') ??
              _firstSessionlogin;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_wishlistedGames') != null) {
        try {
          _wishlistedGames = jsonDecode(
              await secureStorage.getString('ff_wishlistedGames') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_favoritedGames') != null) {
        try {
          _favoritedGames = jsonDecode(
              await secureStorage.getString('ff_favoritedGames') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_myGames') != null) {
        try {
          _myGames =
              jsonDecode(await secureStorage.getString('ff_myGames') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_myCart') != null) {
        try {
          _myCart =
              jsonDecode(await secureStorage.getString('ff_myCart') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _profileUrlImage = '';
  String get profileUrlImage => _profileUrlImage;
  set profileUrlImage(String value) {
    _profileUrlImage = value;
    secureStorage.setString('ff_profileUrlImage', value);
  }

  void deleteProfileUrlImage() {
    secureStorage.delete(key: 'ff_profileUrlImage');
  }

  String _userAddress = '';
  String get userAddress => _userAddress;
  set userAddress(String value) {
    _userAddress = value;
    secureStorage.setString('ff_userAddress', value);
  }

  void deleteUserAddress() {
    secureStorage.delete(key: 'ff_userAddress');
  }

  LatLng? _userAddressLatLng = const LatLng(-22.9099384, -47.0626332);
  LatLng? get userAddressLatLng => _userAddressLatLng;
  set userAddressLatLng(LatLng? value) {
    _userAddressLatLng = value;
    value != null
        ? secureStorage.setString('ff_userAddressLatLng', value.serialize())
        : secureStorage.remove('ff_userAddressLatLng');
  }

  void deleteUserAddressLatLng() {
    secureStorage.delete(key: 'ff_userAddressLatLng');
  }

  List<DocumentReference> _followingUsers = [];
  List<DocumentReference> get followingUsers => _followingUsers;
  set followingUsers(List<DocumentReference> value) {
    _followingUsers = value;
    secureStorage.setStringList(
        'ff_followingUsers', value.map((x) => x.path).toList());
  }

  void deleteFollowingUsers() {
    secureStorage.delete(key: 'ff_followingUsers');
  }

  void addToFollowingUsers(DocumentReference value) {
    followingUsers.add(value);
    secureStorage.setStringList(
        'ff_followingUsers', _followingUsers.map((x) => x.path).toList());
  }

  void removeFromFollowingUsers(DocumentReference value) {
    followingUsers.remove(value);
    secureStorage.setStringList(
        'ff_followingUsers', _followingUsers.map((x) => x.path).toList());
  }

  void removeAtIndexFromFollowingUsers(int index) {
    followingUsers.removeAt(index);
    secureStorage.setStringList(
        'ff_followingUsers', _followingUsers.map((x) => x.path).toList());
  }

  void updateFollowingUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    followingUsers[index] = updateFn(_followingUsers[index]);
    secureStorage.setStringList(
        'ff_followingUsers', _followingUsers.map((x) => x.path).toList());
  }

  void insertAtIndexInFollowingUsers(int index, DocumentReference value) {
    followingUsers.insert(index, value);
    secureStorage.setStringList(
        'ff_followingUsers', _followingUsers.map((x) => x.path).toList());
  }

  bool _firstSessionlogin = true;
  bool get firstSessionlogin => _firstSessionlogin;
  set firstSessionlogin(bool value) {
    _firstSessionlogin = value;
    secureStorage.setBool('ff_firstSessionlogin', value);
  }

  void deleteFirstSessionlogin() {
    secureStorage.delete(key: 'ff_firstSessionlogin');
  }

  dynamic _wishlistedGames;
  dynamic get wishlistedGames => _wishlistedGames;
  set wishlistedGames(dynamic value) {
    _wishlistedGames = value;
    secureStorage.setString('ff_wishlistedGames', jsonEncode(value));
  }

  void deleteWishlistedGames() {
    secureStorage.delete(key: 'ff_wishlistedGames');
  }

  dynamic _favoritedGames;
  dynamic get favoritedGames => _favoritedGames;
  set favoritedGames(dynamic value) {
    _favoritedGames = value;
    secureStorage.setString('ff_favoritedGames', jsonEncode(value));
  }

  void deleteFavoritedGames() {
    secureStorage.delete(key: 'ff_favoritedGames');
  }

  dynamic _myGames;
  dynamic get myGames => _myGames;
  set myGames(dynamic value) {
    _myGames = value;
    secureStorage.setString('ff_myGames', jsonEncode(value));
  }

  void deleteMyGames() {
    secureStorage.delete(key: 'ff_myGames');
  }

  dynamic _myCart;
  dynamic get myCart => _myCart;
  set myCart(dynamic value) {
    _myCart = value;
    secureStorage.setString('ff_myCart', jsonEncode(value));
  }

  void deleteMyCart() {
    secureStorage.delete(key: 'ff_myCart');
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
