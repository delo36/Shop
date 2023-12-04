import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/app/models/category_model.dart';
import 'package:shop_mobile/app/models/product_category_model.dart';
import 'package:shop_mobile/app/screens/home/components/third_level_widget.dart';
import 'package:shop_mobile/app/screens/home/home_controller.dart';
import 'package:shop_mobile/app/util/constants.dart';

class ThirdLevelWidget extends StatelessWidget {
  const ThirdLevelWidget({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(() => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        categoryModel.itemCategoryName,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.productCategoryList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        ProductCategoryModel productCategoryModel =
                            controller.productCategoryList[index];
                        return GestureDetector(
                          onTap: () {
                            controller.setSelectedProductCategoryId(
                                productCategoryModel.productCategoryId);
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Image.network(
                                          productCategoryModel.imageUrl != null
                                              ? productCategoryModel.imageUrl!
                                              : Constants.dummyImage,
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(productCategoryModel
                                        .productCategoryName),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                )),
                          ),
                        );
                      })
                ],
              ),
            ),
          ));
    });
  }
}