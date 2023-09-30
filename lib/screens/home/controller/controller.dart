import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:jenil_chandarana_demo2/screens/home/modal/home_modal.dart';
import 'package:jenil_chandarana_demo2/utils/api_helper.dart';

class HomeController extends GetxController {
  Rx<ProductModal> data = ProductModal().obs;
  RxBool displayData = false.obs;
  RxBool displaySearchingAnimation = false.obs;
  RxList<bool> button = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  Future<void> apiCalling() async {
    displayData.value = false;
    data.value = await ApiHelper.apiHelper.getApi();
    displayProductData();
  }

  void displayProductData() {
    bool check = true;
    displayData.value = false;
    check = true;
    try {
      data.value.productData![0].name;
    } catch (e) {
      check = false;
    }
    if(check == true)
    {
      displayData.value = true;
    }
    else {
      displayProductData();
    }
  }

  void filterBasedOnPriceHighToLow()
  {
    displaySearchingAnimation.value = true;
    data.value.productData!.sort((a, b) => double.parse(b.price!).compareTo(double.parse(a.price!)));
    Timer(const Duration(seconds: 1), () {displaySearchingAnimation.value = false;});
  }

  void filterBasedOnPriceLowtoHigh()
  {
    displaySearchingAnimation.value = true;
    data.value.productData!.sort((a, b) => double.parse(a.price!).compareTo(double.parse(b.price!)));
    Timer(const Duration(seconds: 1), () {displaySearchingAnimation.value = false;});
  }

  void filterBasedOnRatingsHighToLow()
  {
    displaySearchingAnimation.value = true;
    data.value.productData!.sort((a, b) => double.parse(b.averageRating!).compareTo(double.parse(a.averageRating!)));
    Timer(const Duration(seconds: 1), () {displaySearchingAnimation.value = false;});
  }

  void filterBasedOnNameAtoZ()
  {
    displaySearchingAnimation.value = true;
    data.value.productData!.sort((a, b) {return a.name?.toLowerCase().compareTo(b.name?.toLowerCase() ?? "") ?? 0;});
    Timer(const Duration(seconds: 1), () {displaySearchingAnimation.value = false;});
  }

  void filterBasedOnNameZtoA()
  {
    displaySearchingAnimation.value = true;
    data.value.productData!.sort((a, b) {return b.name?.toLowerCase().compareTo(a.name?.toLowerCase() ?? "") ?? 0;});
    Timer(const Duration(seconds: 1), () {displaySearchingAnimation.value = false;});
  }
  void filterBasedOnCategoryAtoZ()
  {
    displaySearchingAnimation.value = true;
    data.value.productData!.sort((a, b) {return a.categoryName?.toLowerCase().compareTo(b.categoryName?.toLowerCase() ?? "") ?? 0;});
    Timer(const Duration(seconds: 1), () {displaySearchingAnimation.value = false;});
  }

  void filterBasedOnCategoryZtoA()
  {
    displaySearchingAnimation.value = true;
    data.value.productData!.sort((a, b) {return b.categoryName?.toLowerCase().compareTo(a.categoryName?.toLowerCase() ?? "") ?? 0;});
    Timer(const Duration(seconds: 1), () {displaySearchingAnimation.value = false;});
  }
}
