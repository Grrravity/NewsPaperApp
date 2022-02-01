import 'package:newspaperapp/Core/Failure/value_failure.dart';

class DatabaseValueFailure<T> extends ValueFailure<T> {
  /// NOTE - Erreur pouvant se produire dans la [couche Domain]

  DatabaseValueFailure._({
    required T message,
  }) : super(message: message);

  /// Erreur survenu à la transformation Json <-> SQLite Table
  factory DatabaseValueFailure.responseToTable({
    required T message,
  }) {
    return DatabaseValueFailure._(message: message);
  }
}
