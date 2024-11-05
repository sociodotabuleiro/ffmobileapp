// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? street,
    String? number,
    String? complement,
    String? neighborhood,
    String? closeReferencePoint,
    String? city,
    String? state,
    String? zip,
    String? country,
    LatLng? coordinates,
    String? geohash,
    double? lat,
    double? lng,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _street = street,
        _number = number,
        _complement = complement,
        _neighborhood = neighborhood,
        _closeReferencePoint = closeReferencePoint,
        _city = city,
        _state = state,
        _zip = zip,
        _country = country,
        _coordinates = coordinates,
        _geohash = geohash,
        _lat = lat,
        _lng = lng,
        _name = name,
        super(firestoreUtilData);

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;

  bool hasStreet() => _street != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;

  bool hasNumber() => _number != null;

  // "complement" field.
  String? _complement;
  String get complement => _complement ?? '';
  set complement(String? val) => _complement = val;

  bool hasComplement() => _complement != null;

  // "neighborhood" field.
  String? _neighborhood;
  String get neighborhood => _neighborhood ?? '';
  set neighborhood(String? val) => _neighborhood = val;

  bool hasNeighborhood() => _neighborhood != null;

  // "closeReferencePoint" field.
  String? _closeReferencePoint;
  String get closeReferencePoint => _closeReferencePoint ?? '';
  set closeReferencePoint(String? val) => _closeReferencePoint = val;

  bool hasCloseReferencePoint() => _closeReferencePoint != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  set zip(String? val) => _zip = val;

  bool hasZip() => _zip != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  set coordinates(LatLng? val) => _coordinates = val;

  bool hasCoordinates() => _coordinates != null;

  // "geohash" field.
  String? _geohash;
  String get geohash => _geohash ?? '';
  set geohash(String? val) => _geohash = val;

  bool hasGeohash() => _geohash != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;

  void incrementLng(double amount) => lng = lng + amount;

  bool hasLng() => _lng != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        street: data['street'] as String?,
        number: data['number'] as String?,
        complement: data['complement'] as String?,
        neighborhood: data['neighborhood'] as String?,
        closeReferencePoint: data['closeReferencePoint'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        zip: data['zip'] as String?,
        country: data['country'] as String?,
        coordinates: data['coordinates'] as LatLng?,
        geohash: data['geohash'] as String?,
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
        name: data['name'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'street': _street,
        'number': _number,
        'complement': _complement,
        'neighborhood': _neighborhood,
        'closeReferencePoint': _closeReferencePoint,
        'city': _city,
        'state': _state,
        'zip': _zip,
        'country': _country,
        'coordinates': _coordinates,
        'geohash': _geohash,
        'lat': _lat,
        'lng': _lng,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'complement': serializeParam(
          _complement,
          ParamType.String,
        ),
        'neighborhood': serializeParam(
          _neighborhood,
          ParamType.String,
        ),
        'closeReferencePoint': serializeParam(
          _closeReferencePoint,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'zip': serializeParam(
          _zip,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'coordinates': serializeParam(
          _coordinates,
          ParamType.LatLng,
        ),
        'geohash': serializeParam(
          _geohash,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        complement: deserializeParam(
          data['complement'],
          ParamType.String,
          false,
        ),
        neighborhood: deserializeParam(
          data['neighborhood'],
          ParamType.String,
          false,
        ),
        closeReferencePoint: deserializeParam(
          data['closeReferencePoint'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        zip: deserializeParam(
          data['zip'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        coordinates: deserializeParam(
          data['coordinates'],
          ParamType.LatLng,
          false,
        ),
        geohash: deserializeParam(
          data['geohash'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        street == other.street &&
        number == other.number &&
        complement == other.complement &&
        neighborhood == other.neighborhood &&
        closeReferencePoint == other.closeReferencePoint &&
        city == other.city &&
        state == other.state &&
        zip == other.zip &&
        country == other.country &&
        coordinates == other.coordinates &&
        geohash == other.geohash &&
        lat == other.lat &&
        lng == other.lng &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([
        street,
        number,
        complement,
        neighborhood,
        closeReferencePoint,
        city,
        state,
        zip,
        country,
        coordinates,
        geohash,
        lat,
        lng,
        name
      ]);
}

AddressStruct createAddressStruct({
  String? street,
  String? number,
  String? complement,
  String? neighborhood,
  String? closeReferencePoint,
  String? city,
  String? state,
  String? zip,
  String? country,
  LatLng? coordinates,
  String? geohash,
  double? lat,
  double? lng,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      street: street,
      number: number,
      complement: complement,
      neighborhood: neighborhood,
      closeReferencePoint: closeReferencePoint,
      city: city,
      state: state,
      zip: zip,
      country: country,
      coordinates: coordinates,
      geohash: geohash,
      lat: lat,
      lng: lng,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
