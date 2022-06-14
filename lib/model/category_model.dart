import 'package:flutter/material.dart';

import '../utils/assets/app_image.dart';

class CategoryModel {
  final String? name;
  final String? price;
  final Widget? imageDescription;

  CategoryModel({this.name, this.price, this.imageDescription});
}

extension CategoryModelExtension on CategoryModel {
  // Dummy data
  List<CategoryModel> onCategoryList() {
    return <CategoryModel>[
      CategoryModel(
          name: 'Balcony repair',
          price: '\$24',
          imageDescription: AppImages.imgCategoryOne.widget()),
      CategoryModel(
          name: 'Redecorating',
          price: '\$24',
          imageDescription: AppImages.imgCategoryTwo.widget()),
      CategoryModel(
          name: 'Painting works',
          price: '\$24',
          imageDescription: AppImages.imgCategoryThree.widget()),
      CategoryModel(
          name: 'Interior design',
          price: '\$24',
          imageDescription: AppImages.imgCategoryFour.widget()),
      CategoryModel(
          name: 'Interior design',
          price: '\$24',
          imageDescription: AppImages.imgCategorFive.widget()),
      CategoryModel(
          name: 'Balcony repair',
          price: '\$24',
          imageDescription: AppImages.imgCategorySix.widget()),
    ];
  }
}
