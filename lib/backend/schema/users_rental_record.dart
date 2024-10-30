import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRentalRecord extends FirestoreRecord {
  UsersRentalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rentalsId" field.
  DocumentReference? _rentalsId;
  DocumentReference? get rentalsId => _rentalsId;
  bool hasRentalsId() => _rentalsId != null;

  void _initializeFields() {
    _rentalsId = snapshotData['rentalsId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersRental');

  static Stream<UsersRentalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRentalRecord.fromSnapshot(s));

  static Future<UsersRentalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRentalRecord.fromSnapshot(s));

  static UsersRentalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersRentalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRentalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRentalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRentalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRentalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRentalRecordData({
  DocumentReference? rentalsId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rentalsId': rentalsId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRentalRecordDocumentEquality implements Equality<UsersRentalRecord> {
  const UsersRentalRecordDocumentEquality();

  @override
  bool equals(UsersRentalRecord? e1, UsersRentalRecord? e2) {
    return e1?.rentalsId == e2?.rentalsId;
  }

  @override
  int hash(UsersRentalRecord? e) => const ListEquality().hash([e?.rentalsId]);

  @override
  bool isValidKey(Object? o) => o is UsersRentalRecord;
}
