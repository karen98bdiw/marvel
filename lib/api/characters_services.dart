import 'package:marvel/api/api_constats.dart';
import 'package:marvel/api/api_dio.dart';
import 'package:marvel/models/api_models/api_error.dart';
import 'package:marvel/models/api_models/api_response.dart';
import 'package:marvel/models/character_model/character_result.dart';
import 'package:marvel/models/character_model/character_wrapper.dart';

class CharachtersServices {
  final DioBase dio;

  CharachtersServices({this.dio});

  Future<ApiResponse<CharacterWrapper>> getAllCharacters() async {
    var responseData = await dio.get<CharacterWrapper>(
        endPoint: ApiConstats.All_Character_GEt);

    if (responseData.done) {
      return ApiResponse(done: true, response: responseData.response);
    }
    return ApiResponse(done: false, error: responseData.error);
  }

  Future<ApiResponse<CharacterWrapper>> getCharacterByName(
      {String name}) async {
    var responseData = await dio.get<CharacterWrapper>(
        endPoint: ApiConstats.All_Character_GEt,
        additionalParams: {
          ApiConstats.Search_Name_Query: name,
        });

    if (responseData.done) {
      return ApiResponse(done: true, response: responseData.response);
    }
    return ApiResponse(done: false, error: responseData.error);
  }

  Future<ApiResponse<CharacterWrapper>> getCharacterById({String id}) async {
    var responseData = await dio.get<CharacterWrapper>(
      endPoint: ApiConstats.All_Character_GEt + "/" + id,
    );

    if (responseData.done) {
      return ApiResponse(done: true, response: responseData.response);
    }
    return ApiResponse(done: false, error: responseData.error);
  }
}
