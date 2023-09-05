import 'package:english_words/models/word_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../network/api_service.dart';

class WordsController extends GetxController{
  WordsController({required this.apiService});
  final ApiService apiService;
  String word = "book";

  RxList<WordModel> words = <WordModel>[].obs;
  var isLoading = false.obs;

  getWordsAll()async{
    isLoading.value = true;
    List<WordModel> loadedWords = await apiService.getWords(word: word);
    isLoading.value = false;
    if(loadedWords.isNotEmpty){
      words.value = loadedWords;
    }else{
      words.value = [];
      debugPrint("!!! ERROR !!!");
    }
  }
}