// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatefatabase.dart';
import '../../../../core/linkapi.dart';
import '../../home_controller.dart';
import '../../model/categoriesmodel.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
   const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height - 170,
      child: ListView.separated(
        separatorBuilder: (context, index) =>  const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
   const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 150,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColor.primaryColor.withOpacity(0.2)
                ),
                height: 150,
                width: double.infinity,
              ),
              Container(
                alignment: Alignment.center,
                height: 140,
                child: Text(
                  "${translateDatabase(categoriesModel.categoriesNamaAr, categoriesModel.categoriesName)}",
                  style:  const TextStyle(fontSize: 30, color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
