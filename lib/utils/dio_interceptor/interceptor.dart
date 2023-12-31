import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marlo_payment_app/common/api/api_baseurl/api_baseurl.dart';
import 'package:marlo_payment_app/utils/exceptions/dio_exceptions.dart';

class ApiInterceptor {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();

  Future<Dio> getApiUser(context) async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: 'token');
          dio.interceptors.clear();
          options.headers.addAll({"authtoken": "$token"});
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        // ignore: deprecated_member_use
        onError: (DioError e, handler) async {
          if (e.response != null) {
            if (e.response?.statusCode == 403 &&
                e.response?.data['message'] == 'Forbidden') {
              log('token expired');
              RequestOptions requestOptions = e.requestOptions;
              try {
                final refreshToken = await storage.read(key: 'refreshToken');
                log(refreshToken.toString());
                final opts = Options(method: requestOptions.method);
                dio.options.headers["refresh"] = "$refreshToken";
                final Response response = await dio.post(
                  ApiBaseUrl.baseUrl + ApiBaseUrl.apiKey,
                  //ApiBaseUrl().baseUrl + ApiEndpoints.refreshToken,
                  options: opts,
                );
                if (response.statusCode! == 200) {
                  log(response.data.toString());
                  final token = response.data['idToken'];
                  final refreshToken = response.data['refreshToken'];
                  await storage.delete(key: 'token');
                  await storage.delete(key: 'refreshToken');
                  storage.write(key: 'token', value: token);
                  storage.write(key: 'refreshToken', value: refreshToken);
                }
              } catch (e) {
                DioExceptions().dioError(e, context);
              }
              try {
                final token = await storage.read(key: 'token');
                final opts = Options(method: requestOptions.method);
                dio.options.headers["authtoken"] = "$token";
                final response = await dio.request(
                  requestOptions.path,
                  options: opts,
                  cancelToken: requestOptions.cancelToken,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                );
                return handler.resolve(response);
              } catch (e) {
                DioExceptions().dioError(e, context);
              }
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
    return dio;
  }
}
