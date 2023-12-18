import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/util/constants.dart';
import '../../../../data/models/product_model.dart';
import '../../../getx/cart/cart_controller.dart';

class CartInfoWidget extends StatelessWidget {
  const CartInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.cartList.length,
              itemBuilder: (context, index) {
                ProductModel productModel = controller.cartList[index].product;
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 130,
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
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    productModel.productName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
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
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.horizontal_rule,
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "${controller.cartList[index].quantity}"),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.add,
                                      color: Colors.black54,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                controller.deleteCartItem(
                                    controller.cartList[index].id);
                              },
                              child: const Icon(
                                Icons.delete_outlined,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }));
    });
  }
}
