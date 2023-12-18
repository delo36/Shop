import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/app/models/division_model.dart';

import '../../../util/constants.dart';
import '../home_controller.dart';

class AllFirstLevelWidget extends StatelessWidget {
  const AllFirstLevelWidget({super.key});

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
                        "All Division",
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
                    itemCount: controller.divisionList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DivisionModel divisionModel =
                          controller.divisionList[index];
                      return GestureDetector(
                        onTap: () {
                          controller
                              .setSelectedDivisionId(divisionModel.divisionId);
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
                                    divisionModel.divisionName,
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
