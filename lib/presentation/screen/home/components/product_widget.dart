import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/presentation/screen/home/components/variant_widget.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/util/constants.dart';
import '../../../../data/models/product_model.dart';
import '../../../getx/home/home_controller.dart';
import 'all_first_level_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Products",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.66,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.productList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ProductModel productModel = controller.productList[index];
                    return GestureDetector(
                      onTap: () {Get.toNamed(Routes.homeDetail, arguments: productModel);
                      },
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 150,
                              width: Get.width,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  topLeft: Radius.circular(16),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: Image.network(
                                  productModel.imageUrl != null
                                      ? productModel.imageUrl!
                                      : Constants.dummyImage,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      productModel.variants.isEmpty
                                          ? GestureDetector(
                                        onTap: () {
                                        },
                                              child: const Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.black54,
                                                size: 21,
                                              ),
                                            )
                                          : GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) =>  VariantWidget(productModel: productModel,),
                                          );
                                        },
                                            child: const Icon(
                                                Icons.visibility,
                                                color: Colors.black54,
                                                size: 21,
                                              ),
                                          ),
                                    ],
                                  ),
                                  Text(
                                    productModel.productName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${productModel.price} MMK",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ));
    });
  }
}
