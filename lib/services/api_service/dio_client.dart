
import 'dart:developer';

import 'package:bloc_structure_setup/core/constants/constants.dart';
import 'package:bloc_structure_setup/services/api_service/url.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import '../../core/enums/enums.dart';
import '../../core/errors/app_exception.dart';
import '../../di/dependency.dart';

@injectable
class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: URL.baseUrl,
      receiveTimeout: const Duration(minutes: 2), // Replace with your API base URL
    ));

    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printRequestData: true,
          printResponseHeaders: false,
          printResponseMessage: true,
        ),
      ),
    );

    // Add interceptors

    // Add caching interceptor
    // _dio.interceptors.add(DioCacheManager(
    //   CacheConfig(
    //     baseUrl: 'https://api.example.com', // Replace with your API base URL
    //   ),
    // ).interceptor);
  }

  void close() {
    _dio.close();
  }

  Future request(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    RequestType? requestType,
    bool withAuth = false,
    bool isMultiPart = false,
    bool isLoginPage = false,
    bool isAddressPage = false,
    Map<String, dynamic>? headers,
  }) async {
    await Connectivity().checkConnectivity().then((connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        throw Exception('No internet connection');
      }
    });
    try {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Add token to headers
            if (withAuth) {
              options.headers['Authorization'] = 'Bearer ${instance<String>(instanceName: AppConstant.authToken)}';
            } else {
              options.headers.remove('Authorization');
            }
            if (isMultiPart) {
              options.headers['Content-Type'] = 'multipart/form-data';
            } else {
              options.headers['Content-Type'] = 'application/json';
            }
            options.headers['Accept'] = 'application/json';
            if (headers != null) {
              options.headers.addAll(headers);
            }

            // if (headers != null) {
            //   options.headers[AppConstant.providerUrl] = headers[AppConstant.providerUrl];
            //   options.headers[AppConstant.clientId] = headers[AppConstant.clientId];
            // }
            handler.next(options);
          },
          // onError: (DioException e, handler) async {
          //   if (e.response?.statusCode == 401) {
          //     e.requestOptions.headers['Authorization'] = 'Bearer newAccessToken';
          //     return handler.resolve(await _dio.fetch(e.requestOptions));
          //   }
          //   return handler.next(e);
          // },
        ),
      );

      Response<dynamic> response;
      if (requestType == RequestType.POST) {
        response = await _dio.post(
          path,
          data: body,
          queryParameters: queryParameters,
        );
      } else if (requestType == RequestType.GET) {
        response = await _dio.get(
          path,
          data: body,
          queryParameters: queryParameters,
        );
      } else if (requestType == RequestType.PUT) {
        response = await _dio.put(
          path,
          data: body,
          queryParameters: queryParameters,
        );
      } else if (requestType == RequestType.DELETE) {
        response = await _dio.delete(
          path,
          data: body,
          queryParameters: queryParameters,
        );
      } else if (requestType == RequestType.PATCH) {
        response = await _dio.patch(
          path,
          data: body,
          queryParameters: queryParameters,
        );
      } else {
        response = await _dio.get(
          path,
          data: body,
          queryParameters: queryParameters,
        );
      }
      return response.data;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw const NetworkException("Connection timeout");
        case DioExceptionType.receiveTimeout:
          throw const NetworkException("Receive timeout");
        case DioExceptionType.badResponse:
          throw ServerException(
            message: e.response?.data['message'] ?? 'Unknown server error',
            statusCode: e.response?.statusCode,
          );
        case DioExceptionType.cancel:
          throw const CancelledException("Request cancelled");
        case DioExceptionType.unknown:
          throw const NetworkException("Something went wrong");
        default:
          throw const UnknownException("Unexpected error");
      }
    } catch (e, s) {
      log('Error: $e');
      log('Stack: $s');
      throw const NetworkException("Something went wrong");
    }
  }
}
