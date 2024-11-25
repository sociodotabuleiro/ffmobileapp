import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersFavoritedRefRecord extends FirestoreRecord {
  UsersFavoritedRefRecord._(
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
          ? parent.collection('usersFavoritedRef')
          : FirebaseFirestore.instance.collectionGroup('usersFavoritedRef');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('usersFavoritedRef').doc(id);

  static Stream<UsersFavoritedRefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersFavoritedRefRecord.fromSnapshot(s));

  static Future<UsersFavoritedRefRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UsersFavoritedRefRecord.fromSnapshot(s));

  static UsersFavoritedRefRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersFavoritedRefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersFavoritedRefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersFavoritedRefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersFavoritedRefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersFavoritedRefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersFavoritedRefRecordData({
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

class UsersFavoritedRefRecordDocumentEquality
    implements Equality<UsersFavoritedRefRecord> {
  const UsersFavoritedRefRecordDocumentEquality();

  @override
  bool equals(UsersFavoritedRefRecord? e1, UsersFavoritedRefRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UsersFavoritedRefRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is UsersFavoritedRefRecord;
}
