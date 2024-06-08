import 'dart:developer';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wedevs/model/product_model.dart';

class HomeController extends GetxController {
  RxList<ProductModel> productData = <ProductModel>[].obs;
  RxBool newestSelected = false.obs;
  RxBool oldestSelected = false.obs;
  RxBool bestSellingSelected = false.obs;
  RxBool priceLowToHighSelected = false.obs;
  RxBool priceHighToLowSelected = false.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 2500), () async {
      productData.value = await loadProducts();
      log("111: $productData");
    });
  }

  Future<List<ProductModel>> loadProducts() async {
    final String response =
        await rootBundle.loadString('assets/product_response.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }

  void sortProducts(bool ascending) {
    if (productData.isNotEmpty) {
      productData.sort((a, b) => ascending
          ? int.parse(a.price).compareTo(int.parse(b.price))
          : int.parse(b.price).compareTo(int.parse(a.price)));
    }
  }

  applyFilters() {
    if (priceHighToLowSelected.value) {
      sortProducts(false);
      Get.back();
    } else {
      sortProducts(true);
      Get.back();
    }
    newestSelected.value = false;
    oldestSelected.value = false;
    bestSellingSelected.value = false;
    priceLowToHighSelected.value = false;
    priceHighToLowSelected.value = false;
    Get.back();
  }
}
