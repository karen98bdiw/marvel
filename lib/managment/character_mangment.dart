import 'package:flutter/cupertino.dart';
import 'package:marvel/api/api_base.dart';
import 'package:marvel/api/characters_services.dart';
import 'package:marvel/models/character_model/character_result.dart';
import 'package:marvel/widgets/dialogs.dart';

class CharacterManagment extends ChangeNotifier {
  Character characterData;
  List<Character> allCharacters;
  List<Character> searchedCharacters;

  Future<void> getAllCharacters() async {
    var res = await ApiBase().charachtersServices.getAllCharacters();

    if (res.done) {
      print(res.data);
      allCharacters = res.data.data.results;
      notifyListeners();
    } else {
      showError(errorText: res.error.errorText);
      allCharacters = null; //?
      notifyListeners();
    }
  }

  Future<void> getCharacterByName({String name}) async {
    var res = await ApiBase().charachtersServices.getCharacterByName(
          name: name,
        );

    if (res.done) {
      print(res.data);
      searchedCharacters = res.data.data.results;
      notifyListeners();
    } else {
      showError(errorText: res.error.errorText);
      searchedCharacters = null; //?
      notifyListeners();
    }
  }

  Future<void> getCharacterById({String id}) async {
    var res = await ApiBase().charachtersServices.getCharacterById(
          id: id,
        );

    if (res.done) {
      print(res.data);
      characterData = res.data.data.results[0];
      notifyListeners();
    } else {
      showError(errorText: res.error.errorText);
      characterData = null; //?
      notifyListeners();
    }
  }
}
