import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/branch_controller.dart';
import 'package:nsutx/widgets/elevated_container.dart';
import 'package:nsutx/widgets/selector_item.dart';
import 'package:nsutx/widgets/selector_widget.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({Key? key}) : super(key: key);

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  int _selector = 0;

  final _branchController = Get.put(BranchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Syllabus',
                    style: Get.theme.textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Catch all your academic requirements here',
                    style: Get.theme.textTheme.headline6!.copyWith(
                      color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ElevatedContainer(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Select semester',
                                style: Get.theme.textTheme.headline6!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Selector(
                            itemsLength: 8,
                            onItemSelected: (int i) {
                              setState(() {
                                _selector = i;
                              });
                            },
                            items: [
                              for (int i = 0; i < 8; i++)
                                SelectorItem(
                                  isSelected: i == _selector,
                                  width: 35,
                                  height: 35,
                                  child: Text('${i + 1}'),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Select Branch',
                                style: Get.theme.textTheme.headline6!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return BandCard(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    _branchController.branches
                                        .elementAt(index)
                                        .name,
                                    style: Get.theme.textTheme.headline6!),
                              ),
                            );
                          },
                          childCount: _branchController.branches.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
