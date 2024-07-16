// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesStruct extends FFFirebaseStruct {
  CategoriesStruct({
    List<String>? names,
    List<String>? thumbnail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _names = names,
        _thumbnail = thumbnail,
        super(firestoreUtilData);

  // "names" field.
  List<String>? _names;
  List<String> get names => _names ?? const [];
  set names(List<String>? val) => _names = val;

  void updateNames(Function(List<String>) updateFn) {
    updateFn(_names ??= []);
  }

  bool hasNames() => _names != null;

  // "thumbnail" field.
  List<String>? _thumbnail;
  List<String> get thumbnail => _thumbnail ?? const [];
  set thumbnail(List<String>? val) => _thumbnail = val;

  void updateThumbnail(Function(List<String>) updateFn) {
    updateFn(_thumbnail ??= []);
  }

  bool hasThumbnail() => _thumbnail != null;

  static CategoriesStruct fromMap(Map<String, dynamic> data) =>
      CategoriesStruct(
        names: getDataList(data['names']),
        thumbnail: getDataList(data['thumbnail']),
      );

  static CategoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'names': _names,
        'thumbnail': _thumbnail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'names': serializeParam(
          _names,
          ParamType.String,
          isList: true,
        ),
        'thumbnail': serializeParam(
          _thumbnail,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CategoriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriesStruct(
        names: deserializeParam<String>(
          data['names'],
          ParamType.String,
          true,
        ),
        thumbnail: deserializeParam<String>(
          data['thumbnail'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CategoriesStruct &&
        listEquality.equals(names, other.names) &&
        listEquality.equals(thumbnail, other.thumbnail);
  }

  @override
  int get hashCode => const ListEquality().hash([names, thumbnail]);
}

CategoriesStruct createCategoriesStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoriesStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoriesStruct? updateCategoriesStruct(
  CategoriesStruct? categories, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categories
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoriesStructData(
  Map<String, dynamic> firestoreData,
  CategoriesStruct? categories,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categories == null) {
    return;
  }
  if (categories.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categories.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoriesData = getCategoriesFirestoreData(categories, forFieldValue);
  final nestedData = categoriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categories.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoriesFirestoreData(
  CategoriesStruct? categories, [
  bool forFieldValue = false,
]) {
  if (categories == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categories.toMap());

  // Add any Firestore field values
  categories.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoriesListFirestoreData(
  List<CategoriesStruct>? categoriess,
) =>
    categoriess?.map((e) => getCategoriesFirestoreData(e, true)).toList() ?? [];
