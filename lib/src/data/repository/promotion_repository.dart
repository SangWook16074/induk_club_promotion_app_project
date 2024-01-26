import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/promotion_api.dart';

class PromotionRepository {
  PromotionApi api;
  PromotionRepository({required this.api});

  getPromotions() async {
    // var resp = await dio.get("server-path-url");
    await Future.delayed(const Duration(seconds: 2));
    final resp = [
      {
        "id": 1,
        "userId": 1,
        "club": "A&I",
        "createAt": DateTime.now().toString(),
        "closeAt": DateTime.now().toString(),
        "title": "A&I 신규 동아리원 모집",
        "content":
            "2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.",
        "requiredPeople": 10,
        "begin": DateTime.now().toString(),
        "end": DateTime.now().toString(),
        "images": [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3l9C58Dj31BhnXcMBMqLcL7T0foOUcsuEEg&usqp=CAU"
        ],
        "contentOfActivity":
            "UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.",
      },
      {
        "id": 2,
        "userId": 2,
        "club": "A&I",
        "createAt": DateTime.now().toString(),
        "closeAt": DateTime.now().toString(),
        "title": "A&I 신규 동아리원 모집",
        "content":
            "2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.",
        "requiredPeople": 10,
        "begin": DateTime.now().toString(),
        "end": DateTime.now().toString(),
        "images": [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3l9C58Dj31BhnXcMBMqLcL7T0foOUcsuEEg&usqp=CAU"
        ],
        "contentOfActivity":
            "UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.",
      },
      {
        "id": 3,
        "userId": 3,
        "club": "A&I",
        "createAt": DateTime.now().toString(),
        "closeAt": DateTime.now().toString(),
        "title": "A&I 신규 동아리원 모집",
        "content":
            "2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.",
        "requiredPeople": 10,
        "begin": DateTime.now().toString(),
        "end": DateTime.now().toString(),
        "images": [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3l9C58Dj31BhnXcMBMqLcL7T0foOUcsuEEg&usqp=CAU"
        ],
        "contentOfActivity":
            "UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.",
      },
      {
        "id": 4,
        "userId": 4,
        "club": "A&I",
        "createAt": DateTime.now().toString(),
        "closeAt": DateTime.now().toString(),
        "title": "A&I 신규 동아리원 모집",
        "content":
            "2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.",
        "requiredPeople": 10,
        "begin": DateTime.now().toString(),
        "end": DateTime.now().toString(),
        "images": [
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3l9C58Dj31BhnXcMBMqLcL7T0foOUcsuEEg&usqp=CAU"
        ],
        "contentOfActivity":
            "UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.",
      },
    ];
    List<Promotion> promotions = [];
    for (var data in resp) {
      final promotion = Promotion.fromJson(data);
      promotions.add(promotion);
    }
    return promotions;
  }

  // Future<List<Promotion>> getPromotions() => api.getPromotions();

  Future<Promotion?> postPromotion(data) => api.postPromotion(data);
}
