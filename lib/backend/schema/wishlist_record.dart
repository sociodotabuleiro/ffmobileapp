import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WishlistRecord extends FirestoreRecord {
  WishlistRecord._(
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
          ? parent.collection('wishlist')
          : FirebaseFirestore.instance.collectionGroup('wishlist');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('wishlist').doc(id);

  static Stream<WishlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WishlistRecord.fromSnapshot(s));

  static Future<WishlistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WishlistRecord.fromSnapshot(s));

  static WishlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WishlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WishlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WishlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WishlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WishlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWishlistRecordData({
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

class WishlistRecordDocumentEquality implements Equality<WishlistRecord> {
  const WishlistRecordDocumentEquality();

  @override
  bool equals(WishlistRecord? e1, WishlistRecord? e2) {
    return e1?.gameRef == e2?.gameRef && e1?.dateAdded == e2?.dateAdded;
  }

  @override
  int hash(WishlistRecord? e) =>
      const ListEquality().hash([e?.gameRef, e?.dateAdded]);

  @override
  bool isValidKey(Object? o) => o is WishlistRecord;
}
