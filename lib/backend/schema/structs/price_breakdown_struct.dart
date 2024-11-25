// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PriceBreakdownStruct extends FFFirebaseStruct {
  PriceBreakdownStruct({
    String? base,
    String? specialRequests,
    String? vat,
    String? currency,
    double? totalBeforeOptimization,
    double? totalExcludePriorityFee,
    double? total,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _base = base,
        _specialRequests = specialRequests,
        _vat = vat,
        _currency = currency,
        _totalBeforeOptimization = totalBeforeOptimization,
        _totalExcludePriorityFee = totalExcludePriorityFee,
        _total = total,
        super(firestoreUtilData);

  // "base" field.
  String? _base;
  String get base => _base ?? '';
  set base(String? val) => _base = val;

  bool hasBase() => _base != null;

  // "specialRequests" field.
  String? _specialRequests;
  String get specialRequests => _specialRequests ?? '';
  set specialRequests(String? val) => _specialRequests = val;

  bool hasSpecialRequests() => _specialRequests != null;

  // "vat" field.
  String? _vat;
  String get vat => _vat ?? '';
  set vat(String? val) => _vat = val;

  bool hasVat() => _vat != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "totalBeforeOptimization" field.
  double? _totalBeforeOptimization;
  double get totalBeforeOptimization => _totalBeforeOptimization ?? 0.0;
  set totalBeforeOptimization(double? val) => _totalBeforeOptimization = val;

  void incrementTotalBeforeOptimization(double amount) =>
      totalBeforeOptimization = totalBeforeOptimization + amount;

  bool hasTotalBeforeOptimization() => _totalBeforeOptimization != null;

  // "totalExcludePriorityFee" field.
  double? _totalExcludePriorityFee;
  double get totalExcludePriorityFee => _totalExcludePriorityFee ?? 0.0;
  set totalExcludePriorityFee(double? val) => _totalExcludePriorityFee = val;

  void incrementTotalExcludePriorityFee(double amount) =>
      totalExcludePriorityFee = totalExcludePriorityFee + amount;

  bool hasTotalExcludePriorityFee() => _totalExcludePriorityFee != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static PriceBreakdownStruct fromMap(Map<String, dynamic> data) =>
      PriceBreakdownStruct(
        base: data['base'] as String?,
        specialRequests: data['specialRequests'] as String?,
        vat: data['vat'] as String?,
        currency: data['currency'] as String?,
        totalBeforeOptimization:
            castToType<double>(data['totalBeforeOptimization']),
        totalExcludePriorityFee:
            castToType<double>(data['totalExcludePriorityFee']),
        total: castToType<double>(data['total']),
      );

  static PriceBreakdownStruct? maybeFromMap(dynamic data) => data is Map
      ? PriceBreakdownStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'base': _base,
        'specialRequests': _specialRequests,
        'vat': _vat,
        'currency': _currency,
        'totalBeforeOptimization': _totalBeforeOptimization,
        'totalExcludePriorityFee': _totalExcludePriorityFee,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'base': serializeParam(
          _base,
          ParamType.String,
        ),
        'specialRequests': serializeParam(
          _specialRequests,
          ParamType.String,
        ),
        'vat': serializeParam(
          _vat,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'totalBeforeOptimization': serializeParam(
          _totalBeforeOptimization,
          ParamType.double,
        ),
        'totalExcludePriorityFee': serializeParam(
          _totalExcludePriorityFee,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
      }.withoutNulls;

  static PriceBreakdownStruct fromSerializableMap(Map<String, dynamic> data) =>
      PriceBreakdownStruct(
        base: deserializeParam(
          data['base'],
          ParamType.String,
          false,
        ),
        specialRequests: deserializeParam(
          data['specialRequests'],
          ParamType.String,
          false,
        ),
        vat: deserializeParam(
          data['vat'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        totalBeforeOptimization: deserializeParam(
          data['totalBeforeOptimization'],
          ParamType.double,
          false,
        ),
        totalExcludePriorityFee: deserializeParam(
          data['totalExcludePriorityFee'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PriceBreakdownStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PriceBreakdownStruct &&
        base == other.base &&
        specialRequests == other.specialRequests &&
        vat == other.vat &&
        currency == other.currency &&
        totalBeforeOptimization == other.totalBeforeOptimization &&
        totalExcludePriorityFee == other.totalExcludePriorityFee &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([
        base,
        specialRequests,
        vat,
        currency,
        totalBeforeOptimization,
        totalExcludePriorityFee,
        total
      ]);
}

PriceBreakdownStruct createPriceBreakdownStruct({
  String? base,
  String? specialRequests,
  String? vat,
  String? currency,
  double? totalBeforeOptimization,
  double? totalExcludePriorityFee,
  double? total,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PriceBreakdownStruct(
      base: base,
      specialRequests: specialRequests,
      vat: vat,
      currency: currency,
      totalBeforeOptimization: totalBeforeOptimization,
      totalExcludePriorityFee: totalExcludePriorityFee,
      total: total,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PriceBreakdownStruct? updatePriceBreakdownStruct(
  PriceBreakdownStruct? priceBreakdown, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    priceBreakdown
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPriceBreakdownStructData(
  Map<String, dynamic> firestoreData,
  PriceBreakdownStruct? priceBreakdown,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (priceBreakdown == null) {
    return;
  }
  if (priceBreakdown.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && priceBreakdown.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final priceBreakdownData =
      getPriceBreakdownFirestoreData(priceBreakdown, forFieldValue);
  final nestedData =
      priceBreakdownData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = priceBreakdown.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPriceBreakdownFirestoreData(
  PriceBreakdownStruct? priceBreakdown, [
  bool forFieldValue = false,
]) {
  if (priceBreakdown == null) {
    return {};
  }
  final firestoreData = mapToFirestore(priceBreakdown.toMap());

  // Add any Firestore field values
  priceBreakdown.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPriceBreakdownListFirestoreData(
  List<PriceBreakdownStruct>? priceBreakdowns,
) =>
    priceBreakdowns
        ?.map((e) => getPriceBreakdownFirestoreData(e, true))
        .toList() ??
    [];
