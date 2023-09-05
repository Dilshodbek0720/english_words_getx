class License {
  final String name;
  final String url;

  License({
    required this.name,
    required this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      name: json["name"] as String? ?? "",
      url: json["url"] as String? ?? "",
    );
  }
}
