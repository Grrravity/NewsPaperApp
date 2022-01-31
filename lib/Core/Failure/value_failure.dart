class ValueFailure<T> {
  final T message;

  ValueFailure({
    required this.message,
  });

  @override
  String toString() => '$message';
}
