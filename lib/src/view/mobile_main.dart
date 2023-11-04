import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/promotion_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/tablet_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class MobileMain extends GetView<PromotionController> {
  const MobileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: const Text("Logo"),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Obx(
        () => (controller.promotions.isEmpty)
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    _header(),
                    _moreItems(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _header() => Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
            child: Row(
              children: [
                TitleBox(
                    type: TitleType.IMPORTANT,
                    label: "마감이 다 되어가요",
                    fontSize: 25)
              ],
            ),
          ),
          Obx(
            () => CarouselSlider.builder(
                itemCount: controller.promotions.length,
                itemBuilder: (context, index, realIndex) => Obx(() {
                      final promotion = controller.promotions[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => const ResponsibleLayout(
                                        mobile: MobilePromotionView(),
                                        tablet: TabletPromotionView(),
                                        desktop: DesktopPromotionView(),
                                        tabletToDesktop: 1000,
                                        mobiletoTablet: 800,
                                      ),
                                  binding: PromotionBinding());
                            },
                            child: PromotionItem(
                              promotion: promotion,
                              date: 'D-9',
                            )),
                      );
                    }),
                options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    aspectRatio: 1)),
          ),
        ],
      );

  Widget _moreItems() => Obx(
        () => Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
            child: Row(
              children: [
                TitleBox(type: TitleType.NORMAL, label: "동아리 더보기", fontSize: 25)
              ],
            ),
          ),
          ...List.generate(
            controller.promotions.length,
            (index) => Obx(() {
              final promotion = controller.promotions[index];
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                    onTap: () {
                      Get.to(
                          () => const ResponsibleLayout(
                                mobile: MobilePromotionView(),
                                tablet: TabletPromotionView(),
                                desktop: DesktopPromotionView(),
                                tabletToDesktop: 1000,
                                mobiletoTablet: 800,
                              ),
                          binding: PromotionBinding());
                    },
                    child: PromotionItem(
                      promotion: promotion,
                      date: 'D-9',
                    )),
              );
            }),
          ),
        ]),
      );
}
