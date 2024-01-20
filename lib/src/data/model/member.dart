class Member {
  final String name;
  final ClubInfo? club;
  Member({required this.name, required this.club});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(name: json["name"], club: json["clubInfo"]);
  }
}

class ClubInfo {
  final String clubName;
  final DateTime createAt;
  final String classify;
  ClubInfo({
    required this.clubName,
    required this.createAt,
    required this.classify,
  });
}
