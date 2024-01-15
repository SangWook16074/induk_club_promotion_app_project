class Member {
  final String? nickName;
  final String? profile;
  final String? email;
  final String? password;

  Member({
    required this.nickName,
    this.profile,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson(Member member) => {
        "name": member.nickName,
        "email": member.email,
        "password": member.password,
      };
}
