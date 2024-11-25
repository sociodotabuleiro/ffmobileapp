import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersWishlistedRefRecord extends FirestoreRecord {
  UsersWishlistedRefRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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
          ? parent.collection('usersWishlistedRef')
          : FirebaseFirestore.instance.collectionGroup('usersWishlistedRef');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('usersWishlistedRef').doc(id);

  static Stream<UsersWishlistedRefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersWishlistedRefRecord.fromSnapshot(s));

  static Future<UsersWishlistedRefRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UsersWishlistedRefRecord.fromSnapshot(s));

  static UsersWishlistedRefRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersWishlistedRefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersWishlistedRefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersWishlistedRefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersWishlistedRefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersWishlistedRefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersWishlistedRefRecordData({
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

class UsersWishlistedRefRecordDocumentEquality
    implements Equality<UsersWishlistedRefRecord> {
  const UsersWishlistedRefRecordDocumentEquality();

  @override
  bool equals(UsersWishlistedRefRecord? e1, UsersWishlistedRefRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UsersWishlistedRefRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is UsersWishlistedRefRecord;
}
