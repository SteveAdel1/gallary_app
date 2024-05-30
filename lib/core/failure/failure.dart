abstract class Failure {
  String statusCode;
  String? messageAr;
  String? messageEn;

  Failure(
      {required this.statusCode,
       this.messageAr,
       this.messageEn});
}
