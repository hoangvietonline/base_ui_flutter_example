import 'package:flutter/material.dart';

import '../../utils/assets/app_image.dart';

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
          imageDescription: AppImages.imgCategoryOne.widget(fit: BoxFit.cover)),
      CategoryModel(
          name: 'Redecorating',
          price: '\$24',
          imageDescription: AppImages.imgCategoryTwo.widget(fit: BoxFit.cover)),
      CategoryModel(
          name: 'Painting works',
          price: '\$24',
          imageDescription:
              AppImages.imgCategoryThree.widget(fit: BoxFit.cover)),
      CategoryModel(
          name: 'Interior design',
          price: '\$24',
          imageDescription:
              AppImages.imgCategoryFour.widget(fit: BoxFit.cover)),
      CategoryModel(
          name: 'Interior design',
          price: '\$24',
          imageDescription: AppImages.imgCategorFive.widget(fit: BoxFit.cover)),
      CategoryModel(
          name: 'Balcony repair',
          price: '\$24',
          imageDescription: AppImages.imgCategorySix.widget(fit: BoxFit.cover)),
    ];
  }
}
