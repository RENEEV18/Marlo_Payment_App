import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marlo_payment_app/model/token_model/token_post_model.dart';
import 'package:marlo_payment_app/services/token_service/token_service.dart';

class TokenController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isLoading = false;

  void getToken(BuildContext context) {
    isLoading = true;
    notifyListeners();
    final TokenPostModel tokenPostModel = TokenPostModel(
      email: "marloneobankdemo@gmail.com",
      password: "Marlo@123",
      returnSecureToken: "true",
    );
    TokenService().signinUser(tokenPostModel, context).then(
      (value) {
        if (value != null) {
          storage.write(key: 'token', value: value.idToken);
          storage.write(key: 'refreshToken', value: value.refreshToken);
        } else {
          return;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
