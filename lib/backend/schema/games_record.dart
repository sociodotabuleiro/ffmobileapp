import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GamesRecord extends FirestoreRecord {
  GamesRecord._(
    super.reference,
    super.data,
  ) {
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

  // "playerCount" field.
  String? _playerCount;
  String get playerCount => _playerCount ?? '';
  bool hasPlayerCount() => _playerCount != null;

  // "playTime" field.
  String? _playTime;
  String get playTime => _playTime ?? '';
  bool hasPlayTime() => _playTime != null;

  // "ageRecommendation" field.
  String? _ageRecommendation;
  String get ageRecommendation => _ageRecommendation ?? '';
  bool hasAgeRecommendation() => _ageRecommendation != null;

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

  void _initializeFields() {
    _gameID = snapshotData['gameID'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _playerCount = snapshotData['playerCount'] as String?;
    _playTime = snapshotData['playTime'] as String?;
    _ageRecommendation = snapshotData['ageRecommendation'] as String?;
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
  String? playerCount,
  String? playTime,
  String? ageRecommendation,
  double? averagePrice,
  double? rating,
  String? thumbnailUrl,
  int? timesRented,
  int? timesFavorited,
  int? timesWishlisted,
  bool? availableToRent,
  int? quantityAvailable,
  String? thumbnailBluehash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gameID': gameID,
      'name': name,
      'description': description,
      'playerCount': playerCount,
      'playTime': playTime,
      'ageRecommendation': ageRecommendation,
      'averagePrice': averagePrice,
      'rating': rating,
      'thumbnailUrl': thumbnailUrl,
      'timesRented': timesRented,
      'timesFavorited': timesFavorited,
      'timesWishlisted': timesWishlisted,
      'availableToRent': availableToRent,
      'quantityAvailable': quantityAvailable,
      'thumbnailBluehash': thumbnailBluehash,
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
        e1?.playerCount == e2?.playerCount &&
        e1?.playTime == e2?.playTime &&
        e1?.ageRecommendation == e2?.ageRecommendation &&
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
        listEquality.equals(e1?.galleryBluehash, e2?.galleryBluehash);
  }

  @override
  int hash(GamesRecord? e) => const ListEquality().hash([
        e?.gameID,
        e?.name,
        e?.description,
        e?.categories,
        e?.playerCount,
        e?.playTime,
        e?.ageRecommendation,
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
        e?.galleryBluehash
      ]);

  @override
  bool isValidKey(Object? o) => o is GamesRecord;
}
