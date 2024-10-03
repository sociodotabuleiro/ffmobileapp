// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ItemsDeliveryStruct extends FFFirebaseStruct {
  ItemsDeliveryStruct({
    String? name,
    double? price,
    int? quantity,
    double? totalPrice,
    String? externalId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _price = price,
        _quantity = quantity,
        _totalPrice = totalPrice,
        _externalId = externalId,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;

  void incrementTotalPrice(double amount) => totalPrice = totalPrice + amount;

  bool hasTotalPrice() => _totalPrice != null;

  // "external_id" field.
  String? _externalId;
  String get externalId => _externalId ?? '000';
  set externalId(String? val) => _externalId = val;

  bool hasExternalId() => _externalId != null;

  static ItemsDeliveryStruct fromMap(Map<String, dynamic> data) =>
      ItemsDeliveryStruct(
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        quantity: castToType<int>(data['quantity']),
        totalPrice: castToType<double>(data['total_price']),
        externalId: data['external_id'] as String?,
      );

  static ItemsDeliveryStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemsDeliveryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'quantity': _quantity,
        'total_price': _totalPrice,
        'external_id': _externalId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'total_price': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'external_id': serializeParam(
          _externalId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemsDeliveryStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsDeliveryStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        totalPrice: deserializeParam(
          data['total_price'],
          ParamType.double,
          false,
        ),
        externalId: deserializeParam(
          data['external_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemsDeliveryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsDeliveryStruct &&
        name == other.name &&
        price == other.price &&
        quantity == other.quantity &&
        totalPrice == other.totalPrice &&
        externalId == other.externalId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, price, quantity, totalPrice, externalId]);
}

ItemsDeliveryStruct createItemsDeliveryStruct({
  String? name,
  double? price,
  int? quantity,
  double? totalPrice,
  String? externalId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemsDeliveryStruct(
      name: name,
      price: price,
      quantity: quantity,
      totalPrice: totalPrice,
      externalId: externalId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemsDeliveryStruct? updateItemsDeliveryStruct(
  ItemsDeliveryStruct? itemsDelivery, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemsDelivery
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemsDeliveryStructData(
  Map<String, dynamic> firestoreData,
  ItemsDeliveryStruct? itemsDelivery,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemsDelivery == null) {
    return;
  }
  if (itemsDelivery.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemsDelivery.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemsDeliveryData =
      getItemsDeliveryFirestoreData(itemsDelivery, forFieldValue);
  final nestedData =
      itemsDeliveryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemsDelivery.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemsDeliveryFirestoreData(
  ItemsDeliveryStruct? itemsDelivery, [
  bool forFieldValue = false,
]) {
  if (itemsDelivery == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemsDelivery.toMap());

  // Add any Firestore field values
  itemsDelivery.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemsDeliveryListFirestoreData(
  List<ItemsDeliveryStruct>? itemsDeliverys,
) =>
    itemsDeliverys
        ?.map((e) => getItemsDeliveryFirestoreData(e, true))
        .toList() ??
    [];
