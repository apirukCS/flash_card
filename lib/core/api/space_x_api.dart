import 'package:dio/dio.dart';

var SPACE_X_API = Dio(BaseOptions(baseUrl: "https://api.spacexdata.com/v4"))
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
    ),
  );
