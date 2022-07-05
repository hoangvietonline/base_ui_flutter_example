import 'package:base_ui_flutter_example/utils/commom/app_color.dart';
import 'package:base_ui_flutter_example/utils/commom/app_text.dart';
import 'package:base_ui_flutter_example/utils/widget/app_back_widget.dart';
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
        child: Column(
      children: [
        const AppBackWidget(
          title: 'Interior design',
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          flex: 1,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w),
            itemCount: categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildItemCategoryWidget(context, categoryList[index]);
            },
          ),
        )
      ],
    )

        // child: ListView.builder(
        //     padding: const EdgeInsets.all(8),
        //     itemCount: categoryList.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Column(
        //         children: [
        //           _buildItemCategoryWidget(context, categoryList[index])
        //         ],
        //       );
        //     }),
        );
  }

  Widget _buildItemCategoryWidget(
      BuildContext context, CategoryModel categoryModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Expanded(
            child: GridTile(
              child: categoryModel.imageDescription ?? const SizedBox(),
            ),
          ),
          AppText.primary(
            categoryModel.name ?? "",
            fontSize: 16.sp,
          ),
          AppText.bodyMedium(
            categoryModel.price ?? "",
            fontSize: 14.sp,
            color: AppColors.gray,
          )
        ],
      ),
    );
  }
}
