import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParamsRecord extends FirestoreRecord {
  ParamsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "history" field.
  List<double>? _history;
  List<double> get history => _history ?? const [];
  bool hasHistory() => _history != null;

  // "last_modified" field.
  DateTime? _lastModified;
  DateTime? get lastModified => _lastModified;
  bool hasLastModified() => _lastModified != null;

  void _initializeFields() {
    _amount = castToType<double>(snapshotData['amount']);
    _history = getDataList(snapshotData['history']);
    _lastModified = snapshotData['last_modified'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('params');

  static Stream<ParamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParamsRecord.fromSnapshot(s));

  static Future<ParamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParamsRecord.fromSnapshot(s));

  static ParamsRecord fromSnapshot(DocumentSnapshot snapshot) => ParamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParamsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParamsRecordData({
  double? amount,
  DateTime? lastModified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'last_modified': lastModified,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParamsRecordDocumentEquality implements Equality<ParamsRecord> {
  const ParamsRecordDocumentEquality();

  @override
  bool equals(ParamsRecord? e1, ParamsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.amount == e2?.amount &&
        listEquality.equals(e1?.history, e2?.history) &&
        e1?.lastModified == e2?.lastModified;
  }

  @override
  int hash(ParamsRecord? e) =>
      const ListEquality().hash([e?.amount, e?.history, e?.lastModified]);

  @override
  bool isValidKey(Object? o) => o is ParamsRecord;
}
