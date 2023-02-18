import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  static NetworkException getDioException(error) {
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
                  networkException =
                      const NetworkException.unauthorisedRequest();
                  break;
                case 401:
                  networkException =
                      const NetworkException.unauthorisedRequest();
                  break;
                case 403:
                  networkException =
                      const NetworkException.unauthorisedRequest();
                  break;
                case 404:
                  networkException =
                      const NetworkException.notFound("Not found");
                  break;
                case 409:
                  networkException = const NetworkException.conflict();
                  break;
                case 408:
                  networkException = const NetworkException.requestTimeout();
                  break;
                case 500:
                  networkException =
                      const NetworkException.internalServerError();
                  break;
                case 503:
                  networkException =
                      const NetworkException.serviceUnavailable();
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
        requestCancelled: () => '',
        unauthorisedRequest: () => '',
        badRequest: () => '',
        notFound: (reason) => reason,
        methodNotAllowed: () => '',
        notAcceptable: () => '',
        requestTimeout: () => '',
        sendTimeout: () => '',
        conflict: () => '',
        internalServerError: () => '',
        notImplemented: () => '',
        serviceUnavailable: () => '',
        noInternetConnection: () => '',
        formatException: () => '',
        unableToProcess: () => '',
        defaultError: (error) => error,
        unexpectedError: () => '',
      );
}
