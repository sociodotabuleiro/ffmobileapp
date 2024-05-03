import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RentalRecord extends FirestoreRecord {
  RentalRecord._(
    super.reference,
    super.data,
  ) {
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
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rental');

  static Stream<RentalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RentalRecord.fromSnapshot(s));

  static Future<RentalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RentalRecord.fromSnapshot(s));

  static RentalRecord fromSnapshot(DocumentSnapshot snapshot) => RentalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RentalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RentalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RentalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RentalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRentalRecordData({
  String? rentalID,
  DocumentReference? ownerID,
  DocumentReference? renterID,
  DateTime? rentalDate,
  DateTime? dueDate,
  double? pricePerDay,
  double? deliveryFee,
  RentalStatus? status,
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
    }.withoutNulls,
  );

  return firestoreData;
}

class RentalRecordDocumentEquality implements Equality<RentalRecord> {
  const RentalRecordDocumentEquality();

  @override
  bool equals(RentalRecord? e1, RentalRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rentalID == e2?.rentalID &&
        listEquality.equals(e1?.games, e2?.games) &&
        e1?.ownerID == e2?.ownerID &&
        e1?.renterID == e2?.renterID &&
        e1?.rentalDate == e2?.rentalDate &&
        e1?.dueDate == e2?.dueDate &&
        e1?.pricePerDay == e2?.pricePerDay &&
        e1?.deliveryFee == e2?.deliveryFee &&
        e1?.status == e2?.status;
  }

  @override
  int hash(RentalRecord? e) => const ListEquality().hash([
        e?.rentalID,
        e?.games,
        e?.ownerID,
        e?.renterID,
        e?.rentalDate,
        e?.dueDate,
        e?.pricePerDay,
        e?.deliveryFee,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is RentalRecord;
}
