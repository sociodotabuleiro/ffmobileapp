// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryDataStruct extends FFFirebaseStruct {
  DeliveryDataStruct({
    String? externalId,
    String? shortExternalReference,
    AddressStruct? address,
    CustomerDeliveryStruct? customer,
    PaymentsDeliveryStruct? payments,
    String? deliveryDatetime,
    String? preparationStart,
    String? orderCreatedAt,
    int? preparationTimeInSeconds,
    double? totalPrice,
    String? marketplaceName,
    String? marketplaceId,
    ItemsDeliveryStruct? items,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _externalId = externalId,
        _shortExternalReference = shortExternalReference,
        _address = address,
        _customer = customer,
        _payments = payments,
        _deliveryDatetime = deliveryDatetime,
        _preparationStart = preparationStart,
        _orderCreatedAt = orderCreatedAt,
        _preparationTimeInSeconds = preparationTimeInSeconds,
        _totalPrice = totalPrice,
        _marketplaceName = marketplaceName,
        _marketplaceId = marketplaceId,
        _items = items,
        super(firestoreUtilData);

  // "external_id" field.
  String? _externalId;
  String get externalId => _externalId ?? '';
  set externalId(String? val) => _externalId = val;

  bool hasExternalId() => _externalId != null;

  // "short_external_reference" field.
  String? _shortExternalReference;
  String get shortExternalReference => _shortExternalReference ?? '';
  set shortExternalReference(String? val) => _shortExternalReference = val;

  bool hasShortExternalReference() => _shortExternalReference != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  set address(AddressStruct? val) => _address = val;

  void updateAddress(Function(AddressStruct) updateFn) {
    updateFn(_address ??= AddressStruct());
  }

  bool hasAddress() => _address != null;

  // "customer" field.
  CustomerDeliveryStruct? _customer;
  CustomerDeliveryStruct get customer => _customer ?? CustomerDeliveryStruct();
  set customer(CustomerDeliveryStruct? val) => _customer = val;

  void updateCustomer(Function(CustomerDeliveryStruct) updateFn) {
    updateFn(_customer ??= CustomerDeliveryStruct());
  }

  bool hasCustomer() => _customer != null;

  // "payments" field.
  PaymentsDeliveryStruct? _payments;
  PaymentsDeliveryStruct get payments => _payments ?? PaymentsDeliveryStruct();
  set payments(PaymentsDeliveryStruct? val) => _payments = val;

  void updatePayments(Function(PaymentsDeliveryStruct) updateFn) {
    updateFn(_payments ??= PaymentsDeliveryStruct());
  }

  bool hasPayments() => _payments != null;

  // "delivery_datetime" field.
  String? _deliveryDatetime;
  String get deliveryDatetime => _deliveryDatetime ?? '';
  set deliveryDatetime(String? val) => _deliveryDatetime = val;

  bool hasDeliveryDatetime() => _deliveryDatetime != null;

  // "preparation_start" field.
  String? _preparationStart;
  String get preparationStart => _preparationStart ?? '';
  set preparationStart(String? val) => _preparationStart = val;

  bool hasPreparationStart() => _preparationStart != null;

  // "order_created_at" field.
  String? _orderCreatedAt;
  String get orderCreatedAt => _orderCreatedAt ?? '';
  set orderCreatedAt(String? val) => _orderCreatedAt = val;

  bool hasOrderCreatedAt() => _orderCreatedAt != null;

  // "preparation_time_in_seconds" field.
  int? _preparationTimeInSeconds;
  int get preparationTimeInSeconds => _preparationTimeInSeconds ?? 0;
  set preparationTimeInSeconds(int? val) => _preparationTimeInSeconds = val;

  void incrementPreparationTimeInSeconds(int amount) =>
      preparationTimeInSeconds = preparationTimeInSeconds + amount;

  bool hasPreparationTimeInSeconds() => _preparationTimeInSeconds != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;

  void incrementTotalPrice(double amount) => totalPrice = totalPrice + amount;

  bool hasTotalPrice() => _totalPrice != null;

  // "marketplace_name" field.
  String? _marketplaceName;
  String get marketplaceName => _marketplaceName ?? '';
  set marketplaceName(String? val) => _marketplaceName = val;

  bool hasMarketplaceName() => _marketplaceName != null;

  // "marketplace_id" field.
  String? _marketplaceId;
  String get marketplaceId => _marketplaceId ?? '';
  set marketplaceId(String? val) => _marketplaceId = val;

  bool hasMarketplaceId() => _marketplaceId != null;

  // "items" field.
  ItemsDeliveryStruct? _items;
  ItemsDeliveryStruct get items => _items ?? ItemsDeliveryStruct();
  set items(ItemsDeliveryStruct? val) => _items = val;

  void updateItems(Function(ItemsDeliveryStruct) updateFn) {
    updateFn(_items ??= ItemsDeliveryStruct());
  }

  bool hasItems() => _items != null;

  static DeliveryDataStruct fromMap(Map<String, dynamic> data) =>
      DeliveryDataStruct(
        externalId: data['external_id'] as String?,
        shortExternalReference: data['short_external_reference'] as String?,
        address: AddressStruct.maybeFromMap(data['address']),
        customer: CustomerDeliveryStruct.maybeFromMap(data['customer']),
        payments: PaymentsDeliveryStruct.maybeFromMap(data['payments']),
        deliveryDatetime: data['delivery_datetime'] as String?,
        preparationStart: data['preparation_start'] as String?,
        orderCreatedAt: data['order_created_at'] as String?,
        preparationTimeInSeconds:
            castToType<int>(data['preparation_time_in_seconds']),
        totalPrice: castToType<double>(data['total_price']),
        marketplaceName: data['marketplace_name'] as String?,
        marketplaceId: data['marketplace_id'] as String?,
        items: ItemsDeliveryStruct.maybeFromMap(data['items']),
      );

  static DeliveryDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DeliveryDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'external_id': _externalId,
        'short_external_reference': _shortExternalReference,
        'address': _address?.toMap(),
        'customer': _customer?.toMap(),
        'payments': _payments?.toMap(),
        'delivery_datetime': _deliveryDatetime,
        'preparation_start': _preparationStart,
        'order_created_at': _orderCreatedAt,
        'preparation_time_in_seconds': _preparationTimeInSeconds,
        'total_price': _totalPrice,
        'marketplace_name': _marketplaceName,
        'marketplace_id': _marketplaceId,
        'items': _items?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'external_id': serializeParam(
          _externalId,
          ParamType.String,
        ),
        'short_external_reference': serializeParam(
          _shortExternalReference,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.DataStruct,
        ),
        'customer': serializeParam(
          _customer,
          ParamType.DataStruct,
        ),
        'payments': serializeParam(
          _payments,
          ParamType.DataStruct,
        ),
        'delivery_datetime': serializeParam(
          _deliveryDatetime,
          ParamType.String,
        ),
        'preparation_start': serializeParam(
          _preparationStart,
          ParamType.String,
        ),
        'order_created_at': serializeParam(
          _orderCreatedAt,
          ParamType.String,
        ),
        'preparation_time_in_seconds': serializeParam(
          _preparationTimeInSeconds,
          ParamType.int,
        ),
        'total_price': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'marketplace_name': serializeParam(
          _marketplaceName,
          ParamType.String,
        ),
        'marketplace_id': serializeParam(
          _marketplaceId,
          ParamType.String,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DeliveryDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeliveryDataStruct(
        externalId: deserializeParam(
          data['external_id'],
          ParamType.String,
          false,
        ),
        shortExternalReference: deserializeParam(
          data['short_external_reference'],
          ParamType.String,
          false,
        ),
        address: deserializeStructParam(
          data['address'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressStruct.fromSerializableMap,
        ),
        customer: deserializeStructParam(
          data['customer'],
          ParamType.DataStruct,
          false,
          structBuilder: CustomerDeliveryStruct.fromSerializableMap,
        ),
        payments: deserializeStructParam(
          data['payments'],
          ParamType.DataStruct,
          false,
          structBuilder: PaymentsDeliveryStruct.fromSerializableMap,
        ),
        deliveryDatetime: deserializeParam(
          data['delivery_datetime'],
          ParamType.String,
          false,
        ),
        preparationStart: deserializeParam(
          data['preparation_start'],
          ParamType.String,
          false,
        ),
        orderCreatedAt: deserializeParam(
          data['order_created_at'],
          ParamType.String,
          false,
        ),
        preparationTimeInSeconds: deserializeParam(
          data['preparation_time_in_seconds'],
          ParamType.int,
          false,
        ),
        totalPrice: deserializeParam(
          data['total_price'],
          ParamType.double,
          false,
        ),
        marketplaceName: deserializeParam(
          data['marketplace_name'],
          ParamType.String,
          false,
        ),
        marketplaceId: deserializeParam(
          data['marketplace_id'],
          ParamType.String,
          false,
        ),
        items: deserializeStructParam(
          data['items'],
          ParamType.DataStruct,
          false,
          structBuilder: ItemsDeliveryStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DeliveryDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeliveryDataStruct &&
        externalId == other.externalId &&
        shortExternalReference == other.shortExternalReference &&
        address == other.address &&
        customer == other.customer &&
        payments == other.payments &&
        deliveryDatetime == other.deliveryDatetime &&
        preparationStart == other.preparationStart &&
        orderCreatedAt == other.orderCreatedAt &&
        preparationTimeInSeconds == other.preparationTimeInSeconds &&
        totalPrice == other.totalPrice &&
        marketplaceName == other.marketplaceName &&
        marketplaceId == other.marketplaceId &&
        items == other.items;
  }

  @override
  int get hashCode => const ListEquality().hash([
        externalId,
        shortExternalReference,
        address,
        customer,
        payments,
        deliveryDatetime,
        preparationStart,
        orderCreatedAt,
        preparationTimeInSeconds,
        totalPrice,
        marketplaceName,
        marketplaceId,
        items
      ]);
}

DeliveryDataStruct createDeliveryDataStruct({
  String? externalId,
  String? shortExternalReference,
  AddressStruct? address,
  CustomerDeliveryStruct? customer,
  PaymentsDeliveryStruct? payments,
  String? deliveryDatetime,
  String? preparationStart,
  String? orderCreatedAt,
  int? preparationTimeInSeconds,
  double? totalPrice,
  String? marketplaceName,
  String? marketplaceId,
  ItemsDeliveryStruct? items,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeliveryDataStruct(
      externalId: externalId,
      shortExternalReference: shortExternalReference,
      address: address ?? (clearUnsetFields ? AddressStruct() : null),
      customer:
          customer ?? (clearUnsetFields ? CustomerDeliveryStruct() : null),
      payments:
          payments ?? (clearUnsetFields ? PaymentsDeliveryStruct() : null),
      deliveryDatetime: deliveryDatetime,
      preparationStart: preparationStart,
      orderCreatedAt: orderCreatedAt,
      preparationTimeInSeconds: preparationTimeInSeconds,
      totalPrice: totalPrice,
      marketplaceName: marketplaceName,
      marketplaceId: marketplaceId,
      items: items ?? (clearUnsetFields ? ItemsDeliveryStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeliveryDataStruct? updateDeliveryDataStruct(
  DeliveryDataStruct? deliveryData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deliveryData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeliveryDataStructData(
  Map<String, dynamic> firestoreData,
  DeliveryDataStruct? deliveryData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deliveryData == null) {
    return;
  }
  if (deliveryData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deliveryData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deliveryDataData =
      getDeliveryDataFirestoreData(deliveryData, forFieldValue);
  final nestedData =
      deliveryDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deliveryData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeliveryDataFirestoreData(
  DeliveryDataStruct? deliveryData, [
  bool forFieldValue = false,
]) {
  if (deliveryData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deliveryData.toMap());

  // Handle nested data for "address" field.
  addAddressStructData(
    firestoreData,
    deliveryData.hasAddress() ? deliveryData.address : null,
    'address',
    forFieldValue,
  );

  // Handle nested data for "customer" field.
  addCustomerDeliveryStructData(
    firestoreData,
    deliveryData.hasCustomer() ? deliveryData.customer : null,
    'customer',
    forFieldValue,
  );

  // Handle nested data for "payments" field.
  addPaymentsDeliveryStructData(
    firestoreData,
    deliveryData.hasPayments() ? deliveryData.payments : null,
    'payments',
    forFieldValue,
  );

  // Handle nested data for "items" field.
  addItemsDeliveryStructData(
    firestoreData,
    deliveryData.hasItems() ? deliveryData.items : null,
    'items',
    forFieldValue,
  );

  // Add any Firestore field values
  deliveryData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeliveryDataListFirestoreData(
  List<DeliveryDataStruct>? deliveryDatas,
) =>
    deliveryDatas?.map((e) => getDeliveryDataFirestoreData(e, true)).toList() ??
    [];
