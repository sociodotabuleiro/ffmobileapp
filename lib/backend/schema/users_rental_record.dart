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

  // "renterId" field.
  DocumentReference? _renterId;
  DocumentReference? get renterId => _renterId;
  bool hasRenterId() => _renterId != null;

  // "rentingId" field.
  DocumentReference? _rentingId;
  DocumentReference? get rentingId => _rentingId;
  bool hasRentingId() => _rentingId != null;

  void _initializeFields() {
    _renterId = snapshotData['renterId'] as DocumentReference?;
    _rentingId = snapshotData['rentingId'] as DocumentReference?;
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
  DocumentReference? renterId,
  DocumentReference? rentingId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'renterId': renterId,
      'rentingId': rentingId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRentalRecordDocumentEquality implements Equality<UsersRentalRecord> {
  const UsersRentalRecordDocumentEquality();

  @override
  bool equals(UsersRentalRecord? e1, UsersRentalRecord? e2) {
    return e1?.renterId == e2?.renterId && e1?.rentingId == e2?.rentingId;
  }

  @override
  int hash(UsersRentalRecord? e) =>
      const ListEquality().hash([e?.renterId, e?.rentingId]);

  @override
  bool isValidKey(Object? o) => o is UsersRentalRecord;
}
