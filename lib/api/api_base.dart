import 'package:marvel/api/api_dio.dart';
import 'package:marvel/api/characters_services.dart';

class ApiBase {
  ApiBase._internal();

  static final ApiBase apiBase = ApiBase._internal();

  static final DioBase _dioBase = DioBase();

  final CharachtersServices charachtersServices =
      CharachtersServices(dio: _dioBase);

  factory ApiBase() => apiBase;
}
