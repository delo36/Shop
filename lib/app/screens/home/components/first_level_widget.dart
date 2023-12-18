import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_mobile/app/models/division_model.dart';
import 'package:shop_mobile/app/screens/home/home_controller.dart';

import 'all_first_level_widget.dart';

class FirstLevelWidget extends StatelessWidget {
  const FirstLevelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
                color: Colors.white,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: controller.divisionList.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            DivisionModel divisionModel =
                                controller.divisionList[index];
                            return GestureDetector(
                              onTap: () async {
                                controller.fetchCategoryList(
                                    divisionModel.divisionId);
                                controller.setSelectedDivisionIndex(index);
                                controller.setSelectedDivisionId(
                                    divisionModel.divisionId);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    divisionModel.divisionName,
                                    style: TextStyle(
                                      color: controller.selectedDivisionIndex ==
                                              index
                                          ? Colors.black
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const AllFirstLevelWidget(),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "All",
                            style: TextStyle(
                                // Add responsive font size if needed
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ));
    });
  }
}
