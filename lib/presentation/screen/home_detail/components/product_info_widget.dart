import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/presentation/screen/home_detail/components/related_product_widget.dart';


import '../../../../core/util/constants.dart';
import '../../../getx/home_detail/home_detail_controller.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDetailController>(builder: (controller) {
      return Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.black,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 280,
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
                      controller.selectedProduct.value.imageUrl != ""
                          ? controller.selectedProduct.value.imageUrl
                          : Constants.dummyImage,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  controller.selectedProduct.value.erpCode,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  controller.selectedProduct.value.productName,
                  style: const TextStyle(color: Colors.black87, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${controller.selectedProduct.value.price} MMK",
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                        onPressed: () {
                          controller.postCartItem(
                              controller.selectedProduct.value.productCode, "");
                        },
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const RelatedProduct()
              ],
            ));
    });
  }
}
