// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PaymentsDeliveryStruct extends FFFirebaseStruct {
  PaymentsDeliveryStruct({
    String? name,
    String? code,
    double? value,
    bool? prepaid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _code = code,
        _value = value,
        _prepaid = prepaid,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "code" field.
  String? _code;
  String get code => _code ?? 'ONLINE';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "prepaid" field.
  bool? _prepaid;
  bool get prepaid => _prepaid ?? true;
  set prepaid(bool? val) => _prepaid = val;

  bool hasPrepaid() => _prepaid != null;

  static PaymentsDeliveryStruct fromMap(Map<String, dynamic> data) =>
      PaymentsDeliveryStruct(
        name: data['name'] as String?,
        code: data['code'] as String?,
        value: castToType<double>(data['value']),
        prepaid: data['prepaid'] as bool?,
      );

  static PaymentsDeliveryStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentsDeliveryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'code': _code,
        'value': _value,
        'prepaid': _prepaid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
        'prepaid': serializeParam(
          _prepaid,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PaymentsDeliveryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PaymentsDeliveryStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
        prepaid: deserializeParam(
          data['prepaid'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PaymentsDeliveryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentsDeliveryStruct &&
        name == other.name &&
        code == other.code &&
        value == other.value &&
        prepaid == other.prepaid;
  }

  @override
  int get hashCode => const ListEquality().hash([name, code, value, prepaid]);
}

PaymentsDeliveryStruct createPaymentsDeliveryStruct({
  String? name,
  String? code,
  double? value,
  bool? prepaid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentsDeliveryStruct(
      name: name,
      code: code,
      value: value,
      prepaid: prepaid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentsDeliveryStruct? updatePaymentsDeliveryStruct(
  PaymentsDeliveryStruct? paymentsDelivery, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentsDelivery
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentsDeliveryStructData(
  Map<String, dynamic> firestoreData,
  PaymentsDeliveryStruct? paymentsDelivery,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentsDelivery == null) {
    return;
  }
  if (paymentsDelivery.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentsDelivery.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentsDeliveryData =
      getPaymentsDeliveryFirestoreData(paymentsDelivery, forFieldValue);
  final nestedData =
      paymentsDeliveryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paymentsDelivery.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentsDeliveryFirestoreData(
  PaymentsDeliveryStruct? paymentsDelivery, [
  bool forFieldValue = false,
]) {
  if (paymentsDelivery == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentsDelivery.toMap());

  // Add any Firestore field values
  paymentsDelivery.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentsDeliveryListFirestoreData(
  List<PaymentsDeliveryStruct>? paymentsDeliverys,
) =>
    paymentsDeliverys
        ?.map((e) => getPaymentsDeliveryFirestoreData(e, true))
        .toList() ??
    [];
