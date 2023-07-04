import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:marlo_payment_app/common/api/api_baseurl/api_baseurl.dart';
import 'package:marlo_payment_app/model/transaction_model.dart/transaction_model.dart';
import 'package:marlo_payment_app/utils/dio_interceptor/interceptor.dart';
import 'package:marlo_payment_app/utils/exceptions/dio_exceptions.dart';

class TransactionService {
  //Dio dios = Dio();
  Future<List<GetTransactionModel>?> getTransaction(context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        ApiBaseUrl.transaction,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(
          response.statusCode.toString(),
        );
        if (response.data == null) {
          return null;
        } else {
          final List<GetTransactionModel> model =
              (response.data["data"] as List)
                  .map((e) => GetTransactionModel.fromJson(e))
                  .toList();
          log(response.data.toString());
          return model;
        }
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(e.message.toString());
      DioExceptions().dioError(e, context);
    }
    return null;
  }
}
