// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class QrCodeStruct extends FFFirebaseStruct {
  QrCodeStruct({
    String? encodedImage,
    String? payload,
    String? qrCodeImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _encodedImage = encodedImage,
        _payload = payload,
        _qrCodeImage = qrCodeImage,
        super(firestoreUtilData);

  // "encodedImage" field.
  String? _encodedImage;
  String get encodedImage =>
      _encodedImage ??
      'iVBORw0KGgoAAAANSUhEUgAAAYsAAAGLCAIAAAC5gincAAAOPElEQVR42u3aUXYbORADQN3/0s4dIjYapAq/iuwZsln0W+znT0SkNR9LICKEEhEhlIgQSkSEUCJCKBERQomIEEpECCUiQigRIZSICKFERAglIoQSESGUiBBKRIRQIiKEEhFCiYgQSkQIJSJCKBERQokIoUREyoX6pPLNU8199+ArxL77zTPHFufgU22t5DcPefCkdJ5QQhGKUIQiFKEIRShCEYpQhCIUoQhFKEIR6mmhtn5y7IjOPfPWUTl4vLc2NEbw3GzMHf6SE0ooQhGKUIQiFKEIRShCEYpQhCIUoQhFKEL9sFAltdGNszK3/VuN29x35yb2CjevOKGEIhShCEUoQhGKUIQiFKEIRShCEYpQhCIUoeJCXbFJWx1iZztZwvfni8y973vDTyhCEYpQhCIUoQhFKEIRilCEIhShCEUoQhFqu3HbqskeQOdgStyMTXuMQkIRilCEIhShCEUoQhGKUIQiFKEIRShCEYpQZUKV/OS5WdkyN/aQW8jGWrOS2Xj+qiMUoQhFKEIRilCEIhShCEUoQhGKUIQiFKF+SajO0+5Tn/o0fEIJ5VOf+pRQhPKpTwlFKEL51KeEIpRPfUqoXxJqKyUl2lylePDTzvfd+sdzRWfsin0+hCIUoQhFKEIRilCEIhShCEUoQhGKUIQi1FtCffMf/+d6hINPdfDwlyzOwTM59/olq7E1GzEoCUUoQhGKUIQiFKEIRShCEYpQhCIUoQhFKELNC9U5SbHKaW5x5qSIbejcLTI33p1lZez8EopQhCIUoQhFKEIRilCEIhShCEUoQhGKUD8s1FxxMHdyYnXVlvVzHdOc9SW1YEyorftp7oQSilCEIhShCEUoQhGKUIQiFKEIRShCEYpQPyxUZ6fWWWbFpLjinjioaqxCLWmf5zj76wihCEUoQhGKUIQiFKEIRShCEYpQhCIUoQj1llBzTcHcMduyYGu+t6q9rXpubq22LuAr/qQgFKEIRShCEYpQhCIUoQhFKEIRilCEIhShfkmoWI9wsPuIHdG5tm6u24rBcSPuMTfnrufOHpBQhCIUoQhFKEIRilCEIhShCEUoQhGKUIS6Tai5TZpr3Ob8KjE31pnOmfveTfDAsYqFUIQiFKEIRShCEYpQhCIUoQhFKEIRilCEelqo2OhcscExGWP0z4m8ZcFcDbp1jkrcJBShCEUoQhGKUIQiFKEIRShCEYpQhCIUod4SqqSv6TQ3VnWV9DVz5s5JUYJ77KnuGCRCEYpQhCIUoQhFKEIRilCEIhShCEUoQhHqMqG2VjbWjJSMzlbDGBv3uV1YK6TGRjTWuK39lUAoQhGKUIQiFKEIRShCEYpQhCIUoQhFKEJdJtRWuVNygGMUPl9XbS3O1kUYuzZityahCEUoQhGKUIQiFKEIRShCEYpQhCIUoQj1w0JtNV9b3cfcyYmZO9epleg2h07nY2ytJKEIRShCEYpQhCIUoQhFKEIRilCEIhShCEWogemPbdLWNHRWqAfne6vJnVvnrQY5dk/EbiBCEYpQhCIUoQhFKEIRilCEIhShCEUoQhHqaaFiFsTm7IrKae67Ja+/RXBsGA6OaEnPSyhCEYpQhCIUoQhFKEIRilCEIhShCEUoQhFq/tTFHvJvKXMHeO5HxW6vWAFXsimxO7VkywhFKEIRilCEIhShCEUoQhGKUIQiFKEIRajLhYrtd8kWxlT95pnnSqXYLmwdwq1u+pvH2DqhhCIUoQhFKEIRilCEIhShCEUoQhGKUIQiFKHi3dbW2MUe4+ArxLAr2e7YIZzrxWJg3XEBE4pQhCIUoQhFKEIRilCEIhShCEUoQhGKUJcJFZvguaKkpFX55o1K6qq5M3lFSxizYGthr+zyCEUoQhGKUIQiFKEIRShCEYpQhCIUoQhFqIUur+QAz71CZ+W01rmkiqEYWLHzfAV2sUEiFKEIRShCEYpQhCIUoQhFKEIRilCEIhShfkmozh6hpIE6aF/nTRA7sTe2olv/ONZcE4pQhCIUoQhFKEIRilCEIhShCEUoQhGKUE8LNbfBN05wSRUSG+itteq8VGJwlFxXg5cZoQhFKEIRilCEIhShCEUoQhGKUIQiFKEI9bJQW+dq7hfNiRxr3B44DLGVjL3+1kOW3LiEIhShCEUoQhGKUIQiFKEIRShCEYpQhCLU00LNTdKNvyh2GG5soGJN7o3mlrwgoQhFKEIRilCEIhShCEUoQhGKUIQiFKEIRaibi7+53uTgTy4pDWNFZwk6BycnNmY3loaEIhShCEUoQhGKUIQiFKEIRShCEYpQhCLUW0Jtrd1cARf7yVstYWwXHiiztrrazw258v82IBShCEUoQhGKUIQiFKEIRShCEYpQhCIUoRJd3ta5OvgYJd/dKsJK9ijWfM0dwtiWlewRoQhFKEIRilCEIhShCEUoQhGKUIQiFKEI9cNClZycrTmbG46DUszdIrE96iwc5/a3pDONzSShCEUoQhGKUIQiFKEIRShCEYpQhCIUoQj1llAlPVHMoNj0x9Z5qyfKTX+Hm1uDVHJNEopQhCIUoQhFKEIRilCEIhShCEUoQhGKUG8JdbAnOrjfsZIlhvsVJ6ek2J0Da24YSnrAmEGEIhShCEUoQhGKUIQiFKEIRShCEYpQhCLUW0LNHbPOE9vZ5sxtSuzwx7asZFRindrWQxKKUIQiFKEIRShCEYpQhCIUoQhFKEIRilCEip/nWAHXScPWWs29b0n/eOOWxb5LKEIRilCEIhShCEUoQhGKUIQiFKEIRShCEWqg64kVQ3PrXlKTzY37Vu95xe5vtYRbpTChCEUoQhGKUIQiFKEIRShCEYpQhCIUoQhFqLhfsZPzvIxX9HFzKzmH7FbN/cAAE4pQhCIUoQhFKEIRilCEIhShCEUoQhGKUJcLNXfMSmrBg9PQKXKs3In93rlms+SNSto6QhGKUIQiFKEIRShCEYpQhCIUoQhFKEIRilADBs0NR+cGby3sjXtUciHNPeQc7rF1JhShCEUoQhGKUIQiFKEIRShCEYpQhCIUoQj1X9NwRU80p1vJK5SUdwdH5eCmbA3D3HW1NUiEIhShCEUoQhGKUIQiFKEIRShCEYpQhCIUobpPXUzVudff6i63lu4KZN9735i5hCIUoQhFKEIRilCEIhShCEUoQhGKUIQi1G1ClSzlll8xkmKTNFjQnMtcabi1ZTf2y3d0eYQiFKEIRShCEYpQhCIUoQhFKEIRilCEIlSdUFuTFDuiW61ZiX2dh6FkkGLoxE4ZoQhFKEIRilCEIhShCEUoQhGKUIQiFKEIRaiysSvpTW5s3Lam8GD9ujUqc11eyYiuDQOhCEUoQhGKUIQiFKEIRShCEYpQhCIUoQh1mVBzPdEcK3MVTCejW1Lc+Eadd9vcdRXbBUIRilCEIhShCEUoQhGKUIQiFKEIRShCEeppobZeKVY6XKHqVtW1dZ6vWKvOai/WEROKUIQiFKEIRShCEYpQhCIUoQhFKEIRilCEGljoEmVKNL/xJpjbhc7VmDM3tnRbYBGKUIQiFKEIRShCEYpQhCIUoQhFKEIRilBPd3kH3//gdzvLjk50DpZ3sbut5DyX3HydhTKhCEUoQhGKUIQiFKEIRShCEYpQhCIUoQh1uVBz4z6331tulsx37ADP3RNb2z3XuG2tc6dfhCIUoQhFKEIRilCEIhShCEUoQhGKUIQi1G1CzTVBW73Y3Njd2GzGOtOtC6lkzLYc2Zo6QhGKUIQiFKEIRShCEYpQhCIUoQhFKEIR6i2htpqv2CGMgVXyCiWnPfYKczNZgnvnhhKKUIQiFKEIRShCEYpQhCIUoQhFKEIRilBvCdV5kG5sr0rqm89SthZnDuiS15/rHwlFKEIRilCEIhShCEUoQhGKUIQiFKEIRShCzbd1W3XG1mrE+qnYOs/1RCXvexC7raKTUIQiFKEIRShCEYpQhCIUoQhFKEIRilCEIlT81JWMXayO3GrrYtiVNJudHXHM6077CEUoQhGKUIQiFKEIRShCEYpQhCIUoQhFKEINoDN3CEvsKzkbsU2Z+0UxkUtq0K22jlCEIhShCEUoQhGKUIQiFKEIRShCEYpQhCLU/FNuMRqbs7nEpn+rjY3dIp3fnRvCrSuWUIQiFKEIRShCEYpQhCIUoQhFKEIRilCE+iWhDk7h1jZ09o9bBWsnOlsHONYwxrZs688RQhGKUIQiFKEIRShCEYpQhCIUoQhFKEIR6jahSuq5rX5qq/naKjpLet6DPzl2a84tbGeHSChCEYpQhCIUoQhFKEIRilCEIhShCEUoQv2SUCXVz9YhPLgac69Q8nu3LqSSu21Ot61il1CEIhShCEUoQhGKUIQiFKEIRShCEYpQhCJUWV8zZ9/cd7cKx5LK6SA6W2cyBlbJ7hOKUIQiFKEIRShCEYpQhCIUoQhFKEIRilCEGnjD2NmI1UZzY1dycmLlbOwwxIa/5D6O3daEIhShCEUoQhGKUIQiFKEIRShCEYpQhCIUoeaP2TeLtdW4zc1o7NPO+jX2gjFVO+8JXR6hCEUoQhGKUIQiFKEIRShCEYpQhCIUoQjVLVSsUzs4sp32lWh+xT0Ru0Xm/vHc6xOKUIQiFKEIRShCEYpQhCIUoQhFKEIRilCEKvvJsSqkRPMbL4Yr2tityTn4VHecfUIRilCEIhShCEUoQhGKUIQiFKEIRShCEepuoUosKCkcY/XNFWDFjtncpmyd2INH8u+GEIpQhCIUoQhFKEIRilCEIhShCEUoQhGKULcJJSJCKBEhlIgIoURECCUihBIRIZSIEEpEhFAiIoQSEUKJiBBKRAglIkIoERFCiQihREQIJSKEEhEhlIgIoUSEUCIihBIRQomIEEpEhFAi0p9/rU9py8QsAXgAAAAASUVORK5CYII=';
  set encodedImage(String? val) => _encodedImage = val;

  bool hasEncodedImage() => _encodedImage != null;

  // "payload" field.
  String? _payload;
  String get payload =>
      _payload ??
      '00020126580014br.gov.bcb.pix0136b1484262-4f12-4d82-9406-5bea18c1119e5204000053039865802BR5925BFF COMERCIO E SERVICOS L6008Campinas62290525SOCIODOT00000365848308ASA6304B316';
  set payload(String? val) => _payload = val;

  bool hasPayload() => _payload != null;

  // "qrCodeImage" field.
  String? _qrCodeImage;
  String get qrCodeImage =>
      _qrCodeImage ??
      'https://firebasestorage.googleapis.com/v0/b/sociodotabuleiro-jogos/o/public%2Fimg%2Fsystem%2FqrCode.png?alt=media&token=d3a81b46-4408-4db1-97cb-7c657698fb8b';
  set qrCodeImage(String? val) => _qrCodeImage = val;

  bool hasQrCodeImage() => _qrCodeImage != null;

  static QrCodeStruct fromMap(Map<String, dynamic> data) => QrCodeStruct(
        encodedImage: data['encodedImage'] as String?,
        payload: data['payload'] as String?,
        qrCodeImage: data['qrCodeImage'] as String?,
      );

  static QrCodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? QrCodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'encodedImage': _encodedImage,
        'payload': _payload,
        'qrCodeImage': _qrCodeImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'encodedImage': serializeParam(
          _encodedImage,
          ParamType.String,
        ),
        'payload': serializeParam(
          _payload,
          ParamType.String,
        ),
        'qrCodeImage': serializeParam(
          _qrCodeImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static QrCodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      QrCodeStruct(
        encodedImage: deserializeParam(
          data['encodedImage'],
          ParamType.String,
          false,
        ),
        payload: deserializeParam(
          data['payload'],
          ParamType.String,
          false,
        ),
        qrCodeImage: deserializeParam(
          data['qrCodeImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QrCodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QrCodeStruct &&
        encodedImage == other.encodedImage &&
        payload == other.payload &&
        qrCodeImage == other.qrCodeImage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([encodedImage, payload, qrCodeImage]);
}

QrCodeStruct createQrCodeStruct({
  String? encodedImage,
  String? payload,
  String? qrCodeImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QrCodeStruct(
      encodedImage: encodedImage,
      payload: payload,
      qrCodeImage: qrCodeImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QrCodeStruct? updateQrCodeStruct(
  QrCodeStruct? qrCode, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    qrCode
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQrCodeStructData(
  Map<String, dynamic> firestoreData,
  QrCodeStruct? qrCode,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (qrCode == null) {
    return;
  }
  if (qrCode.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && qrCode.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final qrCodeData = getQrCodeFirestoreData(qrCode, forFieldValue);
  final nestedData = qrCodeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = qrCode.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQrCodeFirestoreData(
  QrCodeStruct? qrCode, [
  bool forFieldValue = false,
]) {
  if (qrCode == null) {
    return {};
  }
  final firestoreData = mapToFirestore(qrCode.toMap());

  // Add any Firestore field values
  qrCode.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQrCodeListFirestoreData(
  List<QrCodeStruct>? qrCodes,
) =>
    qrCodes?.map((e) => getQrCodeFirestoreData(e, true)).toList() ?? [];
