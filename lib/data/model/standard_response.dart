class StandardResponse {
  bool success = false;
  String? message;

  StandardResponse(this.success, this.message);

  static StandardResponse fromJson(Map json) {
    return StandardResponse(json['success'], json['message']);
  }

}