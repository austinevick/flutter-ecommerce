class LoginModel {
  final String email;
  final String password;
  LoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponseModel {
  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.statusCode,
    required this.message,
  });
  final int statusCode;
  final String? accessToken;
  final String? refreshToken;
  final String? message;

  factory LoginResponseModel.fromJson(
      Map<String, dynamic> json, int statusCode) {
    return LoginResponseModel(
      statusCode: statusCode,
      message: json['message'],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
    );
  }
}
