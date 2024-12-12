import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffGetQuotation';

/// Start boxDelivery Group Code

class BoxDeliveryGroup {
  static String getBaseUrl({
    String? authorization = '0',
  }) =>
      'https://api.boxdelivery.app/order-hub';
  static Map<String, String> headers = {
    'Authorization': '698e453da8fe1ad28c8cf641f4983a8c',
    'x-api-key': 'tabuleiro-123',
  };
  static CreateRequestCall createRequestCall = CreateRequestCall();
  static GetWebhookStatusCall getWebhookStatusCall = GetWebhookStatusCall();
  static UpdateWebhookCall updateWebhookCall = UpdateWebhookCall();
  static CanceRequestCall canceRequestCall = CanceRequestCall();
}

class CreateRequestCall {
  Future<ApiCallResponse> call({
    String? externalId = '0',
    String? shortExternalReference = '0',
    dynamic? addressJson,
    dynamic? customerJson,
    String? deliveryDatetime = '0',
    String? preparationStart = '0',
    String? orderCreatedAt = '0',
    int? preparationTimeInSeconds = 0,
    double? totalPrice = 0,
    dynamic? itemsJson,
    dynamic? paymentsJson,
    String? marketplaceName = '0',
    String? marketplaceId = '0',
    String? authorization = '0',
  }) async {
    final baseUrl = BoxDeliveryGroup.getBaseUrl(
      authorization: authorization,
    );

    final address = _serializeJson(addressJson);
    final customer = _serializeJson(customerJson);
    final items = _serializeJson(itemsJson);
    final payments = _serializeJson(paymentsJson);
    final ffApiRequestBody = '''
{
  "external_id": "${externalId}",
  "short_external_reference": "${shortExternalReference}",
  "address": ${address},
  "customer": ${customer},
  "delivery_datetime": "${deliveryDatetime}",
  "preparation_start": "${preparationStart}",
  "order_created_at": "${orderCreatedAt}",
  "preparation_time_in_seconds": ${preparationTimeInSeconds},
  "total_price": ${totalPrice},
  "items": [${items}],
  "payments": [${payments}],
  "marketplace_name": "${marketplaceName}",
  "marketplace_id": "${marketplaceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createRequest',
      apiUrl: '${baseUrl}/orders/tabuleiro',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '698e453da8fe1ad28c8cf641f4983a8c',
        'x-api-key': 'tabuleiro-123',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWebhookStatusCall {
  Future<ApiCallResponse> call({
    String? authorization = '0',
  }) async {
    final baseUrl = BoxDeliveryGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getWebhookStatus',
      apiUrl: '${baseUrl}/origins/webhook/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '698e453da8fe1ad28c8cf641f4983a8c',
        'x-api-key': 'tabuleiro-123',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateWebhookCall {
  Future<ApiCallResponse> call({
    String? authorization = '0',
  }) async {
    final baseUrl = BoxDeliveryGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'updateWebhook',
      apiUrl: '${baseUrl}/origins/webhook/update',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '698e453da8fe1ad28c8cf641f4983a8c',
        'x-api-key': 'tabuleiro-123',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CanceRequestCall {
  Future<ApiCallResponse> call({
    String? id = '0',
    String? authorization = '0',
  }) async {
    final baseUrl = BoxDeliveryGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'canceRequest',
      apiUrl: '${baseUrl}/order-hub/orders/:id/cancel',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '698e453da8fe1ad28c8cf641f4983a8c',
        'x-api-key': 'tabuleiro-123',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End boxDelivery Group Code

/// Start lalamove Group Code

class LalamoveGroup {
  static String getBaseUrl({
    String? apikey = 'pk_test_c98241026e7b9a0b14ca5d6c8c7b4b9b',
    String? secret =
        'sk_test_WT5U0EOp4P7qJ7vGgPJlEv7wx5sQ9LNb9ErEjeic+mPCx6PWsJ/M664WNmlX+qMz',
    String? market = 'BR',
    String? signature = '0',
    String? time = '0',
    dynamic? bodyJson,
    double? total = 0,
    String? currency = 'BRL',
    String? orderId = '0',
    String? driverId = '0',
    String? quotationId = '0',
    String? stopId0 = '0',
    String? stopId1 = '',
    String? country = '',
    String? orderRef = '',
    double? quotationTotalFee = 0,
    String? quotationTotalFeeCurrency = 'BRL',
    String? stopId2 = '0',
    String? auth = '0',
  }) =>
      'rest.sandbox.lalamove.com';
  static Map<String, String> headers = {};
  static GetQuotationCall getQuotationCall = GetQuotationCall();
  static PlaceOrderCall placeOrderCall = PlaceOrderCall();
}

class GetQuotationCall {
  Future<ApiCallResponse> call({
    String? apikey = 'pk_test_c98241026e7b9a0b14ca5d6c8c7b4b9b',
    String? secret =
        'sk_test_WT5U0EOp4P7qJ7vGgPJlEv7wx5sQ9LNb9ErEjeic+mPCx6PWsJ/M664WNmlX+qMz',
    String? market = 'BR',
    String? signature = '0',
    String? time = '0',
    dynamic? bodyJson,
    double? total = 0,
    String? currency = 'BRL',
    String? orderId = '0',
    String? driverId = '0',
    String? quotationId = '0',
    String? stopId0 = '0',
    String? stopId1 = '',
    String? country = '',
    String? orderRef = '',
    double? quotationTotalFee = 0,
    String? quotationTotalFeeCurrency = 'BRL',
    String? stopId2 = '0',
    String? auth = '0',
  }) async {
    final baseUrl = LalamoveGroup.getBaseUrl(
      apikey: apikey,
      secret: secret,
      market: market,
      signature: signature,
      time: time,
      bodyJson: bodyJson,
      total: total,
      currency: currency,
      orderId: orderId,
      driverId: driverId,
      quotationId: quotationId,
      stopId0: stopId0,
      stopId1: stopId1,
      country: country,
      orderRef: orderRef,
      quotationTotalFee: quotationTotalFee,
      quotationTotalFeeCurrency: quotationTotalFeeCurrency,
      stopId2: stopId2,
      auth: auth,
    );

    final body = _serializeJson(bodyJson);

    return ApiManager.instance.makeApiCall(
      callName: 'getQuotation',
      apiUrl: '${baseUrl}/v3/quotations',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Market': '${market}',
        'Authorization': '${auth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PlaceOrderCall {
  Future<ApiCallResponse> call({
    String? senderName = '0',
    String? senderPhone = '0',
    String? receiverName = '0',
    String? receiverPhone = '0',
    String? apikey = 'pk_test_c98241026e7b9a0b14ca5d6c8c7b4b9b',
    String? secret =
        'sk_test_WT5U0EOp4P7qJ7vGgPJlEv7wx5sQ9LNb9ErEjeic+mPCx6PWsJ/M664WNmlX+qMz',
    String? market = 'BR',
    String? signature = '0',
    String? time = '0',
    dynamic? bodyJson,
    double? total = 0,
    String? currency = 'BRL',
    String? orderId = '0',
    String? driverId = '0',
    String? quotationId = '0',
    String? stopId0 = '0',
    String? stopId1 = '',
    String? country = '',
    String? orderRef = '',
    double? quotationTotalFee = 0,
    String? quotationTotalFeeCurrency = 'BRL',
    String? stopId2 = '0',
    String? auth = '0',
  }) async {
    final baseUrl = LalamoveGroup.getBaseUrl(
      apikey: apikey,
      secret: secret,
      market: market,
      signature: signature,
      time: time,
      bodyJson: bodyJson,
      total: total,
      currency: currency,
      orderId: orderId,
      driverId: driverId,
      quotationId: quotationId,
      stopId0: stopId0,
      stopId1: stopId1,
      country: country,
      orderRef: orderRef,
      quotationTotalFee: quotationTotalFee,
      quotationTotalFeeCurrency: quotationTotalFeeCurrency,
      stopId2: stopId2,
      auth: auth,
    );

    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = '''
{
  "data": {
    "quotationId": "${quotationId}",
    "sender": {
      "stopId": "${stopId0}",
      "name": "${senderName}",
      "phone": "${senderPhone}"
    },
    "recipients": [
      {
        "stopId": "${stopId1}",
        "name": "${receiverName}",
        "phone": "${receiverPhone}"
      }
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'placeOrder',
      apiUrl: '${baseUrl}/v3/orders',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End lalamove Group Code

/// Start asaasMiddleServices Group Code

class AsaasMiddleServicesGroup {
  static String getBaseUrl() =>
      'https://www.sociodotabuleiro.fun/apiMiddleAsaas/v1';
  static Map<String, String> headers = {};
}

/// End asaasMiddleServices Group Code

class GetCEPInfoCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCEPInfo',
      apiUrl: 'https://viacep.com.br/ws/${cep}/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
  "prompt": "${description}",
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].url''',
      ));
}

class TesteBoxDeliveryCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'testeBoxDelivery',
      apiUrl: 'https://api-stg.boxdelivery.app/order-hub/orders/tabuleiro',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '698e453da8fe1ad28c8cf641f4983a8c',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateClientAsaasCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? cpfCnpj = '',
    String? email = '',
    String? mobilePhone = '',
    String? address = '',
    String? addressNumber = '',
    String? province = '',
    String? postalCode = '',
    String? externalReference = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "cpfCnpj": "${cpfCnpj}",
  "email": "${email}",
  "mobilePhone": "${mobilePhone}",
  "address": "${address}",
  "addressNumber": "${addressNumber}",
  "province": "${province}",
  "postalCode": "${postalCode}",
  "externalReference": "${externalReference}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createClientAsaas',
      apiUrl: 'https://create-client-asaas-667069547103.us-central1.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InsertOrRetrieveTokenCall {
  static Future<ApiCallResponse> call({
    String? userReference = '',
    String? action = '',
  }) async {
    final ffApiRequestBody = '''
{
  "reference": "${userReference}",
  "action": "${action}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insertOrRetrieveToken',
      apiUrl:
          'https://create-retrieve-secret-manager-667069547103.us-central1.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateBillingCardCall {
  static Future<ApiCallResponse> call({
    String? acct = '',
    String? customer = '',
    double? value,
    String? dueDate = '2024-31-12',
    String? description = '',
    String? externalReference = '',
  }) async {
    final ffApiRequestBody = '''
{
  "customer": "${customer}",
  "billingType": "CREDIT_CARD",
  "value": ${value},
  "dueDate": "${dueDate}",
  "description": "${description}",
  "externalReference": "${externalReference}",
  "callback": {
    "successUrl": "https://sociodotabuleiro.fun/apiMiddleAsaas/v1/webhook",
    "autoRedirect": false
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createBillingCard',
      apiUrl: 'https://asaas.com/api/v3/payments',
      callType: ApiCallType.POST,
      headers: {
        'access_token': '${acct}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateBillingPixCall {
  static Future<ApiCallResponse> call({
    String? acct = '',
    String? customer = '',
    double? value,
    String? dueDate = '2024-31-12',
    String? description = '',
    String? externalReference = '',
  }) async {
    final ffApiRequestBody = '''
{
  "customer": "${customer}",
  "billingType": "PIX",
  "value": ${value},
  "dueDate": "${dueDate}",
  "description": "${description}",
  "externalReference": "${externalReference}",
  "callback": {
    "successUrl": "https://sociodotabuleiro.fun/apiMiddleAsaas/v1/webhook",
    "autoRedirect": false
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createBillingPix',
      apiUrl: 'https://asaas.com/api/v3/payments',
      callType: ApiCallType.POST,
      headers: {
        'access_token': '${acct}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PaymentStatusCall {
  static Future<ApiCallResponse> call({
    String? acct = '',
    String? paymentId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'paymentStatus',
      apiUrl: 'https://asaas.com/api/v3/payments/{payment_id}/status',
      callType: ApiCallType.GET,
      headers: {
        'access_token': '${acct}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPixCodeCall {
  static Future<ApiCallResponse> call({
    String? acct = '',
    String? paymentId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPixCode',
      apiUrl: 'https://asaas.com/api/v3/payments/{payment_id}/pixQrCode',
      callType: ApiCallType.GET,
      headers: {
        'access_token': '${acct}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQuotationLalaMoveCall {
  static Future<ApiCallResponse> call({
    String? authToken,
    String? latSender = '',
    String? lngSender = '',
    String? latReceiver = '',
    String? lngReceiver = '',
    String? addressSender = '',
    String? addressReceiver = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetQuotationLalaMoveCall',
        'variables': {
          'authToken': authToken,
          'latSender': latSender,
          'lngSender': lngSender,
          'latReceiver': latReceiver,
          'lngReceiver': lngReceiver,
          'addressSender': addressSender,
          'addressReceiver': addressReceiver,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? totalPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.priceBreakdown.total''',
      ));
  static String? quotationId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.quotationId''',
      ));
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
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
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
