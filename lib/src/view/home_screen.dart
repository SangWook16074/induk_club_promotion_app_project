import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/page_view_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/login_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/tablet_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/side_menu.dart';
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
            bottomNavigationBar: (ResponsibleLayout.isMobile(context))
                ? GetX<PageViewController>(builder: (controller) {
                    return BottomNavigationBar(
                      elevation: 0.0,
                      currentIndex: controller.pageIndex,
                      selectedItemColor: const Color(0xff713eff),
                      unselectedItemColor: Colors.black,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      onTap: controller.changeIndex,
                      type: BottomNavigationBarType.fixed,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home_outlined),
                            activeIcon: Icon(Icons.home),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.history_toggle_off_outlined),
                            activeIcon: Icon(Icons.history_toggle_off),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: ProfileImage(type: ProfileType.ICON),
                            activeIcon:
                                ProfileImage(type: ProfileType.ICONACTIVE),
                            label: ''),
                      ],
                    );
                  })
                : null),
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
                    Get.to(
                      () => ResponsibleLayout(
                        mobile: const MobilePromotionView(),
                        tablet: const TabletPromotionView(),
                        desktop: DesktopPromotionView(
                          promotion: promotion,
                        ),
                      ),
                    );
                  },
                  child: PromotionItem(
                    promotion: promotion,
                    date: ' D - 9 ',
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
      title: SearchTextField(
          controller: Get.find<AppController>().searchController,
          type: SearchBarType.DESKTOP),
      centerTitle: true,
      actions: (ResponsibleLayout.isMobile(context))
          ? [
              GetX<LoginController>(builder: (controller) {
                if (controller.user == null) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: controller.signOut,
                    child: const Center(
                      child: Text(
                        "로그아웃",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }
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
            Get.to(
              () => ResponsibleLayout(
                mobile: const MobilePromotionView(),
                tablet: const TabletPromotionView(),
                desktop: DesktopPromotionView(
                  promotion: promotion,
                ),
              ),
            );
          },
          child: PromotionItem(
            date: "D - 9",
            promotion: promotion,
            showDday: showDday,
          ));
}
