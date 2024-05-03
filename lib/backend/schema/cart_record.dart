import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
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

  // "fromUser" field.
  DocumentReference? _fromUser;
  DocumentReference? get fromUser => _fromUser;
  bool hasFromUser() => _fromUser != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _gameRef = snapshotData['gameRef'] as DocumentReference?;
    _dateAdded = snapshotData['dateAdded'] as DateTime?;
    _fromUser = snapshotData['fromUser'] as DocumentReference?;
    _price = castToType<double>(snapshotData['price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cart')
          : FirebaseFirestore.instance.collectionGroup('cart');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cart').doc(id);

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  DocumentReference? gameRef,
  DateTime? dateAdded,
  DocumentReference? fromUser,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gameRef': gameRef,
      'dateAdded': dateAdded,
      'fromUser': fromUser,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.gameRef == e2?.gameRef &&
        e1?.dateAdded == e2?.dateAdded &&
        e1?.fromUser == e2?.fromUser &&
        e1?.price == e2?.price;
  }

  @override
  int hash(CartRecord? e) => const ListEquality()
      .hash([e?.gameRef, e?.dateAdded, e?.fromUser, e?.price]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
