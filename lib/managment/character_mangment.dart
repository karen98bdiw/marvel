import 'package:flutter/cupertino.dart';
import 'package:marvel/api/api_base.dart';
import 'package:marvel/models/api_models/api_error.dart';
import 'package:marvel/models/api_models/api_response.dart';
import 'package:marvel/models/character_model/character_result.dart';
import 'package:marvel/models/character_model/character_wrapper.dart';
import 'package:marvel/widgets/dialogs.dart';

class CharacterManagment extends ChangeNotifier {
  Character characterData;
  Character characterDescription;
  List<Character> allCharacters;
  List<Character> searchedCharacters;
  List<Character> favoriteCharacters = [];
  List<Character> lastSearch = [];

  Future<void> getAllCharacters() async {
    var res = await ApiBase().charachtersServices.getAllCharacters();

    if (res.done) {
      print(res.data);
      allCharacters = res.data.data.results;
      lastSearch = allCharacters;
      notifyListeners();
    } else {
      showError(errorText: res.error.errorText);
      allCharacters = null; //?
      notifyListeners();
    }
  }

  Future<void> getCharacterByName({String name}) async {
    if (name.isEmpty) {
      allCharacters = lastSearch;
      notifyListeners();
      return;
    }
    print("search is called $name");
    var res = await ApiBase().charachtersServices.getCharacterByName(
          name: name,
        );

    print("search res $res");
    if (res.done) {
      print(res.data);
      searchedCharacters = res.data.data.results;
      allCharacters = searchedCharacters;
      notifyListeners();
    } else {
      showError(errorText: res.error.errorText);
      searchedCharacters = null; //?
      notifyListeners();
    }
  }

  Future<ApiResponse<CharacterWrapper>> getCharacterDescription(
      {String id}) async {
    var res = await ApiBase().charachtersServices.getCharacterById(
          id: id,
        );

    if (res.done) {
      print(res.data);
      characterDescription = res.data.data.results[0];
      print(characterDescription.name);
      notifyListeners();

      return ApiResponse<CharacterWrapper>(
        done: true,
        response: res.response,
      );
    } else {
      showError(errorText: res.error.errorText);
      characterDescription = null; //?
      notifyListeners();
      return ApiResponse<CharacterWrapper>(
        done: false,
        error: res.error,
      );
    }
  }

  Future<ApiResponse<CharacterWrapper>> getCharacterById({String id}) async {
    var res = await ApiBase().charachtersServices.getCharacterById(
          id: id,
        );

    if (res.done) {
      print(res.data);
      // characterData = res.data.data.results[0];
      // notifyListeners();

      return ApiResponse<CharacterWrapper>(
        done: true,
        response: res.response,
      );
    } else {
      showError(errorText: res.error.errorText);
      characterData = null; //?
      notifyListeners();
      return ApiResponse<CharacterWrapper>(
        done: false,
        error: res.error,
      );
    }
  }

  Future<void> getFavorites({List<String> favorites}) async {
    favoriteCharacters.clear();

    for (var i = 0; i < favorites.length; i++) {
      var res = await getCharacterById(id: favorites[i]);
      print("response length ${i}");
      favoriteCharacters.add(res.data.data.results[0]);
    }
    notifyListeners();
  }
}
