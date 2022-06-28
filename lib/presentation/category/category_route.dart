import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/model/category_model.dart';

class CategoryRoute extends StatelessWidget {
  const CategoryRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CategoryPage());
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CategoryState();
}

class CategoryState extends State<CategoryPage> {
  final List<CategoryModel> categoryList = CategoryModel().onCategoryList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                _buildItemCategoryWidget(context, categoryList[index])
              ],
            );
          }),
    );
  }

  Widget _buildItemCategoryWidget(
      BuildContext context, CategoryModel categoryModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Expanded(
        child: categoryModel.imageDescription ?? const SizedBox(),
      ),
    );
  }
}
