import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyGamesRecord extends FirestoreRecord {
  MyGamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "gameRef" field.
  DocumentReference? _gameRef;
  DocumentReference? get gameRef => _gameRef;
  bool hasGameRef() => _gameRef != null;

  // "availableDates" field.
  List<DateTime>? _availableDates;
  List<DateTime> get availableDates => _availableDates ?? const [];
  bool hasAvailableDates() => _availableDates != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "toRent" field.
  bool? _toRent;
  bool get toRent => _toRent ?? false;
  bool hasToRent() => _toRent != null;

  // "publicId" field.
  String? _publicId;
  String get publicId => _publicId ?? '';
  bool hasPublicId() => _publicId != null;

  // "rentedDates" field.
  List<DateTime>? _rentedDates;
  List<DateTime> get rentedDates => _rentedDates ?? const [];
  bool hasRentedDates() => _rentedDates != null;

  // "notAvailableDates" field.
  List<DateTime>? _notAvailableDates;
  List<DateTime> get notAvailableDates => _notAvailableDates ?? const [];
  bool hasNotAvailableDates() => _notAvailableDates != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _gameRef = snapshotData['gameRef'] as DocumentReference?;
    _availableDates = getDataList(snapshotData['availableDates']);
    _price = castToType<double>(snapshotData['price']);
    _toRent = snapshotData['toRent'] as bool?;
    _publicId = snapshotData['publicId'] as String?;
    _rentedDates = getDataList(snapshotData['rentedDates']);
    _notAvailableDates = getDataList(snapshotData['notAvailableDates']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('myGames')
          : FirebaseFirestore.instance.collectionGroup('myGames');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('myGames').doc(id);

  static Stream<MyGamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyGamesRecord.fromSnapshot(s));

  static Future<MyGamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyGamesRecord.fromSnapshot(s));

  static MyGamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyGamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyGamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyGamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyGamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyGamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyGamesRecordData({
  DocumentReference? gameRef,
  double? price,
  bool? toRent,
  String? publicId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gameRef': gameRef,
      'price': price,
      'toRent': toRent,
      'publicId': publicId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyGamesRecordDocumentEquality implements Equality<MyGamesRecord> {
  const MyGamesRecordDocumentEquality();

  @override
  bool equals(MyGamesRecord? e1, MyGamesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.gameRef == e2?.gameRef &&
        listEquality.equals(e1?.availableDates, e2?.availableDates) &&
        e1?.price == e2?.price &&
        e1?.toRent == e2?.toRent &&
        e1?.publicId == e2?.publicId &&
        listEquality.equals(e1?.rentedDates, e2?.rentedDates) &&
        listEquality.equals(e1?.notAvailableDates, e2?.notAvailableDates);
  }

  @override
  int hash(MyGamesRecord? e) => const ListEquality().hash([
        e?.gameRef,
        e?.availableDates,
        e?.price,
        e?.toRent,
        e?.publicId,
        e?.rentedDates,
        e?.notAvailableDates
      ]);

  @override
  bool isValidKey(Object? o) => o is MyGamesRecord;
}
