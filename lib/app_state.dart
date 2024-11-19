import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
      _myGamesId = (await secureStorage.getStringList('ff_myGamesId'))
              ?.map((path) => path.ref)
              .toList() ??
          _myGamesId;
    });
    await _safeInitAsync(() async {
      _myGamesGameRef = (await secureStorage.getStringList('ff_myGamesGameRef'))
              ?.map((path) => path.ref)
              .toList() ??
          _myGamesGameRef;
    });
    await _safeInitAsync(() async {
      _SdtWalletId =
          await secureStorage.getString('ff_SdtWalletId') ?? _SdtWalletId;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_SdTPix') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_SdTPix') ?? '{}';
          _SdTPix =
              PixKeyStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _favoritedGames = (await secureStorage.getStringList('ff_favoritedGames'))
              ?.map((path) => path.ref)
              .toList() ??
          _favoritedGames;
    });
    await _safeInitAsync(() async {
      _wishlist = (await secureStorage.getStringList('ff_wishlist'))
              ?.map((path) => path.ref)
              .toList() ??
          _wishlist;
    });
    await _safeInitAsync(() async {
      _featuredGames = (await secureStorage.getStringList('ff_featuredGames'))
              ?.map((path) => path.ref)
              .toList() ??
          _featuredGames;
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

  double _minValuePriceFilter = 0.0;
  double get minValuePriceFilter => _minValuePriceFilter;
  set minValuePriceFilter(double value) {
    _minValuePriceFilter = value;
  }

  double _maxValuePriceFilter = 0.0;
  double get maxValuePriceFilter => _maxValuePriceFilter;
  set maxValuePriceFilter(double value) {
    _maxValuePriceFilter = value;
  }

  List<DocumentReference> _myGamesId = [];
  List<DocumentReference> get myGamesId => _myGamesId;
  set myGamesId(List<DocumentReference> value) {
    _myGamesId = value;
    secureStorage.setStringList(
        'ff_myGamesId', value.map((x) => x.path).toList());
  }

  void deleteMyGamesId() {
    secureStorage.delete(key: 'ff_myGamesId');
  }

  void addToMyGamesId(DocumentReference value) {
    myGamesId.add(value);
    secureStorage.setStringList(
        'ff_myGamesId', _myGamesId.map((x) => x.path).toList());
  }

  void removeFromMyGamesId(DocumentReference value) {
    myGamesId.remove(value);
    secureStorage.setStringList(
        'ff_myGamesId', _myGamesId.map((x) => x.path).toList());
  }

  void removeAtIndexFromMyGamesId(int index) {
    myGamesId.removeAt(index);
    secureStorage.setStringList(
        'ff_myGamesId', _myGamesId.map((x) => x.path).toList());
  }

  void updateMyGamesIdAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myGamesId[index] = updateFn(_myGamesId[index]);
    secureStorage.setStringList(
        'ff_myGamesId', _myGamesId.map((x) => x.path).toList());
  }

  void insertAtIndexInMyGamesId(int index, DocumentReference value) {
    myGamesId.insert(index, value);
    secureStorage.setStringList(
        'ff_myGamesId', _myGamesId.map((x) => x.path).toList());
  }

  List<DocumentReference> _myGamesGameRef = [];
  List<DocumentReference> get myGamesGameRef => _myGamesGameRef;
  set myGamesGameRef(List<DocumentReference> value) {
    _myGamesGameRef = value;
    secureStorage.setStringList(
        'ff_myGamesGameRef', value.map((x) => x.path).toList());
  }

  void deleteMyGamesGameRef() {
    secureStorage.delete(key: 'ff_myGamesGameRef');
  }

  void addToMyGamesGameRef(DocumentReference value) {
    myGamesGameRef.add(value);
    secureStorage.setStringList(
        'ff_myGamesGameRef', _myGamesGameRef.map((x) => x.path).toList());
  }

  void removeFromMyGamesGameRef(DocumentReference value) {
    myGamesGameRef.remove(value);
    secureStorage.setStringList(
        'ff_myGamesGameRef', _myGamesGameRef.map((x) => x.path).toList());
  }

  void removeAtIndexFromMyGamesGameRef(int index) {
    myGamesGameRef.removeAt(index);
    secureStorage.setStringList(
        'ff_myGamesGameRef', _myGamesGameRef.map((x) => x.path).toList());
  }

  void updateMyGamesGameRefAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myGamesGameRef[index] = updateFn(_myGamesGameRef[index]);
    secureStorage.setStringList(
        'ff_myGamesGameRef', _myGamesGameRef.map((x) => x.path).toList());
  }

  void insertAtIndexInMyGamesGameRef(int index, DocumentReference value) {
    myGamesGameRef.insert(index, value);
    secureStorage.setStringList(
        'ff_myGamesGameRef', _myGamesGameRef.map((x) => x.path).toList());
  }

  PurchaseComponentsStruct _purchaseData = PurchaseComponentsStruct();
  PurchaseComponentsStruct get purchaseData => _purchaseData;
  set purchaseData(PurchaseComponentsStruct value) {
    _purchaseData = value;
  }

  void updatePurchaseDataStruct(Function(PurchaseComponentsStruct) updateFn) {
    updateFn(_purchaseData);
  }

  DocumentReference? _ownerRefPurchase;
  DocumentReference? get ownerRefPurchase => _ownerRefPurchase;
  set ownerRefPurchase(DocumentReference? value) {
    _ownerRefPurchase = value;
  }

  DateTime? _dueDatePurchase;
  DateTime? get dueDatePurchase => _dueDatePurchase;
  set dueDatePurchase(DateTime? value) {
    _dueDatePurchase = value;
  }

  List<DateTime> _selectedDatesPurchase = [];
  List<DateTime> get selectedDatesPurchase => _selectedDatesPurchase;
  set selectedDatesPurchase(List<DateTime> value) {
    _selectedDatesPurchase = value;
  }

  DocumentReference? _game = FirebaseFirestore.instance
      .doc('/users/9M9Fpivtwvgz0zs1hFwG5tl99Oo2/myGames/Y5NZriREx7uCghsfTmpE');
  DocumentReference? get game => _game;
  set game(DocumentReference? value) {
    _game = value;
  }

  List<String> _fbTimestamp = ['\t1725246000', '\t1725332400', '\t1725418800'];
  List<String> get fbTimestamp => _fbTimestamp;
  set fbTimestamp(List<String> value) {
    _fbTimestamp = value;
  }

  void addToFbTimestamp(String value) {
    fbTimestamp.add(value);
  }

  void removeFromFbTimestamp(String value) {
    fbTimestamp.remove(value);
  }

  void removeAtIndexFromFbTimestamp(int index) {
    fbTimestamp.removeAt(index);
  }

  void updateFbTimestampAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fbTimestamp[index] = updateFn(_fbTimestamp[index]);
  }

  void insertAtIndexInFbTimestamp(int index, String value) {
    fbTimestamp.insert(index, value);
  }

  DeliveryDataStruct _deliveryData = DeliveryDataStruct();
  DeliveryDataStruct get deliveryData => _deliveryData;
  set deliveryData(DeliveryDataStruct value) {
    _deliveryData = value;
  }

  void updateDeliveryDataStruct(Function(DeliveryDataStruct) updateFn) {
    updateFn(_deliveryData);
  }

  String _SdtWalletId = 'ac106fd5-2b59-4c05-b6b9-0db299574d87';
  String get SdtWalletId => _SdtWalletId;
  set SdtWalletId(String value) {
    _SdtWalletId = value;
    secureStorage.setString('ff_SdtWalletId', value);
  }


  String _externalReference = '';
  String get externalReference => _externalReference;
  set externalReference(String value) {
    _externalReference = value;
  }

  void deleteSdtWalletId() {
    secureStorage.delete(key: 'ff_SdtWalletId');
  }

  PixKeyStruct _SdTPix = PixKeyStruct.fromSerializableMap(jsonDecode(
      '{\"id\":\"51dd3178-7f2c-4210-b98c-eab575b0a6bd\",\"key\":\"b1484262-4f12-4d82-9406-5bea18c1119e\",\"type\":\"EVP\",\"status\":\"ACTIVE\",\"dateCreated\":\"2024-09-24 19:50:31\",\"canBeDeleted\":\"true\",\"qrCode\":\"{\\\"encodedImage\\\":\\\"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\\\",\\\"payload\\\":\\\"00020126580014br.gov.bcb.pix0136b1484262-4f12-4d82-9406-5bea18c1119e5204000053039865802BR5925BFF COMERCIO E SERVICOS L6008Campinas62290525SOCIODOT00000365848308ASA6304B316\\\",\\\"qrCodeImage\\\":\\\"https://firebasestorage.googleapis.com/v0/b/sociodotabuleiro-jogos/o/public%2Fimg%2Fsystem%2FqrCode.png?alt=media&token=d3a81b46-4408-4db1-97cb-7c657698fb8b\\\"}\"}'));
  PixKeyStruct get SdTPix => _SdTPix;
  set SdTPix(PixKeyStruct value) {
    _SdTPix = value;
    secureStorage.setString('ff_SdTPix', value.serialize());
  }

  void deleteSdTPix() {
    secureStorage.delete(key: 'ff_SdTPix');
  }

  void updateSdTPixStruct(Function(PixKeyStruct) updateFn) {
    updateFn(_SdTPix);
    secureStorage.setString('ff_SdTPix', _SdTPix.serialize());
  }

  String _currentHmacAuth = '';
  String get currentHmacAuth => _currentHmacAuth;
  set currentHmacAuth(String value) {
    _currentHmacAuth = value;
  }

  List<DocumentReference> _favoritedGames = [];
  List<DocumentReference> get favoritedGames => _favoritedGames;
  set favoritedGames(List<DocumentReference> value) {
    _favoritedGames = value;
    secureStorage.setStringList(
        'ff_favoritedGames', value.map((x) => x.path).toList());
  }

  void deleteFavoritedGames() {
    secureStorage.delete(key: 'ff_favoritedGames');
  }

  void addToFavoritedGames(DocumentReference value) {
    favoritedGames.add(value);
    secureStorage.setStringList(
        'ff_favoritedGames', _favoritedGames.map((x) => x.path).toList());
  }

  void removeFromFavoritedGames(DocumentReference value) {
    favoritedGames.remove(value);
    secureStorage.setStringList(
        'ff_favoritedGames', _favoritedGames.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavoritedGames(int index) {
    favoritedGames.removeAt(index);
    secureStorage.setStringList(
        'ff_favoritedGames', _favoritedGames.map((x) => x.path).toList());
  }

  void updateFavoritedGamesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favoritedGames[index] = updateFn(_favoritedGames[index]);
    secureStorage.setStringList(
        'ff_favoritedGames', _favoritedGames.map((x) => x.path).toList());
  }

  void insertAtIndexInFavoritedGames(int index, DocumentReference value) {
    favoritedGames.insert(index, value);
    secureStorage.setStringList(
        'ff_favoritedGames', _favoritedGames.map((x) => x.path).toList());
  }

  List<DocumentReference> _wishlist = [];
  List<DocumentReference> get wishlist => _wishlist;
  set wishlist(List<DocumentReference> value) {
    _wishlist = value;
    secureStorage.setStringList(
        'ff_wishlist', value.map((x) => x.path).toList());
  }

  void deleteWishlist() {
    secureStorage.delete(key: 'ff_wishlist');
  }

  void addToWishlist(DocumentReference value) {
    wishlist.add(value);
    secureStorage.setStringList(
        'ff_wishlist', _wishlist.map((x) => x.path).toList());
  }

  void removeFromWishlist(DocumentReference value) {
    wishlist.remove(value);
    secureStorage.setStringList(
        'ff_wishlist', _wishlist.map((x) => x.path).toList());
  }

  void removeAtIndexFromWishlist(int index) {
    wishlist.removeAt(index);
    secureStorage.setStringList(
        'ff_wishlist', _wishlist.map((x) => x.path).toList());
  }

  void updateWishlistAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    wishlist[index] = updateFn(_wishlist[index]);
    secureStorage.setStringList(
        'ff_wishlist', _wishlist.map((x) => x.path).toList());
  }

  void insertAtIndexInWishlist(int index, DocumentReference value) {
    wishlist.insert(index, value);
    secureStorage.setStringList(
        'ff_wishlist', _wishlist.map((x) => x.path).toList());
  }

  List<GameToAddStruct> _gamesToAdd = [];
  List<GameToAddStruct> get gamesToAdd => _gamesToAdd;
  set gamesToAdd(List<GameToAddStruct> value) {
    _gamesToAdd = value;
  }

  void addToGamesToAdd(GameToAddStruct value) {
    gamesToAdd.add(value);
  }

  void removeFromGamesToAdd(GameToAddStruct value) {
    gamesToAdd.remove(value);
  }

  void removeAtIndexFromGamesToAdd(int index) {
    gamesToAdd.removeAt(index);
  }

  void updateGamesToAddAtIndex(
    int index,
    GameToAddStruct Function(GameToAddStruct) updateFn,
  ) {
    gamesToAdd[index] = updateFn(_gamesToAdd[index]);
  }

  void insertAtIndexInGamesToAdd(int index, GameToAddStruct value) {
    gamesToAdd.insert(index, value);
  }

  List<DocumentReference> _featuredGames = [];
  List<DocumentReference> get featuredGames => _featuredGames;
  set featuredGames(List<DocumentReference> value) {
    _featuredGames = value;
    secureStorage.setStringList(
        'ff_featuredGames', value.map((x) => x.path).toList());
  }

  void deleteFeaturedGames() {
    secureStorage.delete(key: 'ff_featuredGames');
  }

  void addToFeaturedGames(DocumentReference value) {
    featuredGames.add(value);
    secureStorage.setStringList(
        'ff_featuredGames', _featuredGames.map((x) => x.path).toList());
  }

  void removeFromFeaturedGames(DocumentReference value) {
    featuredGames.remove(value);
    secureStorage.setStringList(
        'ff_featuredGames', _featuredGames.map((x) => x.path).toList());
  }

  void removeAtIndexFromFeaturedGames(int index) {
    featuredGames.removeAt(index);
    secureStorage.setStringList(
        'ff_featuredGames', _featuredGames.map((x) => x.path).toList());
  }

  void updateFeaturedGamesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    featuredGames[index] = updateFn(_featuredGames[index]);
    secureStorage.setStringList(
        'ff_featuredGames', _featuredGames.map((x) => x.path).toList());
  }

  void insertAtIndexInFeaturedGames(int index, DocumentReference value) {
    featuredGames.insert(index, value);
    secureStorage.setStringList(
        'ff_featuredGames', _featuredGames.map((x) => x.path).toList());
  }

  DocumentReference? _choosenRentUserRef;
  DocumentReference? get choosenRentUserRef => _choosenRentUserRef;
  set choosenRentUserRef(DocumentReference? value) {
    _choosenRentUserRef = value;
  }

  List<DateTime> _choosenRentDates = [];
  List<DateTime> get choosenRentDates => _choosenRentDates;
  set choosenRentDates(List<DateTime> value) {
    _choosenRentDates = value;
  }

  void addToChoosenRentDates(DateTime value) {
    choosenRentDates.add(value);
  }

  void removeFromChoosenRentDates(DateTime value) {
    choosenRentDates.remove(value);
  }

  void removeAtIndexFromChoosenRentDates(int index) {
    choosenRentDates.removeAt(index);
  }

  void updateChoosenRentDatesAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    choosenRentDates[index] = updateFn(_choosenRentDates[index]);
  }

  void insertAtIndexInChoosenRentDates(int index, DateTime value) {
    choosenRentDates.insert(index, value);
  }

  DocumentReference? _renterRef;
  DocumentReference? get renterRef => _renterRef;
  set renterRef(DocumentReference? value) {
    _renterRef = value;
  }

  List<QuotationsStruct> _quotations = [];
  List<QuotationsStruct> get quotations => _quotations;
  set quotations(List<QuotationsStruct> value) {
    _quotations = value;
  }

  void addToQuotations(QuotationsStruct value) {
    quotations.add(value);
  }

  void removeFromQuotations(QuotationsStruct value) {
    quotations.remove(value);
  }

  void removeAtIndexFromQuotations(int index) {
    quotations.removeAt(index);
  }

  void updateQuotationsAtIndex(
    int index,
    QuotationsStruct Function(QuotationsStruct) updateFn,
  ) {
    quotations[index] = updateFn(_quotations[index]);
  }

  void insertAtIndexInQuotations(int index, QuotationsStruct value) {
    quotations.insert(index, value);
  }

  List<DocumentReference> _notifications = [];

  List<DocumentReference> get notifications => _notifications;

  set notifications(List<DocumentReference> value) {
    _notifications = value;
  }

  void addToNotifications(DocumentReference value) {
    notifications.add(value);
  }

  void removeFromNotifications(DocumentReference value) {
    notifications.remove(value);
  }

  void removeAtIndexFromNotifications(int index) {
    notifications.removeAt(index);
  }

  void updateNotificationsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    notifications[index] = updateFn(_notifications[index]);
  }

  void insertAtIndexInNotifications(int index, DocumentReference value) {
    notifications.insert(index, value);
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

