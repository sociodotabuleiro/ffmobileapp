import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RentalsRecord extends FirestoreRecord {
  RentalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rentalID" field.
  String? _rentalID;
  String get rentalID => _rentalID ?? '';
  bool hasRentalID() => _rentalID != null;

  // "games" field.
  List<DocumentReference>? _games;
  List<DocumentReference> get games => _games ?? const [];
  bool hasGames() => _games != null;

  // "ownerID" field.
  DocumentReference? _ownerID;
  DocumentReference? get ownerID => _ownerID;
  bool hasOwnerID() => _ownerID != null;

  // "renterID" field.
  DocumentReference? _renterID;
  DocumentReference? get renterID => _renterID;
  bool hasRenterID() => _renterID != null;

  // "rentalDate" field.
  DateTime? _rentalDate;
  DateTime? get rentalDate => _rentalDate;
  bool hasRentalDate() => _rentalDate != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "pricePerDay" field.
  double? _pricePerDay;
  double get pricePerDay => _pricePerDay ?? 0.0;
  bool hasPricePerDay() => _pricePerDay != null;

  // "deliveryFee" field.
  double? _deliveryFee;
  double get deliveryFee => _deliveryFee ?? 0.0;
  bool hasDeliveryFee() => _deliveryFee != null;

  // "status" field.
  RentalStatus? _status;
  RentalStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "newDueDates" field.
  List<DateTime>? _newDueDates;
  List<DateTime> get newDueDates => _newDueDates ?? const [];
  bool hasNewDueDates() => _newDueDates != null;

  // "currentStatusTime" field.
  DateTime? _currentStatusTime;
  DateTime? get currentStatusTime => _currentStatusTime;
  bool hasCurrentStatusTime() => _currentStatusTime != null;

  // "pastTimes" field.
  List<DateTime>? _pastTimes;
  List<DateTime> get pastTimes => _pastTimes ?? const [];
  bool hasPastTimes() => _pastTimes != null;

  // "paymentConfirmedAt" field.
  DateTime? _paymentConfirmedAt;
  DateTime? get paymentConfirmedAt => _paymentConfirmedAt;
  bool hasPaymentConfirmedAt() => _paymentConfirmedAt != null;

  // "rentedDates" field.
  List<DateTime>? _rentedDates;
  List<DateTime> get rentedDates => _rentedDates ?? const [];
  bool hasRentedDates() => _rentedDates != null;

  // "firstDeliveryDate" field.
  DateTime? _firstDeliveryDate;
  DateTime? get firstDeliveryDate => _firstDeliveryDate;
  bool hasFirstDeliveryDate() => _firstDeliveryDate != null;

  // "returnDeliveryDate" field.
  DateTime? _returnDeliveryDate;
  DateTime? get returnDeliveryDate => _returnDeliveryDate;
  bool hasReturnDeliveryDate() => _returnDeliveryDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rentalID = snapshotData['rentalID'] as String?;
    _games = getDataList(snapshotData['games']);
    _ownerID = snapshotData['ownerID'] as DocumentReference?;
    _renterID = snapshotData['renterID'] as DocumentReference?;
    _rentalDate = snapshotData['rentalDate'] as DateTime?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _pricePerDay = castToType<double>(snapshotData['pricePerDay']);
    _deliveryFee = castToType<double>(snapshotData['deliveryFee']);
    _status = deserializeEnum<RentalStatus>(snapshotData['status']);
    _newDueDates = getDataList(snapshotData['newDueDates']);
    _currentStatusTime = snapshotData['currentStatusTime'] as DateTime?;
    _pastTimes = getDataList(snapshotData['pastTimes']);
    _paymentConfirmedAt = snapshotData['paymentConfirmedAt'] as DateTime?;
    _rentedDates = getDataList(snapshotData['rentedDates']);
    _firstDeliveryDate = snapshotData['firstDeliveryDate'] as DateTime?;
    _returnDeliveryDate = snapshotData['returnDeliveryDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rentals')
          : FirebaseFirestore.instance.collectionGroup('rentals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('rentals').doc(id);

  static Stream<RentalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RentalsRecord.fromSnapshot(s));

  static Future<RentalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RentalsRecord.fromSnapshot(s));

  static RentalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RentalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RentalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RentalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RentalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RentalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRentalsRecordData({
  String? rentalID,
  DocumentReference? ownerID,
  DocumentReference? renterID,
  DateTime? rentalDate,
  DateTime? dueDate,
  double? pricePerDay,
  double? deliveryFee,
  RentalStatus? status,
  DateTime? currentStatusTime,
  DateTime? paymentConfirmedAt,
  DateTime? firstDeliveryDate,
  DateTime? returnDeliveryDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rentalID': rentalID,
      'ownerID': ownerID,
      'renterID': renterID,
      'rentalDate': rentalDate,
      'dueDate': dueDate,
      'pricePerDay': pricePerDay,
      'deliveryFee': deliveryFee,
      'status': status,
      'currentStatusTime': currentStatusTime,
      'paymentConfirmedAt': paymentConfirmedAt,
      'firstDeliveryDate': firstDeliveryDate,
      'returnDeliveryDate': returnDeliveryDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class RentalsRecordDocumentEquality implements Equality<RentalsRecord> {
  const RentalsRecordDocumentEquality();

  @override
  bool equals(RentalsRecord? e1, RentalsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rentalID == e2?.rentalID &&
        listEquality.equals(e1?.games, e2?.games) &&
        e1?.ownerID == e2?.ownerID &&
        e1?.renterID == e2?.renterID &&
        e1?.rentalDate == e2?.rentalDate &&
        e1?.dueDate == e2?.dueDate &&
        e1?.pricePerDay == e2?.pricePerDay &&
        e1?.deliveryFee == e2?.deliveryFee &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.newDueDates, e2?.newDueDates) &&
        e1?.currentStatusTime == e2?.currentStatusTime &&
        listEquality.equals(e1?.pastTimes, e2?.pastTimes) &&
        e1?.paymentConfirmedAt == e2?.paymentConfirmedAt &&
        listEquality.equals(e1?.rentedDates, e2?.rentedDates) &&
        e1?.firstDeliveryDate == e2?.firstDeliveryDate &&
        e1?.returnDeliveryDate == e2?.returnDeliveryDate;
  }

  @override
  int hash(RentalsRecord? e) => const ListEquality().hash([
        e?.rentalID,
        e?.games,
        e?.ownerID,
        e?.renterID,
        e?.rentalDate,
        e?.dueDate,
        e?.pricePerDay,
        e?.deliveryFee,
        e?.status,
        e?.newDueDates,
        e?.currentStatusTime,
        e?.pastTimes,
        e?.paymentConfirmedAt,
        e?.rentedDates,
        e?.firstDeliveryDate,
        e?.returnDeliveryDate
      ]);

  @override
  bool isValidKey(Object? o) => o is RentalsRecord;
}
