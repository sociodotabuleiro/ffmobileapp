import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersContactResponsesRecord extends FirestoreRecord {
  UsersContactResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  bool hasSender() => _sender != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _sender = snapshotData['sender'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('usersContactResponses')
          : FirebaseFirestore.instance.collectionGroup('usersContactResponses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('usersContactResponses').doc(id);

  static Stream<UsersContactResponsesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => UsersContactResponsesRecord.fromSnapshot(s));

  static Future<UsersContactResponsesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UsersContactResponsesRecord.fromSnapshot(s));

  static UsersContactResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersContactResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersContactResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersContactResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersContactResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersContactResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersContactResponsesRecordData({
  String? message,
  String? sender,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'sender': sender,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersContactResponsesRecordDocumentEquality
    implements Equality<UsersContactResponsesRecord> {
  const UsersContactResponsesRecordDocumentEquality();

  @override
  bool equals(
      UsersContactResponsesRecord? e1, UsersContactResponsesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.sender == e2?.sender &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UsersContactResponsesRecord? e) =>
      const ListEquality().hash([e?.message, e?.sender, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is UsersContactResponsesRecord;
}
