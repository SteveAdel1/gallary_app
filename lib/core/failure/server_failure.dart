
import 'failure.dart';

class ServerFailure extends Failure {
  String? error, errorCode;
  String? message;

  ServerFailure(
      {required super.statusCode,
      super.messageAr,
      super.messageEn,
      this.errorCode,
      this.error,
      this.message});

  ServerFailure copyWith({
    String? statusCode,
    String? messageAr,
    String? messageEn,
    String? error,
    String? errorCode,
    String? message,
  }) {
    return ServerFailure(
        statusCode: statusCode ?? "",
        errorCode: errorCode ?? "",
        error: error ?? "",
        message: message ?? "",
        messageAr: messageAr ?? "",
        messageEn: messageEn ?? "");
  }

  factory ServerFailure.fromJson(Map<String, dynamic> json) {
    return ServerFailure(
        statusCode: json['statusCode'] ?? "",
        error: json["error"] ?? "",
        message: json["message"] ?? "",
        messageAr: json["messageAr"] ?? "",
        messageEn: json["messageEn"] ?? "",
        errorCode: json["errorCode"]);
  }
}
