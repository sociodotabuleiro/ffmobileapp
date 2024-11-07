// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LalamoveOrderResponseStruct extends FFFirebaseStruct {
  LalamoveOrderResponseStruct({
    String? orderId,
    String? quotationId,
    PriceBreakdownStruct? priceBreakdown,
    String? driverId,
    String? shareLink,
    String? status,
    DistanceStruct? distance,
    List<StopsStruct>? stops,
    LalamoveMetadataStruct? metadata,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderId = orderId,
        _quotationId = quotationId,
        _priceBreakdown = priceBreakdown,
        _driverId = driverId,
        _shareLink = shareLink,
        _status = status,
        _distance = distance,
        _stops = stops,
        _metadata = metadata,
        super(firestoreUtilData);

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  // "quotationId" field.
  String? _quotationId;
  String get quotationId => _quotationId ?? '';
  set quotationId(String? val) => _quotationId = val;

  bool hasQuotationId() => _quotationId != null;

  // "priceBreakdown" field.
  PriceBreakdownStruct? _priceBreakdown;
  PriceBreakdownStruct get priceBreakdown =>
      _priceBreakdown ?? PriceBreakdownStruct();
  set priceBreakdown(PriceBreakdownStruct? val) => _priceBreakdown = val;

  void updatePriceBreakdown(Function(PriceBreakdownStruct) updateFn) {
    updateFn(_priceBreakdown ??= PriceBreakdownStruct());
  }

  bool hasPriceBreakdown() => _priceBreakdown != null;

  // "driverId" field.
  String? _driverId;
  String get driverId => _driverId ?? '';
  set driverId(String? val) => _driverId = val;

  bool hasDriverId() => _driverId != null;

  // "shareLink" field.
  String? _shareLink;
  String get shareLink => _shareLink ?? '';
  set shareLink(String? val) => _shareLink = val;

  bool hasShareLink() => _shareLink != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "distance" field.
  DistanceStruct? _distance;
  DistanceStruct get distance => _distance ?? DistanceStruct();
  set distance(DistanceStruct? val) => _distance = val;

  void updateDistance(Function(DistanceStruct) updateFn) {
    updateFn(_distance ??= DistanceStruct());
  }

  bool hasDistance() => _distance != null;

  // "stops" field.
  List<StopsStruct>? _stops;
  List<StopsStruct> get stops => _stops ?? const [];
  set stops(List<StopsStruct>? val) => _stops = val;

  void updateStops(Function(List<StopsStruct>) updateFn) {
    updateFn(_stops ??= []);
  }

  bool hasStops() => _stops != null;

  // "metadata" field.
  LalamoveMetadataStruct? _metadata;
  LalamoveMetadataStruct get metadata => _metadata ?? LalamoveMetadataStruct();
  set metadata(LalamoveMetadataStruct? val) => _metadata = val;

  void updateMetadata(Function(LalamoveMetadataStruct) updateFn) {
    updateFn(_metadata ??= LalamoveMetadataStruct());
  }

  bool hasMetadata() => _metadata != null;

  static LalamoveOrderResponseStruct fromMap(Map<String, dynamic> data) =>
      LalamoveOrderResponseStruct(
        orderId: data['orderId'] as String?,
        quotationId: data['quotationId'] as String?,
        priceBreakdown:
            PriceBreakdownStruct.maybeFromMap(data['priceBreakdown']),
        driverId: data['driverId'] as String?,
        shareLink: data['shareLink'] as String?,
        status: data['status'] as String?,
        distance: DistanceStruct.maybeFromMap(data['distance']),
        stops: getStructList(
          data['stops'],
          StopsStruct.fromMap,
        ),
        metadata: LalamoveMetadataStruct.maybeFromMap(data['metadata']),
      );

  static LalamoveOrderResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? LalamoveOrderResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'orderId': _orderId,
        'quotationId': _quotationId,
        'priceBreakdown': _priceBreakdown?.toMap(),
        'driverId': _driverId,
        'shareLink': _shareLink,
        'status': _status,
        'distance': _distance?.toMap(),
        'stops': _stops?.map((e) => e.toMap()).toList(),
        'metadata': _metadata?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderId': serializeParam(
          _orderId,
          ParamType.String,
        ),
        'quotationId': serializeParam(
          _quotationId,
          ParamType.String,
        ),
        'priceBreakdown': serializeParam(
          _priceBreakdown,
          ParamType.DataStruct,
        ),
        'driverId': serializeParam(
          _driverId,
          ParamType.String,
        ),
        'shareLink': serializeParam(
          _shareLink,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.DataStruct,
        ),
        'stops': serializeParam(
          _stops,
          ParamType.DataStruct,
          isList: true,
        ),
        'metadata': serializeParam(
          _metadata,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LalamoveOrderResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LalamoveOrderResponseStruct(
        orderId: deserializeParam(
          data['orderId'],
          ParamType.String,
          false,
        ),
        quotationId: deserializeParam(
          data['quotationId'],
          ParamType.String,
          false,
        ),
        priceBreakdown: deserializeStructParam(
          data['priceBreakdown'],
          ParamType.DataStruct,
          false,
          structBuilder: PriceBreakdownStruct.fromSerializableMap,
        ),
        driverId: deserializeParam(
          data['driverId'],
          ParamType.String,
          false,
        ),
        shareLink: deserializeParam(
          data['shareLink'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        distance: deserializeStructParam(
          data['distance'],
          ParamType.DataStruct,
          false,
          structBuilder: DistanceStruct.fromSerializableMap,
        ),
        stops: deserializeStructParam<StopsStruct>(
          data['stops'],
          ParamType.DataStruct,
          true,
          structBuilder: StopsStruct.fromSerializableMap,
        ),
        metadata: deserializeStructParam(
          data['metadata'],
          ParamType.DataStruct,
          false,
          structBuilder: LalamoveMetadataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LalamoveOrderResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LalamoveOrderResponseStruct &&
        orderId == other.orderId &&
        quotationId == other.quotationId &&
        priceBreakdown == other.priceBreakdown &&
        driverId == other.driverId &&
        shareLink == other.shareLink &&
        status == other.status &&
        distance == other.distance &&
        listEquality.equals(stops, other.stops) &&
        metadata == other.metadata;
  }

  @override
  int get hashCode => const ListEquality().hash([
        orderId,
        quotationId,
        priceBreakdown,
        driverId,
        shareLink,
        status,
        distance,
        stops,
        metadata
      ]);
}

LalamoveOrderResponseStruct createLalamoveOrderResponseStruct({
  String? orderId,
  String? quotationId,
  PriceBreakdownStruct? priceBreakdown,
  String? driverId,
  String? shareLink,
  String? status,
  DistanceStruct? distance,
  LalamoveMetadataStruct? metadata,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LalamoveOrderResponseStruct(
      orderId: orderId,
      quotationId: quotationId,
      priceBreakdown:
          priceBreakdown ?? (clearUnsetFields ? PriceBreakdownStruct() : null),
      driverId: driverId,
      shareLink: shareLink,
      status: status,
      distance: distance ?? (clearUnsetFields ? DistanceStruct() : null),
      metadata:
          metadata ?? (clearUnsetFields ? LalamoveMetadataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LalamoveOrderResponseStruct? updateLalamoveOrderResponseStruct(
  LalamoveOrderResponseStruct? lalamoveOrderResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lalamoveOrderResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLalamoveOrderResponseStructData(
  Map<String, dynamic> firestoreData,
  LalamoveOrderResponseStruct? lalamoveOrderResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lalamoveOrderResponse == null) {
    return;
  }
  if (lalamoveOrderResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      lalamoveOrderResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lalamoveOrderResponseData = getLalamoveOrderResponseFirestoreData(
      lalamoveOrderResponse, forFieldValue);
  final nestedData =
      lalamoveOrderResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      lalamoveOrderResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLalamoveOrderResponseFirestoreData(
  LalamoveOrderResponseStruct? lalamoveOrderResponse, [
  bool forFieldValue = false,
]) {
  if (lalamoveOrderResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lalamoveOrderResponse.toMap());

  // Handle nested data for "priceBreakdown" field.
  addPriceBreakdownStructData(
    firestoreData,
    lalamoveOrderResponse.hasPriceBreakdown()
        ? lalamoveOrderResponse.priceBreakdown
        : null,
    'priceBreakdown',
    forFieldValue,
  );

  // Handle nested data for "distance" field.
  addDistanceStructData(
    firestoreData,
    lalamoveOrderResponse.hasDistance() ? lalamoveOrderResponse.distance : null,
    'distance',
    forFieldValue,
  );

  // Handle nested data for "metadata" field.
  addLalamoveMetadataStructData(
    firestoreData,
    lalamoveOrderResponse.hasMetadata() ? lalamoveOrderResponse.metadata : null,
    'metadata',
    forFieldValue,
  );

  // Add any Firestore field values
  lalamoveOrderResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLalamoveOrderResponseListFirestoreData(
  List<LalamoveOrderResponseStruct>? lalamoveOrderResponses,
) =>
    lalamoveOrderResponses
        ?.map((e) => getLalamoveOrderResponseFirestoreData(e, true))
        .toList() ??
    [];
