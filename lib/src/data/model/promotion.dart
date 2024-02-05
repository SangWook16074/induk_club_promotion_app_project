class Promotion {
  final String title;
  final String content;
  final String userId;
  final String club;
  final String createAt;
  final String closeAt;
  final String begin;
  final String end;
  final int requiredPeople;
  final String contentOfActivity;
  final String url;
  final List images;

  Promotion({
    required this.title,
    required this.content,
    required this.userId,
    required this.club,
    required this.createAt,
    required this.closeAt,
    required this.begin,
    required this.end,
    required this.requiredPeople,
    required this.contentOfActivity,
    required this.url,
    required this.images,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
        title: json["title"],
        content: json["content"],
        userId: json["userId"].toString(),
        club: json["club"],
        createAt: json["createAt"],
        closeAt: json["closeAt"],
        begin: json["begin"],
        end: json["end"],
        requiredPeople: json["requiredPeople"],
        contentOfActivity: json["contentOfActivity"],
        url: json["url"] ?? "",
        images: json["images"]);
  }
}
