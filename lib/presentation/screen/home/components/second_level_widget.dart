import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/presentation/screen/home/components/third_level_widget.dart';
import '../../../../core/util/constants.dart';
import '../../../../data/models/category_model.dart';
import '../../../getx/home/home_controller.dart';

class SecondLevelWidget extends StatelessWidget {
  const SecondLevelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          color: Colors.white,
          height: 60,
          child: ListView.builder(
            itemCount: controller.categoryList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              CategoryModel categoryModel = controller.categoryList[index];
              return GestureDetector(
                onTap: () {
                  controller.setSelectedCategoryId(
                      categoryModel.itemCategoryId);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ThirdLevelWidget(
                      categoryModel: categoryModel,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: Image.network(
                              categoryModel.imageUrl != null
                                  ? categoryModel.imageUrl!
                                  : Constants.dummyImage,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(categoryModel.itemCategoryName),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ));
    });
  }
}
