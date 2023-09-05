import 'definition_model.dart';

class Meanings {
  final String partOfSpeech;
  final List<Definition> definitions;

  Meanings({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meanings.fromJson(Map<String, dynamic> json) {
    return Meanings(
        partOfSpeech: json["partOfSpeech"] as String? ?? "",
        definitions: (json['definitions'] as List?)
            ?.map((e) => Definition.fromJson(e))
            .toList() ??
            [],);
  }
}