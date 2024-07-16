import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AchievementsRecord extends FirestoreRecord {
  AchievementsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "iconURL" field.
  String? _iconURL;
  String get iconURL => _iconURL ?? '';
  bool hasIconURL() => _iconURL != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _iconURL = snapshotData['iconURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('achievements');

  static Stream<AchievementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AchievementsRecord.fromSnapshot(s));

  static Future<AchievementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AchievementsRecord.fromSnapshot(s));

  static AchievementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AchievementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AchievementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AchievementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AchievementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AchievementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAchievementsRecordData({
  String? id,
  String? name,
  String? description,
  String? iconURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'iconURL': iconURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class AchievementsRecordDocumentEquality
    implements Equality<AchievementsRecord> {
  const AchievementsRecordDocumentEquality();

  @override
  bool equals(AchievementsRecord? e1, AchievementsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.iconURL == e2?.iconURL;
  }

  @override
  int hash(AchievementsRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.description, e?.iconURL]);

  @override
  bool isValidKey(Object? o) => o is AchievementsRecord;
}
