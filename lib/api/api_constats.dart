import 'dart:convert';

import 'package:crypto/crypto.dart';

class ApiConstats {
  static const BaseUrl = "https://gateway.marvel.com";

  static const Public_Key = "035aab9a4c2d0fcdb71f0539db242bfa";
  static const Private_Key = "0db57f362aed8dd287f1662051604aaa8b3068f1";
  static final ts = DateTime.now().millisecondsSinceEpoch.toString();
  static final hash =
      md5.convert(utf8.encode("$ts$Private_Key$Public_Key")).toString();

  static const All_Character_GEt = "/v1/public/characters";
  static const Character_By_Id = "/v1/public/characters";

  static const Search_Name_Query = "nameStartsWith";
  static const Search_Id_Query = "";

  static Map<String, dynamic> params = {
    "hash": ApiConstats.hash,
    'ts': ApiConstats.ts,
    'apikey': ApiConstats.Public_Key,
    'limit': 100,
    'orderBy': 'name'
  };

  static Map<String, dynamic> headers = {
    "Content-type": "application/json",
  };
}
