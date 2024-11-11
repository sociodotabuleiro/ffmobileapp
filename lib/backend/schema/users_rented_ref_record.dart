import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRentedRefRecord extends FirestoreRecord {
  UsersRentedRefRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('usersRentedRef')
          : FirebaseFirestore.instance.collectionGroup('usersRentedRef');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('usersRentedRef').doc(id);

  static Stream<UsersRentedRefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRentedRefRecord.fromSnapshot(s));

  static Future<UsersRentedRefRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRentedRefRecord.fromSnapshot(s));

  static UsersRentedRefRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersRentedRefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRentedRefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRentedRefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRentedRefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRentedRefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRentedRefRecordData({
  DocumentReference? userRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRentedRefRecordDocumentEquality
    implements Equality<UsersRentedRefRecord> {
  const UsersRentedRefRecordDocumentEquality();

  @override
  bool equals(UsersRentedRefRecord? e1, UsersRentedRefRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UsersRentedRefRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is UsersRentedRefRecord;
}
