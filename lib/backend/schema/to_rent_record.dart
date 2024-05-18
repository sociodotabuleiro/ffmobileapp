import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToRentRecord extends FirestoreRecord {
  ToRentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "gameRef" field.
  DocumentReference? _gameRef;
  DocumentReference? get gameRef => _gameRef;
  bool hasGameRef() => _gameRef != null;

  // "availableDates" field.
  List<DateTime>? _availableDates;
  List<DateTime> get availableDates => _availableDates ?? const [];
  bool hasAvailableDates() => _availableDates != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _gameRef = snapshotData['gameRef'] as DocumentReference?;
    _availableDates = getDataList(snapshotData['availableDates']);
    _price = castToType<double>(snapshotData['price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('toRent')
          : FirebaseFirestore.instance.collectionGroup('toRent');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('toRent').doc(id);

  static Stream<ToRentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToRentRecord.fromSnapshot(s));

  static Future<ToRentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToRentRecord.fromSnapshot(s));

  static ToRentRecord fromSnapshot(DocumentSnapshot snapshot) => ToRentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToRentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToRentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToRentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToRentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToRentRecordData({
  DocumentReference? gameRef,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gameRef': gameRef,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToRentRecordDocumentEquality implements Equality<ToRentRecord> {
  const ToRentRecordDocumentEquality();

  @override
  bool equals(ToRentRecord? e1, ToRentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.gameRef == e2?.gameRef &&
        listEquality.equals(e1?.availableDates, e2?.availableDates) &&
        e1?.price == e2?.price;
  }

  @override
  int hash(ToRentRecord? e) =>
      const ListEquality().hash([e?.gameRef, e?.availableDates, e?.price]);

  @override
  bool isValidKey(Object? o) => o is ToRentRecord;
}
