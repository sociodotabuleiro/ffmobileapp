// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerDeliveryStruct extends FFFirebaseStruct {
  CustomerDeliveryStruct({
    String? document,
    String? name,
    String? phone,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _document = document,
        _name = name,
        _phone = phone,
        super(firestoreUtilData);

  // "document" field.
  String? _document;
  String get document => _document ?? '';
  set document(String? val) => _document = val;

  bool hasDocument() => _document != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  static CustomerDeliveryStruct fromMap(Map<String, dynamic> data) =>
      CustomerDeliveryStruct(
        document: data['document'] as String?,
        name: data['name'] as String?,
        phone: data['phone'] as String?,
      );

  static CustomerDeliveryStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomerDeliveryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'document': _document,
        'name': _name,
        'phone': _phone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'document': serializeParam(
          _document,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerDeliveryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CustomerDeliveryStruct(
        document: deserializeParam(
          data['document'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerDeliveryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerDeliveryStruct &&
        document == other.document &&
        name == other.name &&
        phone == other.phone;
  }

  @override
  int get hashCode => const ListEquality().hash([document, name, phone]);
}

CustomerDeliveryStruct createCustomerDeliveryStruct({
  String? document,
  String? name,
  String? phone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomerDeliveryStruct(
      document: document,
      name: name,
      phone: phone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomerDeliveryStruct? updateCustomerDeliveryStruct(
  CustomerDeliveryStruct? customerDelivery, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customerDelivery
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomerDeliveryStructData(
  Map<String, dynamic> firestoreData,
  CustomerDeliveryStruct? customerDelivery,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customerDelivery == null) {
    return;
  }
  if (customerDelivery.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customerDelivery.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customerDeliveryData =
      getCustomerDeliveryFirestoreData(customerDelivery, forFieldValue);
  final nestedData =
      customerDeliveryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customerDelivery.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomerDeliveryFirestoreData(
  CustomerDeliveryStruct? customerDelivery, [
  bool forFieldValue = false,
]) {
  if (customerDelivery == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customerDelivery.toMap());

  // Add any Firestore field values
  customerDelivery.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomerDeliveryListFirestoreData(
  List<CustomerDeliveryStruct>? customerDeliverys,
) =>
    customerDeliverys
        ?.map((e) => getCustomerDeliveryFirestoreData(e, true))
        .toList() ??
    [];
