import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "rg" field.
  String? _rg;
  String get rg => _rg ?? '';
  bool hasRg() => _rg != null;

  // "gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  // "birthDate" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "authenticationMethods" field.
  List<AuthDetailsStruct>? _authenticationMethods;
  List<AuthDetailsStruct> get authenticationMethods =>
      _authenticationMethods ?? const [];
  bool hasAuthenticationMethods() => _authenticationMethods != null;

  // "stayLoggedIn" field.
  bool? _stayLoggedIn;
  bool get stayLoggedIn => _stayLoggedIn ?? false;
  bool hasStayLoggedIn() => _stayLoggedIn != null;

  // "badges" field.
  List<BadgesStruct>? _badges;
  List<BadgesStruct> get badges => _badges ?? const [];
  bool hasBadges() => _badges != null;

  // "achievementsAccomplished" field.
  List<DocumentReference>? _achievementsAccomplished;
  List<DocumentReference> get achievementsAccomplished =>
      _achievementsAccomplished ?? const [];
  bool hasAchievementsAccomplished() => _achievementsAccomplished != null;

  // "firstTimeLogin" field.
  bool? _firstTimeLogin;
  bool get firstTimeLogin => _firstTimeLogin ?? false;
  bool hasFirstTimeLogin() => _firstTimeLogin != null;

  // "completedRegister" field.
  bool? _completedRegister;
  bool get completedRegister => _completedRegister ?? false;
  bool hasCompletedRegister() => _completedRegister != null;

  // "favoritedGamesCount" field.
  int? _favoritedGamesCount;
  int get favoritedGamesCount => _favoritedGamesCount ?? 0;
  bool hasFavoritedGamesCount() => _favoritedGamesCount != null;

  // "wishlistCount" field.
  int? _wishlistCount;
  int get wishlistCount => _wishlistCount ?? 0;
  bool hasWishlistCount() => _wishlistCount != null;

  // "cartCount" field.
  int? _cartCount;
  int get cartCount => _cartCount ?? 0;
  bool hasCartCount() => _cartCount != null;

  // "rentedFromCount" field.
  int? _rentedFromCount;
  int get rentedFromCount => _rentedFromCount ?? 0;
  bool hasRentedFromCount() => _rentedFromCount != null;

  // "rentedToCount" field.
  int? _rentedToCount;
  int get rentedToCount => _rentedToCount ?? 0;
  bool hasRentedToCount() => _rentedToCount != null;

  // "amountEarned" field.
  double? _amountEarned;
  double get amountEarned => _amountEarned ?? 0.0;
  bool hasAmountEarned() => _amountEarned != null;

  // "favoriteUsers" field.
  List<DocumentReference>? _favoriteUsers;
  List<DocumentReference> get favoriteUsers => _favoriteUsers ?? const [];
  bool hasFavoriteUsers() => _favoriteUsers != null;

  // "isStore" field.
  bool? _isStore;
  bool get isStore => _isStore ?? false;
  bool hasIsStore() => _isStore != null;

  // "completedRegisterPages" field.
  List<int>? _completedRegisterPages;
  List<int> get completedRegisterPages => _completedRegisterPages ?? const [];
  bool hasCompletedRegisterPages() => _completedRegisterPages != null;

  // "reviews" field.
  List<UserReviewStruct>? _reviews;
  List<UserReviewStruct> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "authorizationCode" field.
  String? _authorizationCode;
  String get authorizationCode => _authorizationCode ?? '';
  bool hasAuthorizationCode() => _authorizationCode != null;

  // "rentedTo" field.
  List<DocumentReference>? _rentedTo;
  List<DocumentReference> get rentedTo => _rentedTo ?? const [];
  bool hasRentedTo() => _rentedTo != null;

  // "rentedFrom" field.
  List<DocumentReference>? _rentedFrom;
  List<DocumentReference> get rentedFrom => _rentedFrom ?? const [];
  bool hasRentedFrom() => _rentedFrom != null;

  // "rentedToIds" field.
  List<DocumentReference>? _rentedToIds;
  List<DocumentReference> get rentedToIds => _rentedToIds ?? const [];
  bool hasRentedToIds() => _rentedToIds != null;

  // "rentedFromIds" field.
  List<DocumentReference>? _rentedFromIds;
  List<DocumentReference> get rentedFromIds => _rentedFromIds ?? const [];
  bool hasRentedFromIds() => _rentedFromIds != null;

  // "walletId" field.
  String? _walletId;
  String get walletId => _walletId ?? '';
  bool hasWalletId() => _walletId != null;

  // "cardOnUse" field.
  CardStruct? _cardOnUse;
  CardStruct get cardOnUse => _cardOnUse ?? CardStruct();
  bool hasCardOnUse() => _cardOnUse != null;

  // "asaasClientId" field.
  String? _asaasClientId;
  String get asaasClientId => _asaasClientId ?? '';
  bool hasAsaasClientId() => _asaasClientId != null;

  // "wantToRentTo" field.
  bool? _wantToRentTo;
  bool get wantToRentTo => _wantToRentTo ?? false;
  bool hasWantToRentTo() => _wantToRentTo != null;

  // "askedToRentTo" field.
  bool? _askedToRentTo;
  bool get askedToRentTo => _askedToRentTo ?? false;
  bool hasAskedToRentTo() => _askedToRentTo != null;

  // "apiKey" field.
  String? _apiKey;
  String get apiKey => _apiKey ?? '';
  bool hasApiKey() => _apiKey != null;

  // "wishlist" field.
  List<DocumentReference>? _wishlist;
  List<DocumentReference> get wishlist => _wishlist ?? const [];
  bool hasWishlist() => _wishlist != null;

  // "favoriteList" field.
  List<DocumentReference>? _favoriteList;
  List<DocumentReference> get favoriteList => _favoriteList ?? const [];
  bool hasFavoriteList() => _favoriteList != null;

  // "addresses" field.
  List<AddressStruct>? _addresses;
  List<AddressStruct> get addresses => _addresses ?? const [];
  bool hasAddresses() => _addresses != null;

  void _initializeFields() {
    _fullName = snapshotData['fullName'] as String?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _cpf = snapshotData['cpf'] as String?;
    _rg = snapshotData['rg'] as String?;
    _gender = deserializeEnum<Gender>(snapshotData['gender']);
    _address = AddressStruct.maybeFromMap(snapshotData['address']);
    _birthDate = snapshotData['birthDate'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _authenticationMethods = getStructList(
      snapshotData['authenticationMethods'],
      AuthDetailsStruct.fromMap,
    );
    _stayLoggedIn = snapshotData['stayLoggedIn'] as bool?;
    _badges = getStructList(
      snapshotData['badges'],
      BadgesStruct.fromMap,
    );
    _achievementsAccomplished =
        getDataList(snapshotData['achievementsAccomplished']);
    _firstTimeLogin = snapshotData['firstTimeLogin'] as bool?;
    _completedRegister = snapshotData['completedRegister'] as bool?;
    _favoritedGamesCount = castToType<int>(snapshotData['favoritedGamesCount']);
    _wishlistCount = castToType<int>(snapshotData['wishlistCount']);
    _cartCount = castToType<int>(snapshotData['cartCount']);
    _rentedFromCount = castToType<int>(snapshotData['rentedFromCount']);
    _rentedToCount = castToType<int>(snapshotData['rentedToCount']);
    _amountEarned = castToType<double>(snapshotData['amountEarned']);
    _favoriteUsers = getDataList(snapshotData['favoriteUsers']);
    _isStore = snapshotData['isStore'] as bool?;
    _completedRegisterPages =
        getDataList(snapshotData['completedRegisterPages']);
    _reviews = getStructList(
      snapshotData['reviews'],
      UserReviewStruct.fromMap,
    );
    _rating = castToType<double>(snapshotData['rating']);
    _authorizationCode = snapshotData['authorizationCode'] as String?;
    _rentedTo = getDataList(snapshotData['rentedTo']);
    _rentedFrom = getDataList(snapshotData['rentedFrom']);
    _rentedToIds = getDataList(snapshotData['rentedToIds']);
    _rentedFromIds = getDataList(snapshotData['rentedFromIds']);
    _walletId = snapshotData['walletId'] as String?;
    _cardOnUse = CardStruct.maybeFromMap(snapshotData['cardOnUse']);
    _asaasClientId = snapshotData['asaasClientId'] as String?;
    _wantToRentTo = snapshotData['wantToRentTo'] as bool?;
    _askedToRentTo = snapshotData['askedToRentTo'] as bool?;
    _apiKey = snapshotData['apiKey'] as String?;
    _wishlist = getDataList(snapshotData['wishlist']);
    _favoriteList = getDataList(snapshotData['favoriteList']);
    _addresses = getStructList(
      snapshotData['addresses'],
      AddressStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? fullName,
  String? firstName,
  String? lastName,
  String? cpf,
  String? rg,
  Gender? gender,
  AddressStruct? address,
  DateTime? birthDate,
  String? email,
  String? uid,
  String? displayName,
  DateTime? createdTime,
  String? photoUrl,
  String? phoneNumber,
  bool? stayLoggedIn,
  bool? firstTimeLogin,
  bool? completedRegister,
  int? favoritedGamesCount,
  int? wishlistCount,
  int? cartCount,
  int? rentedFromCount,
  int? rentedToCount,
  double? amountEarned,
  bool? isStore,
  double? rating,
  String? authorizationCode,
  String? walletId,
  CardStruct? cardOnUse,
  String? asaasClientId,
  bool? wantToRentTo,
  bool? askedToRentTo,
  String? apiKey,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'cpf': cpf,
      'rg': rg,
      'gender': gender,
      'address': AddressStruct().toMap(),
      'birthDate': birthDate,
      'email': email,
      'uid': uid,
      'display_name': displayName,
      'created_time': createdTime,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'stayLoggedIn': stayLoggedIn,
      'firstTimeLogin': firstTimeLogin,
      'completedRegister': completedRegister,
      'favoritedGamesCount': favoritedGamesCount,
      'wishlistCount': wishlistCount,
      'cartCount': cartCount,
      'rentedFromCount': rentedFromCount,
      'rentedToCount': rentedToCount,
      'amountEarned': amountEarned,
      'isStore': isStore,
      'rating': rating,
      'authorizationCode': authorizationCode,
      'walletId': walletId,
      'cardOnUse': CardStruct().toMap(),
      'asaasClientId': asaasClientId,
      'wantToRentTo': wantToRentTo,
      'askedToRentTo': askedToRentTo,
      'apiKey': apiKey,
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  // Handle nested data for "cardOnUse" field.
  addCardStructData(firestoreData, cardOnUse, 'cardOnUse');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fullName == e2?.fullName &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.cpf == e2?.cpf &&
        e1?.rg == e2?.rg &&
        e1?.gender == e2?.gender &&
        e1?.address == e2?.address &&
        e1?.birthDate == e2?.birthDate &&
        e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(
            e1?.authenticationMethods, e2?.authenticationMethods) &&
        e1?.stayLoggedIn == e2?.stayLoggedIn &&
        listEquality.equals(e1?.badges, e2?.badges) &&
        listEquality.equals(
            e1?.achievementsAccomplished, e2?.achievementsAccomplished) &&
        e1?.firstTimeLogin == e2?.firstTimeLogin &&
        e1?.completedRegister == e2?.completedRegister &&
        e1?.favoritedGamesCount == e2?.favoritedGamesCount &&
        e1?.wishlistCount == e2?.wishlistCount &&
        e1?.cartCount == e2?.cartCount &&
        e1?.rentedFromCount == e2?.rentedFromCount &&
        e1?.rentedToCount == e2?.rentedToCount &&
        e1?.amountEarned == e2?.amountEarned &&
        listEquality.equals(e1?.favoriteUsers, e2?.favoriteUsers) &&
        e1?.isStore == e2?.isStore &&
        listEquality.equals(
            e1?.completedRegisterPages, e2?.completedRegisterPages) &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        e1?.rating == e2?.rating &&
        e1?.authorizationCode == e2?.authorizationCode &&
        listEquality.equals(e1?.rentedTo, e2?.rentedTo) &&
        listEquality.equals(e1?.rentedFrom, e2?.rentedFrom) &&
        listEquality.equals(e1?.rentedToIds, e2?.rentedToIds) &&
        listEquality.equals(e1?.rentedFromIds, e2?.rentedFromIds) &&
        e1?.walletId == e2?.walletId &&
        e1?.cardOnUse == e2?.cardOnUse &&
        e1?.asaasClientId == e2?.asaasClientId &&
        e1?.wantToRentTo == e2?.wantToRentTo &&
        e1?.askedToRentTo == e2?.askedToRentTo &&
        e1?.apiKey == e2?.apiKey &&
        listEquality.equals(e1?.wishlist, e2?.wishlist) &&
        listEquality.equals(e1?.favoriteList, e2?.favoriteList) &&
        listEquality.equals(e1?.addresses, e2?.addresses);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.fullName,
        e?.firstName,
        e?.lastName,
        e?.cpf,
        e?.rg,
        e?.gender,
        e?.address,
        e?.birthDate,
        e?.email,
        e?.uid,
        e?.displayName,
        e?.createdTime,
        e?.photoUrl,
        e?.phoneNumber,
        e?.authenticationMethods,
        e?.stayLoggedIn,
        e?.badges,
        e?.achievementsAccomplished,
        e?.firstTimeLogin,
        e?.completedRegister,
        e?.favoritedGamesCount,
        e?.wishlistCount,
        e?.cartCount,
        e?.rentedFromCount,
        e?.rentedToCount,
        e?.amountEarned,
        e?.favoriteUsers,
        e?.isStore,
        e?.completedRegisterPages,
        e?.reviews,
        e?.rating,
        e?.authorizationCode,
        e?.rentedTo,
        e?.rentedFrom,
        e?.rentedToIds,
        e?.rentedFromIds,
        e?.walletId,
        e?.cardOnUse,
        e?.asaasClientId,
        e?.wantToRentTo,
        e?.askedToRentTo,
        e?.apiKey,
        e?.wishlist,
        e?.favoriteList,
        e?.addresses
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
