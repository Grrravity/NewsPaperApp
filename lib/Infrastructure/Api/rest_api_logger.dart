import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class RestApiLogger {
  Duration _computeTime = const Duration();
  Stopwatch stopwatch = Stopwatch()..start();

  Request onRequestLogger(Request request) {
    debugPrint('REQUEST[${request.method}] => PATH: ${request.url}');
    debugPrint('REQUEST[${request.method}] => PATH: ${request.headers}');

    if (request.url.queryParameters.isNotEmpty) {
      debugPrint(
        'REQUEST[${request.method}] => QUERY-PARAMETERS: ${request.url.queryParameters}',
      );
    }

    if (request.files != null && kDebugMode) {
      debugPrint(request.files!.fields.toString());
    } else if (kDebugMode) {
      if (request.method == 'POST' ||
          request.method == 'PUT' ||
          request.method == 'PATCH') {
        var jsonData = json.encode(request.bodyBytes.bytesToString());
        debugPrint(jsonData);
      }
    }

    return request;
  }

  Response onResponseLogger(Response response) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.request?.url}',
    );
    if (kDebugMode) {
      debugPrint(
        'RESPONSE[${response.statusCode}] => BODY: ${response.bodyString}',
      );
    }
    _computeTime = _computeTime + stopwatch.elapsed;
    debugPrint(
      'COMPUTE TIME : ${stopwatch.elapsed} - TOTAL : ${_computeTime.toString()}',
    );
    _computeTime = const Duration();
    return response;
  }

  Response onErrorLogger(Response response) {
    debugPrint(
      'ERROR[${response.statusCode}] => PATH: ${response.request?.url}',
    );
    if (kDebugMode) {
      debugPrint(
          'ERROR[${response.statusCode}] => BODY: ${response.bodyString}');
    }
    _computeTime = _computeTime + stopwatch.elapsed;
    debugPrint('COMPUTE TIME : ${stopwatch.elapsed}');
    _computeTime = const Duration();
    return response;
  }
}
