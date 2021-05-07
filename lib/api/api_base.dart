import 'package:dio/dio.dart';
import 'package:marvel/api/characters_services.dart';

class ApiBase {
  ApiBase._internal();

  static final ApiBase apiBase = ApiBase._internal();

  static final Dio _dio = Dio();

  final CharachtersServices charachtersServices =
      CharachtersServices(dio: _dio);

  factory ApiBase() => apiBase;
}
