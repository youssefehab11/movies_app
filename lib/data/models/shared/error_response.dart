class ErrorResponse {
  bool? success;
  int? statusCode;
  String? statusMessage;

  ErrorResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  ErrorResponse.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    return map;
  }
}
