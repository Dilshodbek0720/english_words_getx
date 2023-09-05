import 'package:english_words/models/phonetic_model.dart';
import 'license_model.dart';
import 'meaning_model.dart';

class WordModel {
  final String word;
  final String phonetic;
  final List<Phonetics> phonetics;
  final List<Meanings> meanings;
  final License license;
  final List<String> sourceUrls;

  WordModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
        word: json["word"] as String? ?? "",
        phonetic: json["phonetic"] as String? ?? "",
        phonetics: (json['phonetics'] as List?)
            ?.map((e) => Phonetics.fromJson(e))
            .toList() ??
            [],
        meanings: (json['meanings'] as List?)
            ?.map((e) => Meanings.fromJson(e))
            .toList() ??
            [],
        license: License.fromJson(json['license']),
        sourceUrls: (json['sourceUrls'] as List?)
            ?.map((e) => e as String)
            .toList() ??
            [],
        );
  }

  static List<WordModel> getFromList(List? list) {
    return list?.map((e) => WordModel.fromJson(e)).toList() ?? [];
  }
}