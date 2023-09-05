import 'package:dio/dio.dart';
import 'package:english_words/models/word_model.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<WordModel>> getWords({required String word}) async {
    try {
      Response response = await dio.get("https://api.dictionaryapi.dev/api/v2/entries/en/$word");
      if (response.statusCode == 200) {
        return WordModel.getFromList(response.data as List?);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}