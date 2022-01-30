import 'package:newspaperapp/Core/Failure/value_failure.dart';

class InfrastructureValueFailure<T> extends ValueFailure<T> {
  /// NOTE - Error that could occur from infrastructure
  final T? details;
  InfrastructureValueFailure._({
    this.details,
    required T message,
  }) : super(
          message: message,
        );

  factory InfrastructureValueFailure.requestDataNotFound({
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message);
  }

  /// The api has partially handeled the resuest
  factory InfrastructureValueFailure.partialContent({
    required T message,
    required T detail,
  }) {
    return InfrastructureValueFailure._(message: message, details: detail);
  }

  /// The API could not find the client
  factory InfrastructureValueFailure.clientNotFound({
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message);
  }

  /// The API could not find any element
  factory InfrastructureValueFailure.notFound({
    T? details,
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message, details: details);
  }

  /// The API could not find the body in the request
  factory InfrastructureValueFailure.requestBodyNotFound({
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message);
  }

  /// An error occured on backend server
  factory InfrastructureValueFailure.serverError({
    T? details,
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message, details: details);
  }

  /// Request timed out
  factory InfrastructureValueFailure.timeout({
    T? details,
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message, details: details);
  }

  /// Unauthorized access to API
  factory InfrastructureValueFailure.unAuthorized({
    T? details,
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message, details: details);
  }

  /// API response but could not serealize the response
  factory InfrastructureValueFailure.serializationError({
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message);
  }

  /// API response is unexpected
  factory InfrastructureValueFailure.badResponseType({
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message);
  }

  /// Database has returned an error
  factory InfrastructureValueFailure.databaseError({
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message);
  }

  /// Connection Error
  factory InfrastructureValueFailure.connectionError({
    required T message,
  }) {
    return InfrastructureValueFailure._(message: message);
  }
}
