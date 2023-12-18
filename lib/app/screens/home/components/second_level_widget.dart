import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/app/models/category_model.dart';
import 'package:shop_mobile/app/screens/home/components/all_first_level_widget.dart';
import 'package:shop_mobile/app/screens/home/components/all_second_level_widget.dart';
import 'package:shop_mobile/app/screens/home/components/third_level_widget.dart';
import 'package:shop_mobile/app/screens/home/home_controller.dart';
import 'package:shop_mobile/app/util/constants.dart';

class SecondLevelWidget extends StatefulWidget {
  const SecondLevelWidget({super.key});

  @override
  State<SecondLevelWidget> createState() => _SecondLevelWidgetState();
}

class _SecondLevelWidgetState extends State<SecondLevelWidget> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        children: [
          SizedBox(
              height: 220,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollNotification) {
                  if (scrollNotification is ScrollStartNotification) {
                    if (controller.currentIndex == 1) {
                      controller.setCurrentIndex(0);
                    } else {
                      controller.setCurrentIndex(1);
                    }
                  }
                  return false;
                },
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 6,
                          childAspectRatio: 1.1,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.categoryList.length,
                        itemBuilder: (context, index) {
                          if (index == controller.categoryList.length - 1) {
                            return Visibility(
                              visible: controller.categoryList.isNotEmpty,
                              child: GestureDetector(
                                onTap: () {
                                  controller.setCurrentIndex(1);
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          const AllSecondLevelWidget());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/all.svg',
                                        width:
                                            40.0, // Adjust the width as needed
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text("More"),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            CategoryModel categoryModel =
                                controller.categoryList[index];
                            return GestureDetector(
                              onTap: () {
                                controller.setCurrentIndex(0);

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
                                child: SizedBox(
                                  width: 50,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: ClipRRect(
                                          child: Image.network(
                                            categoryModel.imageUrl != null
                                                ? categoryModel.imageUrl!
                                                : Constants.dummyImage,
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
                          }
                        }),
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.indexList.map((url) {
              int index = controller.indexList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentIndex == index
                      ? Colors.blueAccent
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}
