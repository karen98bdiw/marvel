import 'package:marvel/api/api_constats.dart';
import 'package:marvel/api/api_dio.dart';
import 'package:marvel/models/api_models/api_error.dart';
import 'package:marvel/models/api_models/api_response.dart';
import 'package:marvel/models/character_model/character_result.dart';
import 'package:marvel/models/character_model/character_wrapper.dart';

class CharachtersServices {
  final DioBase dio;

  CharachtersServices({this.dio});


Future<ApiResponse<CharacterWrapper>> character() async {
    var responseData = await dio.get<CharacterWrapper>(endPoint:ApiConstats.All_Character_GEt);

    if(responseData.done){
      return ApiResponse(done: true,response:responseData.response);
    }
    else ApiResponse(done: false,error: responseData.error);
  }

  Future<ApiResponse<List<Character>>> getAllCharacters() async {
    var responseData = await dio.get<List<Character>>(endPoint:ApiConstats.All_Character_GEt);
      
    if(responseData.done){
      return ApiResponse(done: true,response:responseData.response);
    }else ApiResponse(done: false,error: responseData.error);
  }

  
  Future<ApiResponse<Character>> getByName() async {
    var responseData = await dio.get<Character>(endPoint:ApiConstats.All_Character_GEt);

    if(responseData.done){
      return ApiResponse(done: true,response:responseData.response);
    }else ApiResponse(done: false,error: responseData.error);
  }


}
