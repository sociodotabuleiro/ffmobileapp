import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GamesRecord extends FirestoreRecord {
  GamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "gameID" field.
  String? _gameID;
  String get gameID => _gameID ?? '';
  bool hasGameID() => _gameID != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "averagePrice" field.
  double? _averagePrice;
  double get averagePrice => _averagePrice ?? 0.0;
  bool hasAveragePrice() => _averagePrice != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "thumbnailUrl" field.
  String? _thumbnailUrl;
  String get thumbnailUrl => _thumbnailUrl ?? '';
  bool hasThumbnailUrl() => _thumbnailUrl != null;

  // "galleryURLs" field.
  List<String>? _galleryURLs;
  List<String> get galleryURLs => _galleryURLs ?? const [];
  bool hasGalleryURLs() => _galleryURLs != null;

  // "locationAvailability" field.
  List<GameLocationAvailabilityStruct>? _locationAvailability;
  List<GameLocationAvailabilityStruct> get locationAvailability =>
      _locationAvailability ?? const [];
  bool hasLocationAvailability() => _locationAvailability != null;

  // "timesRented" field.
  int? _timesRented;
  int get timesRented => _timesRented ?? 0;
  bool hasTimesRented() => _timesRented != null;

  // "timesFavorited" field.
  int? _timesFavorited;
  int get timesFavorited => _timesFavorited ?? 0;
  bool hasTimesFavorited() => _timesFavorited != null;

  // "timesWishlisted" field.
  int? _timesWishlisted;
  int get timesWishlisted => _timesWishlisted ?? 0;
  bool hasTimesWishlisted() => _timesWishlisted != null;

  // "reviews" field.
  List<GameReviewStruct>? _reviews;
  List<GameReviewStruct> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "availableToRent" field.
  bool? _availableToRent;
  bool get availableToRent => _availableToRent ?? false;
  bool hasAvailableToRent() => _availableToRent != null;

  // "quantityAvailable" field.
  int? _quantityAvailable;
  int get quantityAvailable => _quantityAvailable ?? 0;
  bool hasQuantityAvailable() => _quantityAvailable != null;

  // "achievements" field.
  List<DocumentReference>? _achievements;
  List<DocumentReference> get achievements => _achievements ?? const [];
  bool hasAchievements() => _achievements != null;

  // "thumbnailBluehash" field.
  String? _thumbnailBluehash;
  String get thumbnailBluehash => _thumbnailBluehash ?? '';
  bool hasThumbnailBluehash() => _thumbnailBluehash != null;

  // "galleryBluehash" field.
  List<String>? _galleryBluehash;
  List<String> get galleryBluehash => _galleryBluehash ?? const [];
  bool hasGalleryBluehash() => _galleryBluehash != null;

  // "availableAt" field.
  List<DocumentReference>? _availableAt;
  List<DocumentReference> get availableAt => _availableAt ?? const [];
  bool hasAvailableAt() => _availableAt != null;

  // "availableAtGeoHash" field.
  List<String>? _availableAtGeoHash;
  List<String> get availableAtGeoHash => _availableAtGeoHash ?? const [];
  bool hasAvailableAtGeoHash() => _availableAtGeoHash != null;

  // "bggRating" field.
  double? _bggRating;
  double get bggRating => _bggRating ?? 0.0;
  bool hasBggRating() => _bggRating != null;

  // "bggRanking" field.
  int? _bggRanking;
  int get bggRanking => _bggRanking ?? 0;
  bool hasBggRanking() => _bggRanking != null;

  // "bggWeight" field.
  double? _bggWeight;
  double get bggWeight => _bggWeight ?? 0.0;
  bool hasBggWeight() => _bggWeight != null;

  // "availableAtLatLng" field.
  List<LatLng>? _availableAtLatLng;
  List<LatLng> get availableAtLatLng => _availableAtLatLng ?? const [];
  bool hasAvailableAtLatLng() => _availableAtLatLng != null;

  // "themes" field.
  List<String>? _themes;
  List<String> get themes => _themes ?? const [];
  bool hasThemes() => _themes != null;

  // "mechanics" field.
  List<String>? _mechanics;
  List<String> get mechanics => _mechanics ?? const [];
  bool hasMechanics() => _mechanics != null;

  // "isExpansion" field.
  bool? _isExpansion;
  bool get isExpansion => _isExpansion ?? false;
  bool hasIsExpansion() => _isExpansion != null;

  // "mainGame" field.
  DocumentReference? _mainGame;
  DocumentReference? get mainGame => _mainGame;
  bool hasMainGame() => _mainGame != null;

  // "ageRecommendation" field.
  int? _ageRecommendation;
  int get ageRecommendation => _ageRecommendation ?? 0;
  bool hasAgeRecommendation() => _ageRecommendation != null;

  // "idLdp" field.
  int? _idLdp;
  int get idLdp => _idLdp ?? 0;
  bool hasIdLdp() => _idLdp != null;

  // "playTime" field.
  int? _playTime;
  int get playTime => _playTime ?? 0;
  bool hasPlayTime() => _playTime != null;

  // "playerCountMax" field.
  int? _playerCountMax;
  int get playerCountMax => _playerCountMax ?? 0;
  bool hasPlayerCountMax() => _playerCountMax != null;

  // "playerCountMin" field.
  int? _playerCountMin;
  int get playerCountMin => _playerCountMin ?? 0;
  bool hasPlayerCountMin() => _playerCountMin != null;

  // "releaseYear" field.
  int? _releaseYear;
  int get releaseYear => _releaseYear ?? 0;
  bool hasReleaseYear() => _releaseYear != null;

  // "availableAtMyGamesRef" field.
  List<DocumentReference>? _availableAtMyGamesRef;
  List<DocumentReference> get availableAtMyGamesRef =>
      _availableAtMyGamesRef ?? const [];
  bool hasAvailableAtMyGamesRef() => _availableAtMyGamesRef != null;

  void _initializeFields() {
    _gameID = snapshotData['gameID'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _averagePrice = castToType<double>(snapshotData['averagePrice']);
    _rating = castToType<double>(snapshotData['rating']);
    _thumbnailUrl = snapshotData['thumbnailUrl'] as String?;
    _galleryURLs = getDataList(snapshotData['galleryURLs']);
    _locationAvailability = getStructList(
      snapshotData['locationAvailability'],
      GameLocationAvailabilityStruct.fromMap,
    );
    _timesRented = castToType<int>(snapshotData['timesRented']);
    _timesFavorited = castToType<int>(snapshotData['timesFavorited']);
    _timesWishlisted = castToType<int>(snapshotData['timesWishlisted']);
    _reviews = getStructList(
      snapshotData['reviews'],
      GameReviewStruct.fromMap,
    );
    _availableToRent = snapshotData['availableToRent'] as bool?;
    _quantityAvailable = castToType<int>(snapshotData['quantityAvailable']);
    _achievements = getDataList(snapshotData['achievements']);
    _thumbnailBluehash = snapshotData['thumbnailBluehash'] as String?;
    _galleryBluehash = getDataList(snapshotData['galleryBluehash']);
    _availableAt = getDataList(snapshotData['availableAt']);
    _availableAtGeoHash = getDataList(snapshotData['availableAtGeoHash']);
    _bggRating = castToType<double>(snapshotData['bggRating']);
    _bggRanking = castToType<int>(snapshotData['bggRanking']);
    _bggWeight = castToType<double>(snapshotData['bggWeight']);
    _availableAtLatLng = getDataList(snapshotData['availableAtLatLng']);
    _themes = getDataList(snapshotData['themes']);
    _mechanics = getDataList(snapshotData['mechanics']);
    _isExpansion = snapshotData['isExpansion'] as bool?;
    _mainGame = snapshotData['mainGame'] as DocumentReference?;
    _ageRecommendation = castToType<int>(snapshotData['ageRecommendation']);
    _idLdp = castToType<int>(snapshotData['idLdp']);
    _playTime = castToType<int>(snapshotData['playTime']);
    _playerCountMax = castToType<int>(snapshotData['playerCountMax']);
    _playerCountMin = castToType<int>(snapshotData['playerCountMin']);
    _releaseYear = castToType<int>(snapshotData['releaseYear']);
    _availableAtMyGamesRef = getDataList(snapshotData['availableAtMyGamesRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamesRecord.fromSnapshot(s));

  static Future<GamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GamesRecord.fromSnapshot(s));

  static GamesRecord fromSnapshot(DocumentSnapshot snapshot) => GamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGamesRecordData({
  String? gameID,
  String? name,
  String? description,
  double? averagePrice,
  double? rating,
  String? thumbnailUrl,
  int? timesRented,
  int? timesFavorited,
  int? timesWishlisted,
  bool? availableToRent,
  int? quantityAvailable,
  String? thumbnailBluehash,
  double? bggRating,
  int? bggRanking,
  double? bggWeight,
  bool? isExpansion,
  DocumentReference? mainGame,
  int? ageRecommendation,
  int? idLdp,
  int? playTime,
  int? playerCountMax,
  int? playerCountMin,
  int? releaseYear,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gameID': gameID,
      'name': name,
      'description': description,
      'averagePrice': averagePrice,
      'rating': rating,
      'thumbnailUrl': thumbnailUrl,
      'timesRented': timesRented,
      'timesFavorited': timesFavorited,
      'timesWishlisted': timesWishlisted,
      'availableToRent': availableToRent,
      'quantityAvailable': quantityAvailable,
      'thumbnailBluehash': thumbnailBluehash,
      'bggRating': bggRating,
      'bggRanking': bggRanking,
      'bggWeight': bggWeight,
      'isExpansion': isExpansion,
      'mainGame': mainGame,
      'ageRecommendation': ageRecommendation,
      'idLdp': idLdp,
      'playTime': playTime,
      'playerCountMax': playerCountMax,
      'playerCountMin': playerCountMin,
      'releaseYear': releaseYear,
    }.withoutNulls,
  );

  return firestoreData;
}

class GamesRecordDocumentEquality implements Equality<GamesRecord> {
  const GamesRecordDocumentEquality();

  @override
  bool equals(GamesRecord? e1, GamesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.gameID == e2?.gameID &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.averagePrice == e2?.averagePrice &&
        e1?.rating == e2?.rating &&
        e1?.thumbnailUrl == e2?.thumbnailUrl &&
        listEquality.equals(e1?.galleryURLs, e2?.galleryURLs) &&
        listEquality.equals(
            e1?.locationAvailability, e2?.locationAvailability) &&
        e1?.timesRented == e2?.timesRented &&
        e1?.timesFavorited == e2?.timesFavorited &&
        e1?.timesWishlisted == e2?.timesWishlisted &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        e1?.availableToRent == e2?.availableToRent &&
        e1?.quantityAvailable == e2?.quantityAvailable &&
        listEquality.equals(e1?.achievements, e2?.achievements) &&
        e1?.thumbnailBluehash == e2?.thumbnailBluehash &&
        listEquality.equals(e1?.galleryBluehash, e2?.galleryBluehash) &&
        listEquality.equals(e1?.availableAt, e2?.availableAt) &&
        listEquality.equals(e1?.availableAtGeoHash, e2?.availableAtGeoHash) &&
        e1?.bggRating == e2?.bggRating &&
        e1?.bggRanking == e2?.bggRanking &&
        e1?.bggWeight == e2?.bggWeight &&
        listEquality.equals(e1?.availableAtLatLng, e2?.availableAtLatLng) &&
        listEquality.equals(e1?.themes, e2?.themes) &&
        listEquality.equals(e1?.mechanics, e2?.mechanics) &&
        e1?.isExpansion == e2?.isExpansion &&
        e1?.mainGame == e2?.mainGame &&
        e1?.ageRecommendation == e2?.ageRecommendation &&
        e1?.idLdp == e2?.idLdp &&
        e1?.playTime == e2?.playTime &&
        e1?.playerCountMax == e2?.playerCountMax &&
        e1?.playerCountMin == e2?.playerCountMin &&
        e1?.releaseYear == e2?.releaseYear &&
        listEquality.equals(
            e1?.availableAtMyGamesRef, e2?.availableAtMyGamesRef);
  }

  @override
  int hash(GamesRecord? e) => const ListEquality().hash([
        e?.gameID,
        e?.name,
        e?.description,
        e?.categories,
        e?.averagePrice,
        e?.rating,
        e?.thumbnailUrl,
        e?.galleryURLs,
        e?.locationAvailability,
        e?.timesRented,
        e?.timesFavorited,
        e?.timesWishlisted,
        e?.reviews,
        e?.availableToRent,
        e?.quantityAvailable,
        e?.achievements,
        e?.thumbnailBluehash,
        e?.galleryBluehash,
        e?.availableAt,
        e?.availableAtGeoHash,
        e?.bggRating,
        e?.bggRanking,
        e?.bggWeight,
        e?.availableAtLatLng,
        e?.themes,
        e?.mechanics,
        e?.isExpansion,
        e?.mainGame,
        e?.ageRecommendation,
        e?.idLdp,
        e?.playTime,
        e?.playerCountMax,
        e?.playerCountMin,
        e?.releaseYear,
        e?.availableAtMyGamesRef
      ]);

  @override
  bool isValidKey(Object? o) => o is GamesRecord;
}
