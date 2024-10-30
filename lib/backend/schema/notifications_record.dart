import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notificationID" field.
  String? _notificationID;
  String get notificationID => _notificationID ?? '';
  bool hasNotificationID() => _notificationID != null;

  // "type" field.
  NotificationTypes? _type;
  NotificationTypes? get type => _type;
  bool hasType() => _type != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "read" field.
  List<bool>? _read;
  List<bool> get read => _read ?? const [];
  bool hasRead() => _read != null;

  void _initializeFields() {
    _notificationID = snapshotData['notificationID'] as String?;
    _type = deserializeEnum<NotificationTypes>(snapshotData['type']);
    _users = getDataList(snapshotData['users']);
    _message = snapshotData['message'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _read = getDataList(snapshotData['read']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notificationID,
  NotificationTypes? type,
  String? message,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notificationID': notificationID,
      'type': type,
      'message': message,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notificationID == e2?.notificationID &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.message == e2?.message &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.read, e2?.read);
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash(
      [e?.notificationID, e?.type, e?.users, e?.message, e?.date, e?.read]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
