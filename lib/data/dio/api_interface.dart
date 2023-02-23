typedef Json = Map<String, dynamic>;
typedef Converter<T> = T Function(dynamic data);

abstract class ApiInterface {
  Future<T> postJson<T>({
    required Json data,
    required String endPoint,
    Json? queryParams,
    Converter<T>? converter,
  });

  // Future<T> putJson<T>({
  //   required String endPoint,
  //   required Json data,
  //   Json? queryParams,
  //   Converter<T>? converter,
  // });

  // Future<T> getJson<T>({
  //   required String endPoint,
  //   Json? queryParams,
  //   Converter<T>? converter,
  // });

  // Future<T> deleteJson<T>({
  //   required Json data,
  //   required String endPoint,
  //   Json? queryParams,
  //   Converter<T>? converter,
  // });

  // Future<T> putRaw<T>({
  //   required String endpoint,
  //   required dynamic data,
  //   Json? queryParams,
  //   Converter<T>? converter,
  // });

  // Future<T> postRaw<T>({
  //   required String endpoint,
  //   required dynamic data,
  //   Json? queryParams,
  //   Converter<T>? converter,
  // });
}
