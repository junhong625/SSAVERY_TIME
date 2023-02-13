import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loadingController extends GetxController {
  static loadingController get to =>  Get.find();

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;
  void setIsLoading(bool value) => _isLoading.value = value;
}


