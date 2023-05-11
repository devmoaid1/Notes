import 'package:equatable/equatable.dart';

class CustomException extends Equatable implements Exception {
  final String? message;

  const CustomException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class CacheException extends CustomException {
  const CacheException([message]) : super("");
}
