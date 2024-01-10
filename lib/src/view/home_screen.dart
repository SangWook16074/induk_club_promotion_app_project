import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/login_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/searchfocus.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: SafeArea(
        child: Scaffold(
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() => GetX<PromotionController>(
        builder: (controller) => (controller.promotions.isEmpty)
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : CustomScrollView(
                slivers: [
                  _appBar(),
                  _header(),
                  _headerItem(),
                  _more(),
                  _moreItem(),
                ],
              ),
      );

  Widget _header() {
    return const SliverToBoxAdapter(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                TitleBox(
                  label: '마감이 다되어 가요',
                  fontSize: 20,
                  type: TitleType.IMPORTANT,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _more() {
    return const SliverToBoxAdapter(
      child: Column(children: [
        Row(
          children: [
            TitleBox(label: '동아리 더보기', fontSize: 25),
          ],
        ),
      ]),
    );
  }

  Widget _moreItem() {
    return SliverPadding(
      padding: EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8 : 20),
      sliver: SliverToBoxAdapter(
        child: GetX<PromotionController>(builder: (controller) {
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (ResponsibleLayout.isDesktop(context) ? 3 : 2),
                mainAxisSpacing: ResponsibleLayout.isMobile(context) ? 8 : 20,
                crossAxisSpacing: ResponsibleLayout.isMobile(context) ? 8 : 20,
                childAspectRatio: 0.7,
              ),
              itemCount: controller.promotions.length,
              itemBuilder: (context, index) {
                final promotion = controller.promotions[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => PromotionScreen(promotion: promotion));
                  },
                  child: PromotionItem(
                    promotion: promotion,
                    showDday: false,
                  ),
                );
              });
        }),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: false,
      floating: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: (ResponsibleLayout.isMobile(context))
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black,
              ),
            )
          : null,
      title: InkWell(
        onTap: () {
          Get.off(
            () => SearchFocus(),
            transition: Transition.fadeIn,
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(
              color: Color(0xff713eff),
              width: 1.5,
            ),
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Color(0xff713eff),
              size: 20,
            ),
          ),
        ),
        // SearchTextField(
        //   controller: Get.find<AppController>().searchController,
        // ),
      ),
      centerTitle: true,
      actions: (ResponsibleLayout.isMobile(context))
          ? [
              GetX<LoginController>(builder: (controller) {
                return (controller.user == null)
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: SizedBox(
                            width: 60,
                            child: Center(
                              child: Text(
                                "로그인",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: controller.showSignOutDialog,
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: SizedBox(
                            width: 60,
                            child: Center(
                              child: Text(
                                "로그아웃",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              })
            ]
          : null,
    );
  }

  Widget _headerItem() {
    return SliverPadding(
      padding: EdgeInsets.all(ResponsibleLayout.isMobile(context) ? 8 : 20),
      sliver: SliverToBoxAdapter(
        child: GetX<PromotionController>(builder: (controller) {
          final promotionLength = controller.promotions.length;
          return (ResponsibleLayout.isMobile(context))
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(promotionLength, (index) {
                      final promotion = controller.promotions[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 300,
                            child: _buildItem(
                                promotion: promotion, showDday: true)),
                      );
                    }),
                  ),
                )
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (ResponsibleLayout.isDesktop(context)) ? 3 : 2,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: promotionLength,
                  itemBuilder: (context, index) {
                    final promotion = controller.promotions[index];
                    return _buildItem(promotion: promotion, showDday: true);
                  });
        }),
      ),
    );
  }

  Widget _buildItem({
    required Promotion promotion,
    required bool? showDday,
  }) =>
      GestureDetector(
          onTap: () {
            Get.to(() => PromotionScreen(promotion: promotion));
          },
          child: PromotionItem(
            date: "D - 9",
            promotion: promotion,
            showDday: showDday,
          ));
}
