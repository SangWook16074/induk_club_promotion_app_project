class Member {
  final String name;
  final ClubInfo? club;
  Member({required this.name, required this.club});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        name: json["name"],
        club: (json["clubInfo"] != null)
            ? ClubInfo.fromJson(json["clubInfo"])
            : null);
  }
}

class ClubInfo {
  final String clubName;
  final String createAt;
  final String classify;
  ClubInfo({
    required this.clubName,
    required this.createAt,
    required this.classify,
  });

  factory ClubInfo.fromJson(Map<String, dynamic> json) {
    return ClubInfo(
        clubName: json["clubName"],
        createAt: json["createAt"],
        classify: json["classify"]);
  }
}
