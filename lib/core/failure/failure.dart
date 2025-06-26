// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;
  final int code;

  const ServerFailure({this.message = '', this.code = 0});

  @override
  String toString() {
    return 'ServerFailure{message: $message, code: $code}';
  }
}

class CacheFailure extends Failure {
  final String message;
  final int code;

  const CacheFailure({this.message = '', this.code = 0});

  @override
  String toString() => 'CacheFailure(message: $message, code: $code)';
}

class DioFailure extends Failure {
  final String message;
  final int code;

  const DioFailure({this.message = '', this.code = 0});

  @override
  String toString() => 'DioFailure(message: $message, code: $code)';
}

class ParseFailure extends Failure {
  final String message;
  final int code;

  const ParseFailure({this.message = '', this.code = 0});

  @override
  String toString() => 'ParseFailure(message: $message, code: $code)';
}

class LocalFailure extends Failure {
  final String message;
  final int code;

  const LocalFailure({this.message = '', this.code = 0});

  @override
  String toString() => 'LocalFailure(message: $message, code: $code)';
} 