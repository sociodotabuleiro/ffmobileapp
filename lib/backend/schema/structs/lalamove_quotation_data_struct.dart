// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LalamoveQuotationDataStruct extends FFFirebaseStruct {
  LalamoveQuotationDataStruct({
    String? quotationId,
    String? scheduleAt,
    String? expiresAt,
    String? serviceType,
    List<String>? specialRequests,
    String? language,
    List<StopsStruct>? stops,
    bool? isRouteOptimized,
    PriceBreakdownStruct? priceBreakdown,
    ItemStruct? item,
    DistanceStruct? distance,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quotationId = quotationId,
        _scheduleAt = scheduleAt,
        _expiresAt = expiresAt,
        _serviceType = serviceType,
        _specialRequests = specialRequests,
        _language = language,
        _stops = stops,
        _isRouteOptimized = isRouteOptimized,
        _priceBreakdown = priceBreakdown,
        _item = item,
        _distance = distance,
        super(firestoreUtilData);

  // "quotationId" field.
  String? _quotationId;
  String get quotationId => _quotationId ?? '';
  set quotationId(String? val) => _quotationId = val;

  bool hasQuotationId() => _quotationId != null;

  // "scheduleAt" field.
  String? _scheduleAt;
  String get scheduleAt => _scheduleAt ?? '';
  set scheduleAt(String? val) => _scheduleAt = val;

  bool hasScheduleAt() => _scheduleAt != null;

  // "expiresAt" field.
  String? _expiresAt;
  String get expiresAt => _expiresAt ?? '';
  set expiresAt(String? val) => _expiresAt = val;

  bool hasExpiresAt() => _expiresAt != null;

  // "serviceType" field.
  String? _serviceType;
  String get serviceType => _serviceType ?? '';
  set serviceType(String? val) => _serviceType = val;

  bool hasServiceType() => _serviceType != null;

  // "specialRequests" field.
  List<String>? _specialRequests;
  List<String> get specialRequests => _specialRequests ?? const [];
  set specialRequests(List<String>? val) => _specialRequests = val;

  void updateSpecialRequests(Function(List<String>) updateFn) {
    updateFn(_specialRequests ??= []);
  }

  bool hasSpecialRequests() => _specialRequests != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  // "stops" field.
  List<StopsStruct>? _stops;
  List<StopsStruct> get stops => _stops ?? const [];
  set stops(List<StopsStruct>? val) => _stops = val;

  void updateStops(Function(List<StopsStruct>) updateFn) {
    updateFn(_stops ??= []);
  }

  bool hasStops() => _stops != null;

  // "isRouteOptimized" field.
  bool? _isRouteOptimized;
  bool get isRouteOptimized => _isRouteOptimized ?? false;
  set isRouteOptimized(bool? val) => _isRouteOptimized = val;

  bool hasIsRouteOptimized() => _isRouteOptimized != null;

  // "priceBreakdown" field.
  PriceBreakdownStruct? _priceBreakdown;
  PriceBreakdownStruct get priceBreakdown =>
      _priceBreakdown ?? PriceBreakdownStruct();
  set priceBreakdown(PriceBreakdownStruct? val) => _priceBreakdown = val;

  void updatePriceBreakdown(Function(PriceBreakdownStruct) updateFn) {
    updateFn(_priceBreakdown ??= PriceBreakdownStruct());
  }

  bool hasPriceBreakdown() => _priceBreakdown != null;

  // "item" field.
  ItemStruct? _item;
  ItemStruct get item => _item ?? ItemStruct();
  set item(ItemStruct? val) => _item = val;

  void updateItem(Function(ItemStruct) updateFn) {
    updateFn(_item ??= ItemStruct());
  }

  bool hasItem() => _item != null;

  // "distance" field.
  DistanceStruct? _distance;
  DistanceStruct get distance => _distance ?? DistanceStruct();
  set distance(DistanceStruct? val) => _distance = val;

  void updateDistance(Function(DistanceStruct) updateFn) {
    updateFn(_distance ??= DistanceStruct());
  }

  bool hasDistance() => _distance != null;

  static LalamoveQuotationDataStruct fromMap(Map<String, dynamic> data) =>
      LalamoveQuotationDataStruct(
        quotationId: data['quotationId'] as String?,
        scheduleAt: data['scheduleAt'] as String?,
        expiresAt: data['expiresAt'] as String?,
        serviceType: data['serviceType'] as String?,
        specialRequests: getDataList(data['specialRequests']),
        language: data['language'] as String?,
        stops: getStructList(
          data['stops'],
          StopsStruct.fromMap,
        ),
        isRouteOptimized: data['isRouteOptimized'] as bool?,
        priceBreakdown:
            PriceBreakdownStruct.maybeFromMap(data['priceBreakdown']),
        item: ItemStruct.maybeFromMap(data['item']),
        distance: DistanceStruct.maybeFromMap(data['distance']),
      );

  static LalamoveQuotationDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LalamoveQuotationDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quotationId': _quotationId,
        'scheduleAt': _scheduleAt,
        'expiresAt': _expiresAt,
        'serviceType': _serviceType,
        'specialRequests': _specialRequests,
        'language': _language,
        'stops': _stops?.map((e) => e.toMap()).toList(),
        'isRouteOptimized': _isRouteOptimized,
        'priceBreakdown': _priceBreakdown?.toMap(),
        'item': _item?.toMap(),
        'distance': _distance?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quotationId': serializeParam(
          _quotationId,
          ParamType.String,
        ),
        'scheduleAt': serializeParam(
          _scheduleAt,
          ParamType.String,
        ),
        'expiresAt': serializeParam(
          _expiresAt,
          ParamType.String,
        ),
        'serviceType': serializeParam(
          _serviceType,
          ParamType.String,
        ),
        'specialRequests': serializeParam(
          _specialRequests,
          ParamType.String,
          isList: true,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
        'stops': serializeParam(
          _stops,
          ParamType.DataStruct,
          isList: true,
        ),
        'isRouteOptimized': serializeParam(
          _isRouteOptimized,
          ParamType.bool,
        ),
        'priceBreakdown': serializeParam(
          _priceBreakdown,
          ParamType.DataStruct,
        ),
        'item': serializeParam(
          _item,
          ParamType.DataStruct,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LalamoveQuotationDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LalamoveQuotationDataStruct(
        quotationId: deserializeParam(
          data['quotationId'],
          ParamType.String,
          false,
        ),
        scheduleAt: deserializeParam(
          data['scheduleAt'],
          ParamType.String,
          false,
        ),
        expiresAt: deserializeParam(
          data['expiresAt'],
          ParamType.String,
          false,
        ),
        serviceType: deserializeParam(
          data['serviceType'],
          ParamType.String,
          false,
        ),
        specialRequests: deserializeParam<String>(
          data['specialRequests'],
          ParamType.String,
          true,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
        stops: deserializeStructParam<StopsStruct>(
          data['stops'],
          ParamType.DataStruct,
          true,
          structBuilder: StopsStruct.fromSerializableMap,
        ),
        isRouteOptimized: deserializeParam(
          data['isRouteOptimized'],
          ParamType.bool,
          false,
        ),
        priceBreakdown: deserializeStructParam(
          data['priceBreakdown'],
          ParamType.DataStruct,
          false,
          structBuilder: PriceBreakdownStruct.fromSerializableMap,
        ),
        item: deserializeStructParam(
          data['item'],
          ParamType.DataStruct,
          false,
          structBuilder: ItemStruct.fromSerializableMap,
        ),
        distance: deserializeStructParam(
          data['distance'],
          ParamType.DataStruct,
          false,
          structBuilder: DistanceStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LalamoveQuotationDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LalamoveQuotationDataStruct &&
        quotationId == other.quotationId &&
        scheduleAt == other.scheduleAt &&
        expiresAt == other.expiresAt &&
        serviceType == other.serviceType &&
        listEquality.equals(specialRequests, other.specialRequests) &&
        language == other.language &&
        listEquality.equals(stops, other.stops) &&
        isRouteOptimized == other.isRouteOptimized &&
        priceBreakdown == other.priceBreakdown &&
        item == other.item &&
        distance == other.distance;
  }

  @override
  int get hashCode => const ListEquality().hash([
        quotationId,
        scheduleAt,
        expiresAt,
        serviceType,
        specialRequests,
        language,
        stops,
        isRouteOptimized,
        priceBreakdown,
        item,
        distance
      ]);
}

LalamoveQuotationDataStruct createLalamoveQuotationDataStruct({
  String? quotationId,
  String? scheduleAt,
  String? expiresAt,
  String? serviceType,
  String? language,
  bool? isRouteOptimized,
  PriceBreakdownStruct? priceBreakdown,
  ItemStruct? item,
  DistanceStruct? distance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LalamoveQuotationDataStruct(
      quotationId: quotationId,
      scheduleAt: scheduleAt,
      expiresAt: expiresAt,
      serviceType: serviceType,
      language: language,
      isRouteOptimized: isRouteOptimized,
      priceBreakdown:
          priceBreakdown ?? (clearUnsetFields ? PriceBreakdownStruct() : null),
      item: item ?? (clearUnsetFields ? ItemStruct() : null),
      distance: distance ?? (clearUnsetFields ? DistanceStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LalamoveQuotationDataStruct? updateLalamoveQuotationDataStruct(
  LalamoveQuotationDataStruct? lalamoveQuotationData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lalamoveQuotationData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLalamoveQuotationDataStructData(
  Map<String, dynamic> firestoreData,
  LalamoveQuotationDataStruct? lalamoveQuotationData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lalamoveQuotationData == null) {
    return;
  }
  if (lalamoveQuotationData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      lalamoveQuotationData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lalamoveQuotationDataData = getLalamoveQuotationDataFirestoreData(
      lalamoveQuotationData, forFieldValue);
  final nestedData =
      lalamoveQuotationDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      lalamoveQuotationData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLalamoveQuotationDataFirestoreData(
  LalamoveQuotationDataStruct? lalamoveQuotationData, [
  bool forFieldValue = false,
]) {
  if (lalamoveQuotationData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lalamoveQuotationData.toMap());

  // Handle nested data for "priceBreakdown" field.
  addPriceBreakdownStructData(
    firestoreData,
    lalamoveQuotationData.hasPriceBreakdown()
        ? lalamoveQuotationData.priceBreakdown
        : null,
    'priceBreakdown',
    forFieldValue,
  );

  // Handle nested data for "item" field.
  addItemStructData(
    firestoreData,
    lalamoveQuotationData.hasItem() ? lalamoveQuotationData.item : null,
    'item',
    forFieldValue,
  );

  // Handle nested data for "distance" field.
  addDistanceStructData(
    firestoreData,
    lalamoveQuotationData.hasDistance() ? lalamoveQuotationData.distance : null,
    'distance',
    forFieldValue,
  );

  // Add any Firestore field values
  lalamoveQuotationData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLalamoveQuotationDataListFirestoreData(
  List<LalamoveQuotationDataStruct>? lalamoveQuotationDatas,
) =>
    lalamoveQuotationDatas
        ?.map((e) => getLalamoveQuotationDataFirestoreData(e, true))
        .toList() ??
    [];
