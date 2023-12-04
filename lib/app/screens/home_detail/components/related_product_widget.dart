import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/app/models/product_model.dart';
import 'package:shop_mobile/app/screens/home_detail/home_detail_controller.dart';

import '../../../util/constants.dart';

class RelatedProduct extends StatelessWidget {
  const RelatedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDetailController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Related Products",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
              color: Colors.white,
              height: 220,
              child: ListView.builder(
                  itemCount: controller.productList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ProductModel productModel = controller.productList[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 120,
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
                                    Text(
                                      productModel.productName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      productModel.erpCode,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.black54,
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
                      ),
                    );
                  })),
        ],
      );
    });
  }
}
