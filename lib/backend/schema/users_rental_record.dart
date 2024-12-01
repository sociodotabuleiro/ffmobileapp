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

  // "ownerId" field.
  DocumentReference? _ownerId;
  DocumentReference? get ownerId => _ownerId;
  bool hasOwnerId() => _ownerId != null;

  // "ownerRentalsId" field.
  DocumentReference? _ownerRentalsId;
  DocumentReference? get ownerRentalsId => _ownerRentalsId;
  bool hasOwnerRentalsId() => _ownerRentalsId != null;

  // "renterRentalsId" field.
  DocumentReference? _renterRentalsId;
  DocumentReference? get renterRentalsId => _renterRentalsId;
  bool hasRenterRentalsId() => _renterRentalsId != null;

  void _initializeFields() {
    _renterId = snapshotData['renterId'] as DocumentReference?;
    _ownerId = snapshotData['ownerId'] as DocumentReference?;
    _ownerRentalsId = snapshotData['ownerRentalsId'] as DocumentReference?;
    _renterRentalsId = snapshotData['renterRentalsId'] as DocumentReference?;
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
  DocumentReference? ownerId,
  DocumentReference? ownerRentalsId,
  DocumentReference? renterRentalsId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'renterId': renterId,
      'ownerId': ownerId,
      'ownerRentalsId': ownerRentalsId,
      'renterRentalsId': renterRentalsId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRentalRecordDocumentEquality implements Equality<UsersRentalRecord> {
  const UsersRentalRecordDocumentEquality();

  @override
  bool equals(UsersRentalRecord? e1, UsersRentalRecord? e2) {
    return e1?.renterId == e2?.renterId &&
        e1?.ownerId == e2?.ownerId &&
        e1?.ownerRentalsId == e2?.ownerRentalsId &&
        e1?.renterRentalsId == e2?.renterRentalsId;
  }

  @override
  int hash(UsersRentalRecord? e) => const ListEquality()
      .hash([e?.renterId, e?.ownerId, e?.ownerRentalsId, e?.renterRentalsId]);

  @override
  bool isValidKey(Object? o) => o is UsersRentalRecord;
}
