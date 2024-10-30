// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvatarSettingStruct extends FFFirebaseStruct {
  AvatarSettingStruct({
    String? raca,
    String? genero,
    String? idade,
    String? epoca,
    String? aparenciafisica,
    String? vestimentas,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _raca = raca,
        _genero = genero,
        _idade = idade,
        _epoca = epoca,
        _aparenciafisica = aparenciafisica,
        _vestimentas = vestimentas,
        super(firestoreUtilData);

  // "raca" field.
  String? _raca;
  String get raca => _raca ?? '';
  set raca(String? val) => _raca = val;

  bool hasRaca() => _raca != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  set genero(String? val) => _genero = val;

  bool hasGenero() => _genero != null;

  // "idade" field.
  String? _idade;
  String get idade => _idade ?? '';
  set idade(String? val) => _idade = val;

  bool hasIdade() => _idade != null;

  // "epoca" field.
  String? _epoca;
  String get epoca => _epoca ?? '';
  set epoca(String? val) => _epoca = val;

  bool hasEpoca() => _epoca != null;

  // "aparenciafisica" field.
  String? _aparenciafisica;
  String get aparenciafisica => _aparenciafisica ?? '';
  set aparenciafisica(String? val) => _aparenciafisica = val;

  bool hasAparenciafisica() => _aparenciafisica != null;

  // "vestimentas" field.
  String? _vestimentas;
  String get vestimentas => _vestimentas ?? '';
  set vestimentas(String? val) => _vestimentas = val;

  bool hasVestimentas() => _vestimentas != null;

  static AvatarSettingStruct fromMap(Map<String, dynamic> data) =>
      AvatarSettingStruct(
        raca: data['raca'] as String?,
        genero: data['genero'] as String?,
        idade: data['idade'] as String?,
        epoca: data['epoca'] as String?,
        aparenciafisica: data['aparenciafisica'] as String?,
        vestimentas: data['vestimentas'] as String?,
      );

  static AvatarSettingStruct? maybeFromMap(dynamic data) => data is Map
      ? AvatarSettingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'raca': _raca,
        'genero': _genero,
        'idade': _idade,
        'epoca': _epoca,
        'aparenciafisica': _aparenciafisica,
        'vestimentas': _vestimentas,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'raca': serializeParam(
          _raca,
          ParamType.String,
        ),
        'genero': serializeParam(
          _genero,
          ParamType.String,
        ),
        'idade': serializeParam(
          _idade,
          ParamType.String,
        ),
        'epoca': serializeParam(
          _epoca,
          ParamType.String,
        ),
        'aparenciafisica': serializeParam(
          _aparenciafisica,
          ParamType.String,
        ),
        'vestimentas': serializeParam(
          _vestimentas,
          ParamType.String,
        ),
      }.withoutNulls;

  static AvatarSettingStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvatarSettingStruct(
        raca: deserializeParam(
          data['raca'],
          ParamType.String,
          false,
        ),
        genero: deserializeParam(
          data['genero'],
          ParamType.String,
          false,
        ),
        idade: deserializeParam(
          data['idade'],
          ParamType.String,
          false,
        ),
        epoca: deserializeParam(
          data['epoca'],
          ParamType.String,
          false,
        ),
        aparenciafisica: deserializeParam(
          data['aparenciafisica'],
          ParamType.String,
          false,
        ),
        vestimentas: deserializeParam(
          data['vestimentas'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AvatarSettingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvatarSettingStruct &&
        raca == other.raca &&
        genero == other.genero &&
        idade == other.idade &&
        epoca == other.epoca &&
        aparenciafisica == other.aparenciafisica &&
        vestimentas == other.vestimentas;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([raca, genero, idade, epoca, aparenciafisica, vestimentas]);
}

AvatarSettingStruct createAvatarSettingStruct({
  String? raca,
  String? genero,
  String? idade,
  String? epoca,
  String? aparenciafisica,
  String? vestimentas,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvatarSettingStruct(
      raca: raca,
      genero: genero,
      idade: idade,
      epoca: epoca,
      aparenciafisica: aparenciafisica,
      vestimentas: vestimentas,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvatarSettingStruct? updateAvatarSettingStruct(
  AvatarSettingStruct? avatarSetting, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    avatarSetting
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvatarSettingStructData(
  Map<String, dynamic> firestoreData,
  AvatarSettingStruct? avatarSetting,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (avatarSetting == null) {
    return;
  }
  if (avatarSetting.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && avatarSetting.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final avatarSettingData =
      getAvatarSettingFirestoreData(avatarSetting, forFieldValue);
  final nestedData =
      avatarSettingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = avatarSetting.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvatarSettingFirestoreData(
  AvatarSettingStruct? avatarSetting, [
  bool forFieldValue = false,
]) {
  if (avatarSetting == null) {
    return {};
  }
  final firestoreData = mapToFirestore(avatarSetting.toMap());

  // Add any Firestore field values
  avatarSetting.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvatarSettingListFirestoreData(
  List<AvatarSettingStruct>? avatarSettings,
) =>
    avatarSettings
        ?.map((e) => getAvatarSettingFirestoreData(e, true))
        .toList() ??
    [];
