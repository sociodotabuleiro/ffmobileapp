import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritedGamesRecord extends FirestoreRecord {
  FavoritedGamesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "gameRef" field.
  DocumentReference? _gameRef;
  DocumentReference? get gameRef => _gameRef;
  bool hasGameRef() => _gameRef != null;

  // "dateAdded" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _gameRef = snapshotData['gameRef'] as DocumentReference?;
    _dateAdded = snapshotData['dateAdded'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('favoritedGames')
          : FirebaseFirestore.instance.collectionGroup('favoritedGames');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('favoritedGames').doc(id);

  static Stream<FavoritedGamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritedGamesRecord.fromSnapshot(s));

  static Future<FavoritedGamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritedGamesRecord.fromSnapshot(s));

  static FavoritedGamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritedGamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritedGamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritedGamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritedGamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritedGamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritedGamesRecordData({
  DocumentReference? gameRef,
  DateTime? dateAdded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gameRef': gameRef,
      'dateAdded': dateAdded,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritedGamesRecordDocumentEquality
    implements Equality<FavoritedGamesRecord> {
  const FavoritedGamesRecordDocumentEquality();

  @override
  bool equals(FavoritedGamesRecord? e1, FavoritedGamesRecord? e2) {
    return e1?.gameRef == e2?.gameRef && e1?.dateAdded == e2?.dateAdded;
  }

  @override
  int hash(FavoritedGamesRecord? e) =>
      const ListEquality().hash([e?.gameRef, e?.dateAdded]);

  @override
  bool isValidKey(Object? o) => o is FavoritedGamesRecord;
}
