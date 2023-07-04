import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marlo_payment_app/model/token_model/token_get_model.dart';
import 'package:marlo_payment_app/model/token_model/token_post_model.dart';
import 'package:marlo_payment_app/common/api/api_baseurl/api_baseurl.dart';
import 'package:marlo_payment_app/utils/exceptions/dio_exceptions.dart';

class TokenService {
  Dio dio = Dio();
  Future<TokenGetModel?> signinUser(
      TokenPostModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiBaseUrl.apiKey,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final tokenGetModel = TokenGetModel.fromJson(response.data);
        log(response.data.toString());

        return tokenGetModel;
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(
        e.message.toString(),
      );
      DioExceptions().dioError(e, context);
    }
    return null;
  }
}
