class TokenGetModel {
  String kind;
  String localId;
  String email;
  String displayName;
  String idToken;
  bool registered;
  String refreshToken;
  String expiresIn;

  TokenGetModel({
    required this.kind,
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
    required this.registered,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory TokenGetModel.fromJson(Map<String, dynamic> json) => TokenGetModel(
        kind: json["kind"],
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"],
        registered: json["registered"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
      };
}
