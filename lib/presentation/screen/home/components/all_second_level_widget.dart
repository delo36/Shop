import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/constants.dart';
import '../../../../data/models/category_model.dart';
import '../../../getx/home/home_controller.dart';


class AllSecondLevelWidget extends StatelessWidget {
  const AllSecondLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(() => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Item Category",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.76,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.categoryList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      CategoryModel categoryModel =
                          controller.categoryList[index];
                      return GestureDetector(
                        onTap: () {
                          controller.setSelectedCategoryId(
                              categoryModel.itemCategoryId);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 50,
                            height: 100,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: ClipRRect(
                                    child: Image.network(
                                      Constants.dummyImage,
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    categoryModel.itemCategoryName,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
