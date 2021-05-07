import 'package:dio/dio.dart';
import 'package:marvel/models/api_models/api_error.dart';
import 'package:marvel/models/api_models/api_response.dart';
import 'api_constats.dart';

class DioBase {
  var _dio = Dio();
  DioBase._internal();

  static final DioBase dioBase = DioBase._internal();

  factory DioBase() => dioBase;

  Future<ApiResponse<T>> get<T>({String endPoint}) async {
    try {
      var res = await _dio.get(ApiConstats.BaseUrl + endPoint,
          queryParameters: ApiConstats.params,
          options: Options(headers: ApiConstats.headers));

      if (res.statusCode == 200) {
        return ApiResponse<T>(
          done: true,
          response: res.data,
        );
      }
      return ApiResponse<T>(
        done: false,
        error: ApiError(errorText: res.data.toString()),
      );
    } catch (e) {
      print("api error ${(e as DioError).response}");
      return ApiResponse<T>(
        done: false,
        error: ApiError(errorText: e.toString()),
      );
    }
  }
}
