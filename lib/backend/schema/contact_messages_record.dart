import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactMessagesRecord extends FirestoreRecord {
  ContactMessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "topics" field.
  List<String>? _topics;
  List<String> get topics => _topics ?? const [];
  bool hasTopics() => _topics != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _message = snapshotData['message'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _topics = getDataList(snapshotData['topics']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contactMessages');

  static Stream<ContactMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactMessagesRecord.fromSnapshot(s));

  static Future<ContactMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactMessagesRecord.fromSnapshot(s));

  static ContactMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactMessagesRecordData({
  String? title,
  String? message,
  DocumentReference? userRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'message': message,
      'userRef': userRef,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactMessagesRecordDocumentEquality
    implements Equality<ContactMessagesRecord> {
  const ContactMessagesRecordDocumentEquality();

  @override
  bool equals(ContactMessagesRecord? e1, ContactMessagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.message == e2?.message &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.topics, e2?.topics) &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ContactMessagesRecord? e) => const ListEquality()
      .hash([e?.title, e?.message, e?.userRef, e?.topics, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is ContactMessagesRecord;
}
