import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatefatabase.dart';
import '../../../../core/linkapi.dart';
import '../../home_controller.dart';
import '../../model/itemsmodel.dart';


class ListItemsHome extends GetView<HomeControllerImp> {
   const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
   const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Column(
            children: [
               const SizedBox(height: 10,),
              Container(
                padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin:  const EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(
                  "${AppLink.imagestItems}/${itemsModel.itemsImage}",
                  height: 130,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 160,
            width: 200,
          ),
          Positioned(
              left: 20,
              right: 20,
              child: Text(
                "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                style:  const TextStyle(
                    color: Colors.white,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }
}
