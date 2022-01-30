import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaperapp/Core/Failure/database_failure.dart';
import 'package:newspaperapp/Core/Failure/infrastructure_failure.dart';
import 'package:newspaperapp/Core/Failure/value_failure.dart';
import 'package:newspaperapp/Infrastructure/Api/rest_api_toast.dart';

abstract class RestApiRepository {
  final GetHttpClient client;
  @protected
  final String _controller;

  String get controller => _controller;

  RestApiRepository({
    required String controller,
    required this.client,
  }) : _controller = controller;

  Future<Either<InfrastructureValueFailure<String>, dynamic>>
      handlingGetResponse({
    required String queryRoute,
    Map<String, dynamic>? queryParameters,
    bool showError = true,
    bool showSuccess = false,
  }) async {
    try {
      Response<Map<String, dynamic>> _response = await client.get(
        queryRoute,
        query: queryParameters,
      );
      return verifError(
        response: _response,
        showError: showError,
        showSuccess: showSuccess,
        method: _response.request?.method ?? 'get',
      );
    } catch (exception) {
      return left(catchClientNotFound(exception));
    }
  }
}

/// List of handeled error
/// default is [InfrastructureValueFailure.serverError]
extension OnHttpError on Response {
  InfrastructureValueFailure<String> get handlingHttpErrors {
    String message = body['code'];
    message = message.tr.capitalizeFirst ?? message.tr;
    String details = body['details'];
    // NOTE - This is required
    // ignore: unnecessary_this
    switch (this.statusCode) {
      case 206:
        return InfrastructureValueFailure.partialContent(
          message: message,
          detail: details,
        );
      case 403:
        return InfrastructureValueFailure.unAuthorized(
          message: message,
          details: details,
        );
      case 404:
        return InfrastructureValueFailure.notFound(
          message: message,
          details: details,
        );
      case 408:
        return InfrastructureValueFailure.timeout(
          message: message,
          details: details,
        );
      case 500:
        return InfrastructureValueFailure.serverError(
          message: message,
          details: details,
        );
      default:
        return InfrastructureValueFailure.serverError(
          message: message,
          details: details,
        );
    }
  }
}

/// Check response error and return the right Either value
Either<InfrastructureValueFailure<String>, dynamic> verifError({
  required Response<Map<String, dynamic>> response,
  required bool showError,
  required bool showSuccess,
  required String method,
}) {
  try {
    // If API errored
    if (response.hasError) {
      printError(failure: response.handlingHttpErrors);
      if (showError) {
        _flushToast(
          context: Get.context!,
          message: response.handlingHttpErrors.message,
        );
      }
      return left(response.handlingHttpErrors);
    } else {
      // Existing request body
      if (response.body != null) {
        // The response contains some data
        if (response.body!.containsKey("articles")) {
          if (Get.context != null && method != 'get') {
            if (showSuccess) {
              _flushToast(
                context: Get.context!,
                message: response.body!['status'],
                isError: false,
              );
            }
          }
          return right(response.body!["articles"]);
        } else {
          // if "articles" key does not exist
          InfrastructureValueFailure<String> _valueFailure =
              InfrastructureValueFailure.requestDataNotFound(
            message: 'Données demandées non trouvées',
          );
          printError(failure: _valueFailure);
          if (showError) {
            _flushToast(
              context: Get.context!,
              message: _valueFailure.message,
            );
          }
          return left(_valueFailure);
        }
      } else {
        // Body does not exist
        InfrastructureValueFailure<String> _valueFailure =
            InfrastructureValueFailure.requestBodyNotFound(
          message: 'La requête ne contient pas de body',
        );
        printError(failure: _valueFailure);
        if (showError) {
          _flushToast(
            context: Get.context!,
            message: _valueFailure.message,
          );
        }
        return left(_valueFailure);
      }
    }
  } catch (e) {
    InfrastructureValueFailure<String> _valueFailure =
        InfrastructureValueFailure.badResponseType(
      message: 'La réponse n\'as pas pu être traitée',
    );
    printError(failure: _valueFailure);
    return left(_valueFailure);
  }
}

void printError({e, required ValueFailure failure}) {
  print('\x1B[31m   --------------------   ');
  print('\x1B[31mERROR => ${e.toString()}');
  print('\x1B[31mERROR TYPE => ${e?.runtimeType}');
  print('\x1B[31mFAILURE => ${failure.message}');
  if (failure is InfrastructureValueFailure && failure.details != null) {
    print('\x1B[31mFAILURE DETAILS => ${(failure).details}');
  }
  print('\x1B[31mFAILURE TYPE => ${failure.runtimeType}');
  print('\x1B[31m   --------------------   \x1B[0m');
}

InfrastructureValueFailure<String> catchSerializationError(Object e) {
  InfrastructureValueFailure<String> failure =
      InfrastructureValueFailure.serializationError(
    message: 'Erreur de séréalisation',
  );
  printError(e: e, failure: failure);
  return failure;
}

InfrastructureValueFailure<String> catchResponseError(Response<dynamic> e) {
  InfrastructureValueFailure<String> failure = e.handlingHttpErrors;
  printError(e: e, failure: failure);
  return failure;
}

InfrastructureValueFailure<String> catchClientNotFound(Object e) {
  InfrastructureValueFailure<String> failure =
      InfrastructureValueFailure.clientNotFound(
    message: 'Client non trouvé',
  );
  printError(e: e, failure: failure);
  return failure;
}

DatabaseValueFailure<String> catchDtoToEntity(Object e) {
  DatabaseValueFailure<String> failure = DatabaseValueFailure.responseToTable(
    message: 'Erreur de conversion dans les models',
  );
  printError(e: e, failure: failure);
  return failure;
}

void _flushToast({
  required BuildContext context,
  required String message,
  bool isError = true,
}) {
  Toast.showSnackBar(
    context: context,
    snackBar: isError
        ? Toast.error(
            message: message,
          )
        : Toast.success(
            message: message.tr,
          ),
  );
}
