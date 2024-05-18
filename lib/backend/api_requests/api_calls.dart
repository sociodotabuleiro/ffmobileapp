import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetCEPInfoCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCEPInfo',
      apiUrl: 'https://viacep.com.br/ws/$cep/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? ddd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ddd''',
      ));
  static String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
      ));
  static String? cidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.localidade''',
      ));
  static String? logradouro(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
}

class GetImageOpenAiCall {
  static Future<ApiCallResponse> call({
    String? description = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "dall-e-3",
  "prompt": "$description",
  "n": 1,
  "size": "1024x1024"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getImageOpenAi',
      apiUrl: 'https://api.openai.com/v1/images/generations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer sk-flutterflowsa-zTyXZF5BiolN8ZFKeynPT3BlbkFJL4jAlMIOFfAUPyZbMkPM',
        'OpenAI-Organization': 'org-746FybSj1XnlCZfcEzR92ZAc',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].url''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
