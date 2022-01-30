import 'package:get/get.dart';
import 'package:newspaperapp/Core/env/env.dart';

import 'rest_api_interceptor.dart';

class RestApiClient extends GetHttpClient {
  final GetHttpClient client = GetHttpClient();

  RestApiClient({
    required RestApiInterceptor restApiInterceptor,
  }) {
    client.baseUrl = EnvConfig.BASE_URL;
    client.timeout = const Duration(seconds: 30);
    client.defaultContentType = 'application/json; charset=utf-8';
    client.addRequestModifier<dynamic>(
      (request) => restApiInterceptor.requestModifier(request),
    );
    client.addResponseModifier(
      (request, response) =>
          restApiInterceptor.responseModifier(request, response),
    );
  }
}
