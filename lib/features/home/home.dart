import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../../core/linkapi.dart';
import 'home_controller.dart';
import 'model/itemsmodel.dart';
import 'widgets/customappbar.dart';
import 'widgets/home/listcategorieshome.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Container(
        padding:  const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
             const SizedBox(
              height: 25,
            ),
            CustomAppBar(
              mycontroller: controller.search!,
              titleappbar: "Find Product",
              // onPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myfavroite);
              },
            ),
            GetBuilder<HomeControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? const ListCategoriesHome()
                    : ListItemsSearch(listdatamodel: controller.listdata),
              ),
            )

            //  CustomTitleHome(title: "Offer"),
            //  ListItemsHome()
          ],
        ));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
   const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics:  const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin:  const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding:  const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listdatamodel[index].itemsName!),
                        subtitle: Text(listdatamodel[index].categoriesName!),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
