import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UserTokenCall {
  static Future<ApiCallResponse> call({
    dynamic? tokenJson,
  }) {
    final token = _serializeJson(tokenJson, true);
    final ffApiRequestBody = '''
${token}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Token',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/gettoken',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic atmIDDip(dynamic response) => getJsonField(
        response,
        r'''$..atmId''',
      );
  static dynamic gradeDip(dynamic response) => getJsonField(
        response,
        r'''$..grade''',
      );
}

class UserTokenMainCall {
  static Future<ApiCallResponse> call({
    String? userName = '',
    int? sessionId,
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userName}",
  "password": "${userName}",
  "sessionID": "000",
  "requestTimestamp": "2023-05-25 17:24:44",
  "requestType": "GetToken"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Token Main',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/gettoken',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic atmIDDip(dynamic response) => getJsonField(
        response,
        r'''$..atmId''',
      );
  static dynamic gradeDip(dynamic response) => getJsonField(
        response,
        r'''$..grade''',
      );
}

class DashboardCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "token": "${token}",
  "sessionID": "4456",
  "requestTimestamp": "2023-05-25 17:24:44",
  "requestType": "GetDashbordData"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Dashboard',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/getdashborddata',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FilterCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "token": "${token}",
  "sessionID": "4456",
  "requestTimestamp": "2023-05-25 17:24:44",
  "requestType": "GetFilterData"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Filter',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/masterfilterdata',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransectionDipCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "token": "${token}",
  "dipCount": 1,
  "requestType": "GetTransactionDipAtmData",
  "requestTimeStamp": "2023-05-25 10:56:35",
  "sessionId": "3567"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TransectionDip',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/atm/transaction/dip',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic dipData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic dipATMID(dynamic response) => getJsonField(
        response,
        r'''$.data[:].atmId''',
        true,
      );
  static dynamic dipGrade(dynamic response) => getJsonField(
        response,
        r'''$.data[:].grade''',
        true,
      );
  static dynamic dipBank(dynamic response) => getJsonField(
        response,
        r'''$.data[:].bank''',
        true,
      );
  static dynamic dipLocation(dynamic response) => getJsonField(
        response,
        r'''$.data[:].location''',
        true,
      );
  static dynamic dipTransaction(dynamic response) => getJsonField(
        response,
        r'''$.data[:].transactionTrend''',
        true,
      );
  static dynamic dipUptime(dynamic response) => getJsonField(
        response,
        r'''$.data[:].uptimeTrend''',
        true,
      );
  static dynamic dipDowntime(dynamic response) => getJsonField(
        response,
        r'''$.data[:].downtime''',
        true,
      );
  static dynamic dipReason(dynamic response) => getJsonField(
        response,
        r'''$.data[:].reason''',
        true,
      );
}

class MachineDownCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "token": "${token}",
  "dipCount": 1,
  "requestType": "GetTransactionDownAtmData",
  "requestTimeStamp": "2023-05-25 10:56:35",
  "sessionId": "3567"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Machine Down',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/atm/down',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic atmID(dynamic response) => getJsonField(
        response,
        r'''$.data[:].atmId''',
        true,
      );
  static dynamic grade(dynamic response) => getJsonField(
        response,
        r'''$.data[:].grade''',
        true,
      );
  static dynamic bank(dynamic response) => getJsonField(
        response,
        r'''$.data[:].bank''',
        true,
      );
  static dynamic location(dynamic response) => getJsonField(
        response,
        r'''$.data[:].location''',
        true,
      );
  static dynamic transactionTrend(dynamic response) => getJsonField(
        response,
        r'''$.data[:].transactionTrend''',
        true,
      );
  static dynamic uptimeTrend(dynamic response) => getJsonField(
        response,
        r'''$.data[:].uptimeTrend''',
        true,
      );
  static dynamic downTime(dynamic response) => getJsonField(
        response,
        r'''$.data[:].downtime''',
        true,
      );
  static dynamic reason(dynamic response) => getJsonField(
        response,
        r'''$.data[:].reason''',
        true,
      );
}

class AllAtmCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "token": "${token}",
  "requestType": "GetAllAssignedATMDetails",
  "requestTimeStamp": "2023-05-25 10:56:35",
  "sessionId": "3567"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ALL ATM',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/all/atmdetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LatestBankDataCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "token": "${token}",
  "requestType": "GetLastUpdatedBankData",
  "requestTimeStamp": "2023-05-25 10:56:35",
  "sessionId": "3567"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Latest Bank Data',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/lastupdatedbankdata',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ATMDetailsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
    String? atmId = '',
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "token": "${token}",
  "atmId": "${atmId}",
  "requestType": "GetAtmDetails",
  "requestTimeStamp": "2023-05-25 10:56:35",
  "sessionId": "3567"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ATM Details',
      apiUrl: 'https://ftweb.hitachi-payments.com:8443/getatmdetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FieldTrakLoginCall {
  static Future<ApiCallResponse> call({
    String? userName = '',
    String? password = '',
  }) {
    final ffApiRequestBody = '''
{
  "user_name": "${userName}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Field Trak Login',
      apiUrl:
          'https://fieldtrak.hitachi-payments.com/FieldTrak2/API/v2/ValidateLogin',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
