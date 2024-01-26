/// 서버와의 통신 결과를 기록하는 모델
class BaseResponse<T> {
  final String resultCode;
  final T? data;
  final String message;
  BaseResponse({
    required this.resultCode,
    this.data,
    required this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        resultCode: json["resultCode"],
        data: json["data"],
        message: json["message"]);
  }
}
