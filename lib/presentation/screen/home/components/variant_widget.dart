import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/constants.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/models/variant_model.dart';
import '../../../getx/home/home_controller.dart';


class VariantWidget extends StatelessWidget {
  const VariantWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          productModel.productName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      )
                    ],
                  )),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Total Price",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "${controller.variantTotalPrice} MMK",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: productModel.variants.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  VariantModel variantModel = productModel.variants[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              child: ClipRRect(
                                child: Image.network(
                                  variantModel.imageUrl != null
                                      ? variantModel.imageUrl!
                                      : Constants.dummyImage,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                variantModel.variantCode,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    controller.decrementCount(variantModel,productModel.price);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black54,
                                          // Set border color
                                          width: 1.0, // Set border width
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            bottomLeft: Radius.circular(4))),
                                    child: const Icon(
                                      Icons.horizontal_rule,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text("${variantModel.count}"),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    controller.incrementCount(variantModel,productModel.price);
                                    controller.postCartItem(productModel.productCode, "", variantModel.variantCode);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black54,
                                          // Set border color
                                          width: 1.0, // Set border width
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(4),
                                            bottomRight: Radius.circular(4))),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              ],
                            )
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
      );
    });
  }
}
