// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchaseComponentsStruct extends FFFirebaseStruct {
  PurchaseComponentsStruct({
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

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;

  void incrementTotalPrice(double amount) => totalPrice = totalPrice + amount;

  bool hasTotalPrice() => _totalPrice != null;

  // "externalId" field.
  String? _externalId;
  String get externalId => _externalId ?? '000';
  set externalId(String? val) => _externalId = val;

  bool hasExternalId() => _externalId != null;

  static PurchaseComponentsStruct fromMap(Map<String, dynamic> data) =>
      PurchaseComponentsStruct(
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        quantity: castToType<int>(data['quantity']),
        totalPrice: castToType<double>(data['totalPrice']),
        externalId: data['externalId'] as String?,
      );

  static PurchaseComponentsStruct? maybeFromMap(dynamic data) => data is Map
      ? PurchaseComponentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'quantity': _quantity,
        'totalPrice': _totalPrice,
        'externalId': _externalId,
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
        'totalPrice': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'externalId': serializeParam(
          _externalId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PurchaseComponentsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PurchaseComponentsStruct(
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
          data['totalPrice'],
          ParamType.double,
          false,
        ),
        externalId: deserializeParam(
          data['externalId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PurchaseComponentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurchaseComponentsStruct &&
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

PurchaseComponentsStruct createPurchaseComponentsStruct({
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
    PurchaseComponentsStruct(
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

PurchaseComponentsStruct? updatePurchaseComponentsStruct(
  PurchaseComponentsStruct? purchaseComponents, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purchaseComponents
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurchaseComponentsStructData(
  Map<String, dynamic> firestoreData,
  PurchaseComponentsStruct? purchaseComponents,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purchaseComponents == null) {
    return;
  }
  if (purchaseComponents.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && purchaseComponents.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purchaseComponentsData =
      getPurchaseComponentsFirestoreData(purchaseComponents, forFieldValue);
  final nestedData =
      purchaseComponentsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      purchaseComponents.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurchaseComponentsFirestoreData(
  PurchaseComponentsStruct? purchaseComponents, [
  bool forFieldValue = false,
]) {
  if (purchaseComponents == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purchaseComponents.toMap());

  // Add any Firestore field values
  purchaseComponents.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurchaseComponentsListFirestoreData(
  List<PurchaseComponentsStruct>? purchaseComponentss,
) =>
    purchaseComponentss
        ?.map((e) => getPurchaseComponentsFirestoreData(e, true))
        .toList() ??
    [];
