// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardStruct extends FFFirebaseStruct {
  CardStruct({
    String? name,
    String? number,
    String? validDate,
    AddressStruct? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _number = number,
        _validDate = validDate,
        _address = address,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;

  bool hasNumber() => _number != null;

  // "validDate" field.
  String? _validDate;
  String get validDate => _validDate ?? '';
  set validDate(String? val) => _validDate = val;

  bool hasValidDate() => _validDate != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  set address(AddressStruct? val) => _address = val;

  void updateAddress(Function(AddressStruct) updateFn) {
    updateFn(_address ??= AddressStruct());
  }

  bool hasAddress() => _address != null;

  static CardStruct fromMap(Map<String, dynamic> data) => CardStruct(
        name: data['name'] as String?,
        number: data['number'] as String?,
        validDate: data['validDate'] as String?,
        address: AddressStruct.maybeFromMap(data['address']),
      );

  static CardStruct? maybeFromMap(dynamic data) =>
      data is Map ? CardStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'number': _number,
        'validDate': _validDate,
        'address': _address?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'validDate': serializeParam(
          _validDate,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CardStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        validDate: deserializeParam(
          data['validDate'],
          ParamType.String,
          false,
        ),
        address: deserializeStructParam(
          data['address'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CardStruct &&
        name == other.name &&
        number == other.number &&
        validDate == other.validDate &&
        address == other.address;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, number, validDate, address]);
}

CardStruct createCardStruct({
  String? name,
  String? number,
  String? validDate,
  AddressStruct? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CardStruct(
      name: name,
      number: number,
      validDate: validDate,
      address: address ?? (clearUnsetFields ? AddressStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CardStruct? updateCardStruct(
  CardStruct? card, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    card
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCardStructData(
  Map<String, dynamic> firestoreData,
  CardStruct? card,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (card == null) {
    return;
  }
  if (card.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && card.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cardData = getCardFirestoreData(card, forFieldValue);
  final nestedData = cardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = card.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCardFirestoreData(
  CardStruct? card, [
  bool forFieldValue = false,
]) {
  if (card == null) {
    return {};
  }
  final firestoreData = mapToFirestore(card.toMap());

  // Handle nested data for "address" field.
  addAddressStructData(
    firestoreData,
    card.hasAddress() ? card.address : null,
    'address',
    forFieldValue,
  );

  // Add any Firestore field values
  card.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCardListFirestoreData(
  List<CardStruct>? cards,
) =>
    cards?.map((e) => getCardFirestoreData(e, true)).toList() ?? [];
