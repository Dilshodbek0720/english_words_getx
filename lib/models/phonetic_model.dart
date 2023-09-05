import 'license_model.dart';

class Phonetics {
  final String text;
  final String audio;
  final String sourceUrl;
  // final License license;

  Phonetics({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    // required this.license,
  });

  factory Phonetics.fromJson(Map<String, dynamic> json) {
    return Phonetics(
        text: json["text"] as String? ?? "",
        audio: json["audio"] as String? ?? "",
        sourceUrl: json["sourceUrl"] as String? ?? "",
        // license: License.fromJson(json['license']),
    );
  }

}
