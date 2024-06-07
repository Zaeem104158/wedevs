import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                        backgroundColor: HexColor(ColorConst.backgroundColor),
                        Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: homeController.newestSelected.value,
                                    onChanged: (bool? value) {
                                      homeController.newestSelected.value =
                                          value ?? false;
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('Newest'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: homeController.oldestSelected.value,
                                    onChanged: (bool? value) {
                                      homeController.oldestSelected.value =
                                          value ?? false;
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('Oldest'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: homeController
                                        .bestSellingSelected.value,
                                    onChanged: (bool? value) {
                                      homeController.bestSellingSelected.value =
                                          value ?? false;
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('Best Selling'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: homeController
                                        .priceLowToHighSelected.value,
                                    onChanged: (bool? value) {
                                      homeController.priceLowToHighSelected
                                          .value = value ?? false;
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('Price Low to High'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: homeController
                                        .priceHighToLowSelected.value,
                                    onChanged: (bool? value) {
                                      homeController.priceHighToLowSelected
                                          .value = value ?? false;
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('Price High to Low'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: applyFilters,
                                    child: Text('Apply'),
                                  ),
                                ],
                              ),
                            ],
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
                      ProductModel product = homeController.productData[index];
                      return ProductCard(product: product);
                    },
                  ),
                )
              : const Center(child: CircularProgressIndicator())),
        ],
      ),
    )));
  }
}

void applyFilters() {
  // Apply filter logic here
  Get.back(); // Close the bottom sheet
}
