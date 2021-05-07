import 'package:marvel/models/api_models/api_error.dart';
import 'package:marvel/models/character_model/character_wrapper.dart';
import 'package:marvel/models/custom_user.dart';

class ApiResponse<T> {
  final bool done;
  final ApiError error;
  final dynamic response;
  ApiResponse({this.response, this.done = false, this.error});

  parsedData() {
    switch (T) {
      case CustomUser:
        return CustomUser.fromJson(this.response);
        break;
      case CharacterWrapper:
        return CharacterWrapper.fromJson(this.response);
        break;

      default:
        this.response as T;
    }
  }

  T get data => done ? parsedData() as T : null;
}
