// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

class ParseException implements Exception {
  final String errorMessage;

  ParseException({required this.errorMessage});

  @override
  String toString() => 'ParseExeption(errorMessage: $errorMessage)';
}

class ErrorException implements Exception {
  final String message;
  final int code;

  ErrorException({required this.message, required this.code});

  @override
  String toString() => 'ServerExeption(message: $message, code: $code)';
}

class CantSaveLocaleException implements Exception {}