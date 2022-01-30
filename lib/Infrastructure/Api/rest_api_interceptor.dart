import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:newspaperapp/Core/env/env.dart';

import 'rest_api_logger.dart';

class RestApiInterceptor extends RestApiLogger {
  ///Add Apikey header to every request
  Future<Request> requestModifier(Request request) async {
    request.headers.addAll({
      'Authorization': EnvConfig.API_KEY,
    });

    onRequestLogger(request);
    return request;
  }

  Response responseModifier(Request request, Response response) {
    onResponseLogger(response);
    return response;
  }
}
