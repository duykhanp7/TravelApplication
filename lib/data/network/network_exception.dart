import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as dev;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/dio/api_interface.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';

part 'network_exception.freezed.dart';

@freezed
abstract class NetworkException with _$NetworkException implements Exception {
  const factory NetworkException.requestCancelled() = RequestCancelled;

  const factory NetworkException.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkException.badRequest() = BadRequest;

  const factory NetworkException.notFound(String reason) = NotFound;

  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkException.notAcceptable() = NotAcceptable;

  const factory NetworkException.requestTimeout() = RequestTimeout;

  const factory NetworkException.sendTimeout() = SendTimeout;

  const factory NetworkException.conflict() = Conflict;

  const factory NetworkException.internalServerError() = InternalServerError;

  const factory NetworkException.notImplemented() = NotImplemented;

  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.formatException() = FormatException;

  const factory NetworkException.unableToProcess() = UnableToProcess;

  const factory NetworkException.defaultError(String error) = DefaultError;

  const factory NetworkException.unexpectedError() = UnexpectedError;

  const factory NetworkException.apiException(
      {required int? statusCode, required String? statetusText}) = ApiException;

  static T convertResponse<T>(Response response, Converter<T>? converter) {
    if (converter != null) {
      dynamic result = (response.data as Map)['user'];
      dynamic token = (response.data as Map)['jwt'];
      if (token != null && token is String) {
        AppStorage appStorage = AppStorage();
        appStorage.saveData(AppConstant.token, token);
      }
      if (result != null) {
        return converter(result);
      }
      return response.data as T;
    }
    return {} as T;
  }

  static NetworkException getDioException(error) {
    if (kDebugMode) {
      StackTrace? stackTrace;
      if (error is Error) {
        stackTrace = error.stackTrace;
      }
      dev.log(
        'Error type: ${error.runtimeType}',
        name: 'NetworkException',
        error: error,
        stackTrace: stackTrace,
      );
    }

    if (error is Exception) {
      try {
        NetworkException? networkException;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkException = const NetworkException.requestCancelled();
              break;
            case DioErrorType.connectionTimeout:
              networkException = const NetworkException.requestTimeout();
              break;
            case DioErrorType.connectionError:
              networkException = const NetworkException.noInternetConnection();
              break;
            case DioErrorType.sendTimeout:
              networkException = const NetworkException.sendTimeout();
              break;
            case DioErrorType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  networkException = NetworkException.apiException(
                      statusCode: error.response?.statusCode,
                      statetusText: error.response?.data['error']?['message']);
                  break;
                case 401:
                  networkException = NetworkException.apiException(
                      statusCode: error.response?.statusCode,
                      statetusText: error.response?.data['error']?['message']);
                  break;
                case 403:
                  networkException = NetworkException.apiException(
                      statusCode: error.response?.statusCode,
                      statetusText: error.response?.data['error']?['message']);
                  break;
                case 404:
                  networkException =
                      const NetworkException.notFound("Not found");
                  break;
                case 409:
                  networkException = const NetworkException.conflict();
                  break;
                case 408:
                  networkException = NetworkException.apiException(
                      statusCode: error.response?.statusCode,
                      statetusText: error.response?.data['error']?['message']);
                  break;
                case 500:
                  networkException = NetworkException.apiException(
                      statusCode: error.response?.statusCode,
                      statetusText: error.response?.data['error']?['message']);
                  break;
                case 503:
                  networkException = NetworkException.apiException(
                      statusCode: error.response?.statusCode,
                      statetusText: error.response?.data['error']?['message']);
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  networkException = NetworkException.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioErrorType.badCertificate:
              break;
            case DioErrorType.unknown:
              break;
            case DioErrorType.receiveTimeout:
              break;
          }
        } else if (error is SocketException) {
          networkException = const NetworkException.noInternetConnection();
        } else {
          networkException = const NetworkException.unexpectedError();
        }
        return networkException ?? const NetworkException.unexpectedError();
      } on FormatException catch (_) {
        return const NetworkException.formatException();
      } catch (_) {
        return const NetworkException.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkException.unableToProcess();
      } else {
        return const NetworkException.unexpectedError();
      }
    }
  }
}

extension NetworkExceptionEx on NetworkException {
  String get getTextError => when(
        apiException: (statusCode, statetusText) => '$statetusText',
        requestCancelled: () => 'requestCancelled',
        unauthorisedRequest: () => 'unauthorisedRequest',
        badRequest: () => 'badRequest',
        notFound: (reason) => reason,
        methodNotAllowed: () => 'methodNotAllowed',
        notAcceptable: () => 'notAcceptable',
        requestTimeout: () => 'requestTimeout',
        sendTimeout: () => 'sendTimeout',
        conflict: () => 'conflict',
        internalServerError: () => 'internalServerError',
        notImplemented: () => 'notImplemented',
        serviceUnavailable: () => 'serviceUnavailable',
        noInternetConnection: () => 'noInternetConnection',
        formatException: () => 'formatException',
        unableToProcess: () => 'unableToProcess',
        defaultError: (error) => error,
        unexpectedError: () => 'unexpectedError',
      );

  int get statusCode => maybeWhen(
        apiException: (statusCode, statetusText) => statusCode ?? 500,
        orElse: () => 0,
      );
}
