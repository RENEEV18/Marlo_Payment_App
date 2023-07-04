class TokenPostModel {
  String email;
  String password;
  String returnSecureToken;

  TokenPostModel({
    required this.email,
    required this.password,
    required this.returnSecureToken,
  });

  factory TokenPostModel.fromJson(Map<String, dynamic> json) => TokenPostModel(
        email: json["email"],
        password: json["password"],
        returnSecureToken: json["returnSecureToken"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "returnSecureToken": returnSecureToken,
      };
}
