import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeaturedGamesRecord extends FirestoreRecord {
  FeaturedGamesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "gameName" field.
  String? _gameName;
  String get gameName => _gameName ?? '';
  bool hasGameName() => _gameName != null;

  // "gameRef" field.
  DocumentReference? _gameRef;
  DocumentReference? get gameRef => _gameRef;
  bool hasGameRef() => _gameRef != null;

  // "gamePicture" field.
  String? _gamePicture;
  String get gamePicture => _gamePicture ?? '';
  bool hasGamePicture() => _gamePicture != null;

  void _initializeFields() {
    _gameName = snapshotData['gameName'] as String?;
    _gameRef = snapshotData['gameRef'] as DocumentReference?;
    _gamePicture = snapshotData['gamePicture'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('featuredGames');

  static Stream<FeaturedGamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeaturedGamesRecord.fromSnapshot(s));

  static Future<FeaturedGamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeaturedGamesRecord.fromSnapshot(s));

  static FeaturedGamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeaturedGamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeaturedGamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeaturedGamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeaturedGamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeaturedGamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeaturedGamesRecordData({
  String? gameName,
  DocumentReference? gameRef,
  String? gamePicture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gameName': gameName,
      'gameRef': gameRef,
      'gamePicture': gamePicture,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeaturedGamesRecordDocumentEquality
    implements Equality<FeaturedGamesRecord> {
  const FeaturedGamesRecordDocumentEquality();

  @override
  bool equals(FeaturedGamesRecord? e1, FeaturedGamesRecord? e2) {
    return e1?.gameName == e2?.gameName &&
        e1?.gameRef == e2?.gameRef &&
        e1?.gamePicture == e2?.gamePicture;
  }

  @override
  int hash(FeaturedGamesRecord? e) =>
      const ListEquality().hash([e?.gameName, e?.gameRef, e?.gamePicture]);

  @override
  bool isValidKey(Object? o) => o is FeaturedGamesRecord;
}
