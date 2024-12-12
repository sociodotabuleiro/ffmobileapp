import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRentalsRecord extends FirestoreRecord {
  UsersRentalsRecord._(
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

  // "transactionReceiptUrl" field.
  String? _transactionReceiptUrl;
  String get transactionReceiptUrl => _transactionReceiptUrl ?? '';
  bool hasTransactionReceiptUrl() => _transactionReceiptUrl != null;

  // "invoiceUrl" field.
  String? _invoiceUrl;
  String get invoiceUrl => _invoiceUrl ?? '';
  bool hasInvoiceUrl() => _invoiceUrl != null;

  // "billingType" field.
  String? _billingType;
  String get billingType => _billingType ?? '';
  bool hasBillingType() => _billingType != null;

  // "paymentId" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  bool hasPaymentId() => _paymentId != null;

  // "statusASAAS" field.
  String? _statusASAAS;
  String get statusASAAS => _statusASAAS ?? '';
  bool hasStatusASAAS() => _statusASAAS != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "netValue" field.
  double? _netValue;
  double get netValue => _netValue ?? 0.0;
  bool hasNetValue() => _netValue != null;

  // "confirmedDate" field.
  DateTime? _confirmedDate;
  DateTime? get confirmedDate => _confirmedDate;
  bool hasConfirmedDate() => _confirmedDate != null;

  // "creditDate" field.
  DateTime? _creditDate;
  DateTime? get creditDate => _creditDate;
  bool hasCreditDate() => _creditDate != null;

  void _initializeFields() {
    _rentalID = snapshotData['rentalID'] as String?;
    _games = getDataList(snapshotData['games']);
    _ownerID = snapshotData['ownerID'] as DocumentReference?;
    _renterID = snapshotData['renterID'] as DocumentReference?;
    _rentalDate = snapshotData['rentalDate'] as DateTime?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _pricePerDay = castToType<double>(snapshotData['pricePerDay']);
    _deliveryFee = castToType<double>(snapshotData['deliveryFee']);
    _status = snapshotData['status'] is RentalStatus
        ? snapshotData['status']
        : deserializeEnum<RentalStatus>(snapshotData['status']);
    _newDueDates = getDataList(snapshotData['newDueDates']);
    _currentStatusTime = snapshotData['currentStatusTime'] as DateTime?;
    _pastTimes = getDataList(snapshotData['pastTimes']);
    _paymentConfirmedAt = snapshotData['paymentConfirmedAt'] as DateTime?;
    _rentedDates = getDataList(snapshotData['rentedDates']);
    _firstDeliveryDate = snapshotData['firstDeliveryDate'] as DateTime?;
    _returnDeliveryDate = snapshotData['returnDeliveryDate'] as DateTime?;
    _transactionReceiptUrl = snapshotData['transactionReceiptUrl'] as String?;
    _invoiceUrl = snapshotData['invoiceUrl'] as String?;
    _billingType = snapshotData['billingType'] as String?;
    _paymentId = snapshotData['paymentId'] as String?;
    _statusASAAS = snapshotData['statusASAAS'] as String?;
    _value = castToType<double>(snapshotData['value']);
    _netValue = castToType<double>(snapshotData['netValue']);
    _confirmedDate = snapshotData['confirmedDate'] as DateTime?;
    _creditDate = snapshotData['creditDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersRentals');

  static Stream<UsersRentalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRentalsRecord.fromSnapshot(s));

  static Future<UsersRentalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRentalsRecord.fromSnapshot(s));

  static UsersRentalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersRentalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRentalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRentalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRentalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRentalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRentalsRecordData({
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
  String? transactionReceiptUrl,
  String? invoiceUrl,
  String? billingType,
  String? paymentId,
  String? statusASAAS,
  double? value,
  double? netValue,
  DateTime? confirmedDate,
  DateTime? creditDate,
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
      'transactionReceiptUrl': transactionReceiptUrl,
      'invoiceUrl': invoiceUrl,
      'billingType': billingType,
      'paymentId': paymentId,
      'statusASAAS': statusASAAS,
      'value': value,
      'netValue': netValue,
      'confirmedDate': confirmedDate,
      'creditDate': creditDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRentalsRecordDocumentEquality
    implements Equality<UsersRentalsRecord> {
  const UsersRentalsRecordDocumentEquality();

  @override
  bool equals(UsersRentalsRecord? e1, UsersRentalsRecord? e2) {
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
        e1?.returnDeliveryDate == e2?.returnDeliveryDate &&
        e1?.transactionReceiptUrl == e2?.transactionReceiptUrl &&
        e1?.invoiceUrl == e2?.invoiceUrl &&
        e1?.billingType == e2?.billingType &&
        e1?.paymentId == e2?.paymentId &&
        e1?.statusASAAS == e2?.statusASAAS &&
        e1?.value == e2?.value &&
        e1?.netValue == e2?.netValue &&
        e1?.confirmedDate == e2?.confirmedDate &&
        e1?.creditDate == e2?.creditDate;
  }

  @override
  int hash(UsersRentalsRecord? e) => const ListEquality().hash([
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
        e?.returnDeliveryDate,
        e?.transactionReceiptUrl,
        e?.invoiceUrl,
        e?.billingType,
        e?.paymentId,
        e?.statusASAAS,
        e?.value,
        e?.netValue,
        e?.confirmedDate,
        e?.creditDate
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRentalsRecord;
}
