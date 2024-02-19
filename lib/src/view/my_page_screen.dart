import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/promotion_write_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/member_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/profile_edit_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_write.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';
import 'package:intl/intl.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff713eff),
        body: GetX<MemberController>(builder: (controller) {
          if (controller.member == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  _appBar(),
                  _myInfo(),
                  (controller.member?.club == null)
                      ? _noClubInfo()
                      : _clubInfo(),
                  _myPromotions(),
                ],
              ),
            );
          }
        }));
  }

  Widget _appBar() {
    return SliverAppBar(
      leading: GestureDetector(
          onTap: Get.back,
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      backgroundColor: const Color(0xff713eff),
      centerTitle: false,
      title: Text('${MemberController.to.member?.name}님! 환영합니다.',
          style: Get.textTheme.titleMedium),
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) => SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: LoginController.to.showSignOutDialog,
                                  child: Container(
                                    child: const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.logout),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "로그아웃",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () =>
                                      Get.off(() => const ProfileEditScreen()),
                                  child: Container(
                                    child: const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.lock_open),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "비밀번호 변경",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
              },
              child: const Icon(Icons.more_vert)),
        )
      ],
    );
  }

  Widget _myInfo() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Stack(children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  color: Get.theme.primaryColor,
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (ResponsibleLayout.isMobile(context) ? 16 : 200)),
            child: const SizedBox(
              height: 500,
              child: ProfileImage(
                length: 150,
                type: ProfileType.MYPAGE,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _noClubInfo() => SliverToBoxAdapter(
        child: GestureDetector(
          onTap: () {
            Get.find<MemberController>().showClubInfoDialog();
          },
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal:
                          ResponsibleLayout.isMobile(context) ? 16 : 200),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleBox(
                        label: '동아리 소개',
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal:
                            ResponsibleLayout.isMobile(context) ? 16 : 200),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffe0e0e0),
                          border: Border.all(color: const Color(0xffb5b5b5)),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.add,
                            size: 100,
                            color: Colors.grey,
                          ),
                          Text(
                            "나만의 동아리를 개설해보세요!",
                            style: TextStyle(
                                color: Color(0xff4d4d4d),
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      );

  Widget _clubInfo() => SliverToBoxAdapter(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: ResponsibleLayout.isMobile(context) ? 16 : 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleBox(
                      label: '동아리 소개',
                      fontSize: 20,
                    ),
                    GestureDetector(
                      onTap: Get.find<MemberController>().updateClubInfo,
                      child: Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: ResponsibleLayout.isMobile(context) ? 16 : 200),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: const Color(0xffe0e0e0),
                      border: Border.all(color: const Color(0xffb5b5b5)),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  Text(
                                    '동아리명',
                                    style: Get.theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  GetX<MemberController>(builder: (controller) {
                                    return Text(
                                      controller.member!.club!.clubName,
                                      style: Get.theme.textTheme.bodyMedium,
                                    );
                                  })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  Text(
                                    '동아리개설일',
                                    style: Get.theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  GetX<MemberController>(builder: (controller) {
                                    return Text(
                                        DateFormat.yMd().format(DateTime.parse(
                                            controller.member!.club!.createAt)),
                                        style: Get.theme.textTheme.bodyMedium);
                                  })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  Text(
                                    '동아리분류',
                                    style: Get.theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  GetX<MemberController>(builder: (controller) {
                                    return Text(
                                      controller.member!.club!.classify,
                                      style: Get.theme.textTheme.bodyMedium,
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget _myPromotions() => SliverToBoxAdapter(
        child: GetX<PromotionController>(builder: (controller) {
          final myPromotions = controller.promotions
              .where(
                (promotion) =>
                    promotion.userId == Get.find<MemberController>().member!.id,
              )
              .toList();
          return (myPromotions.isNotEmpty)
              ? Center(
                  child: Container(
                    color: Colors.white,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal:
                                ResponsibleLayout.isMobile(context) ? 16 : 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TitleBox(label: '내가 쓴 글', fontSize: 20),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const PromotionWrite(),
                                    binding: PromotionWriteBinding());
                              },
                              child: Icon(
                                Icons.add,
                                color: Get.theme.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      ...List.generate(myPromotions.length, (index) {
                        final Promotion promotion = myPromotions[index];
                        return _buildItem(promotion: promotion);
                      })
                    ]),
                  ),
                )
              : _noItem();
        }),
      );

  Widget _buildItem({required Promotion promotion}) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {
            Get.to(() => PromotionScreen(promotion: promotion));
          },
          child: PromotionItem(
            promotion: promotion,
            type: PromotionItemtype.LISTITEM,
          ),
        ));
  }

  Widget _noItem() => Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 100,
        child: const Text("작성한 글이 없습니다"),
      );
}
