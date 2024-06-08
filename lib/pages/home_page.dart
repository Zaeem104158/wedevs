import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:wedevs/component/custom_button_component.dart';
import 'package:wedevs/component/custom_text_component.dart';
import 'package:wedevs/component/product_card_component.dart';
import 'package:wedevs/component/svg_image_component.dart';
import 'package:wedevs/const/color_const.dart';
import 'package:wedevs/const/const_methods.dart';
import 'package:wedevs/const/image_path.dart';
import 'package:wedevs/const/text_const.dart';
import 'package:wedevs/controller/home_controller.dart';
import 'package:wedevs/model/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return SafeArea(
        child: Scaffold(
            extendBody: true, //to make floating action button notch transparent

            //to avoid the floating action button overlapping behavior,
            // when a soft keyboard is displayed
            // resizeToAvoidBottomInset: false,

            bottomNavigationBar: StylishBottomBar(
              // option: AnimatedBarOptions(
              //   // iconSize: 32,
              //   barAnimation: BarAnimation.blink,
              //   iconStyle: IconStyle.animated,

              //   // opacity: 0.3,
              // ),
              option: DotBarOptions(
                dotStyle: DotStyle.tile,
                gradient: const LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.pink,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              items: [
                BottomBarItem(
                  icon: const Icon(
                    Icons.house_outlined,
                  ),
                  selectedIcon: const Icon(Icons.house_rounded),
                  selectedColor: Colors.teal,
                  unSelectedColor: Colors.grey,
                  title: const Text('Home'),
                ),
                BottomBarItem(
                  icon: const Icon(Icons.star_border_rounded),
                  selectedIcon: const Icon(Icons.star_rounded),
                  selectedColor: Colors.red,
                  title: const Text('Star'),
                ),
                BottomBarItem(
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    selectedIcon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    selectedColor: Colors.deepOrangeAccent,
                    title: const Text('Style')),
                BottomBarItem(
                    icon: const Icon(
                      Icons.person_outline,
                    ),
                    selectedIcon: const Icon(
                      Icons.person_outline,
                    ),
                    selectedColor: Colors.deepPurple,
                    title: const Text('Profile')),
              ],
              hasNotch: true,
              fabLocation: StylishBarFabLocation.center,

              notchStyle: NotchStyle.circle,
              onTap: (index) {},
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100)),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [HexColor("#FF679B"), HexColor("#FF7B51")])),
                child: Icon(
                  CupertinoIcons.search,
                  color: HexColor(ColorConst.whiteColor),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: HexColor(ColorConst.whiteColor),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                                enableDrag: true,
                                ignoreSafeArea: false,
                                backgroundColor:
                                    HexColor(ColorConst.backgroundColor),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 47,
                                            height: 3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: HexColor(
                                                    ColorConst.checkBoxColor)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: CustomText(
                                                color: HexColor(
                                                    ColorConst.blackColor),
                                                fontSize: 17.36,
                                                fontWeight: FontWeight.w700,
                                                text: TextConst.filter),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: HexColor(
                                                  ColorConst.whiteColor),
                                              activeColor: HexColor(
                                                  ColorConst.checkBoxColor),
                                              side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  color: HexColor(ColorConst
                                                      .checkBoxColor)),
                                              value: homeController
                                                  .newestSelected.value,
                                              onChanged: (bool? value) {
                                                homeController.newestSelected
                                                    .value = value ?? false;
                                                homeController.oldestSelected
                                                    .value = false;
                                                homeController
                                                    .bestSellingSelected
                                                    .value = false;
                                                homeController
                                                    .priceLowToHighSelected
                                                    .value = false;
                                                homeController
                                                    .priceHighToLowSelected
                                                    .value = false;
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            const CustomText(
                                              text: TextConst.newest,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: HexColor(
                                                  ColorConst.whiteColor),
                                              activeColor: HexColor(
                                                  ColorConst.checkBoxColor),
                                              side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  color: HexColor(ColorConst
                                                      .checkBoxColor)),
                                              value: homeController
                                                  .oldestSelected.value,
                                              onChanged: (bool? value) {
                                                homeController.oldestSelected
                                                    .value = value ?? false;
                                                homeController.newestSelected
                                                    .value = false;
                                                homeController
                                                    .bestSellingSelected
                                                    .value = false;
                                                homeController
                                                    .priceLowToHighSelected
                                                    .value = false;
                                                homeController
                                                    .priceHighToLowSelected
                                                    .value = false;
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            const CustomText(
                                              text: TextConst.oldest,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: HexColor(
                                                  ColorConst.whiteColor),
                                              activeColor: HexColor(
                                                  ColorConst.checkBoxColor),
                                              side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  color: HexColor(ColorConst
                                                      .checkBoxColor)),
                                              value: homeController
                                                  .bestSellingSelected.value,
                                              onChanged: (bool? value) {
                                                homeController
                                                    .bestSellingSelected
                                                    .value = value ?? false;
                                                homeController.newestSelected
                                                    .value = false;
                                                homeController.oldestSelected
                                                    .value = false;
                                                homeController
                                                    .priceLowToHighSelected
                                                    .value = false;
                                                homeController
                                                    .priceHighToLowSelected
                                                    .value = false;
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            const CustomText(
                                              text: TextConst.bestSelling,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: HexColor(
                                                  ColorConst.whiteColor),
                                              activeColor: HexColor(
                                                  ColorConst.checkBoxColor),
                                              side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  color: HexColor(ColorConst
                                                      .checkBoxColor)),
                                              value: homeController
                                                  .priceLowToHighSelected.value,
                                              onChanged: (bool? value) {
                                                homeController
                                                    .priceLowToHighSelected
                                                    .value = value ?? false;
                                                homeController.newestSelected
                                                    .value = false;
                                                homeController
                                                    .bestSellingSelected
                                                    .value = false;
                                                homeController.oldestSelected
                                                    .value = false;
                                                homeController
                                                    .priceHighToLowSelected
                                                    .value = false;
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            const CustomText(
                                              text: TextConst.priceLowToHigh,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              checkColor: HexColor(
                                                  ColorConst.whiteColor),
                                              activeColor: HexColor(
                                                  ColorConst.checkBoxColor),
                                              side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  color: HexColor(ColorConst
                                                      .checkBoxColor)),
                                              value: homeController
                                                  .priceHighToLowSelected.value,
                                              onChanged: (bool? value) {
                                                homeController
                                                    .priceHighToLowSelected
                                                    .value = value ?? false;
                                                homeController.newestSelected
                                                    .value = false;
                                                homeController
                                                    .bestSellingSelected
                                                    .value = false;
                                                homeController
                                                    .priceLowToHighSelected
                                                    .value = false;
                                                homeController.oldestSelected
                                                    .value = false;
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            const CustomText(
                                              text: TextConst.priceHighToLow,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomButton(
                                              height: 61,
                                              width: 155.5,
                                              borderRadius: 10,
                                              backgroundColor: HexColor(
                                                  ColorConst.whiteColor),
                                              borderColor: HexColor(
                                                  ColorConst.grey50Color),
                                              onPressed: () {
                                                homeController.newestSelected
                                                    .value = false;
                                                homeController.oldestSelected
                                                    .value = false;
                                                homeController
                                                    .bestSellingSelected
                                                    .value = false;
                                                homeController
                                                    .priceLowToHighSelected
                                                    .value = false;
                                                homeController
                                                    .priceHighToLowSelected
                                                    .value = false;
                                                Get.back();
                                              },
                                              widget: CustomText(
                                                  color: HexColor(
                                                      ColorConst.grey200Color),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                  text: TextConst.cancel),
                                            ),
                                            CustomButton(
                                              height: 61,
                                              width: 155.5,
                                              backgroundColor: HexColor(
                                                  ColorConst.greenColor),
                                              borderRadius: 10,
                                              onPressed:
                                                  homeController.applyFilters,
                                              widget: CustomText(
                                                  color: HexColor(
                                                      ColorConst.whiteColor),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                  text: TextConst.apply),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  width: 15,
                                  child: SvgImage(
                                    assetName: ImagePath.filterIcon,
                                    colorFilter: ColorFilter.mode(
                                        HexColor(ColorConst.grey100Color),
                                        BlendMode.srcIn),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  text: TextConst.filter,
                                  color: HexColor(ColorConst.grey200Color),
                                  fontSize: 15.63,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              CustomText(
                                text: TextConst.sortby,
                                color: HexColor(ColorConst.grey200Color),
                                fontSize: 15.63,
                                fontWeight: FontWeight.w400,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: HexColor(ColorConst.grey100Color),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Transform.flip(
                                flipX: true,
                                child: const Icon(
                                  Icons.toc_rounded,
                                  // color: HexColor(ColorConst.grey100Color),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => homeController.productData.isNotEmpty
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 2 / 3,
                            ),
                            shrinkWrap: true,
                            itemCount: homeController.productData.length,
                            itemBuilder: (context, index) {
                              ProductModel product =
                                  homeController.productData[index];
                              return ProductCard(product: product);
                            },
                          ),
                        )
                      : const Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        )),
                ],
              ),
            )));
  }
}
