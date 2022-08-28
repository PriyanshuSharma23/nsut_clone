import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/notice_controller.dart';
import 'package:nsutx/utils/day.dart';
import 'package:nsutx/widgets/custom_divider.dart';
import 'package:nsutx/widgets/elevated_container.dart';

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({Key? key}) : super(key: key);

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  final NoticeController _noticeController = Get.put(NoticeController());

  String currentDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NSUT Notices and Circulars',
                  style: Get.theme.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Day.todaysDate(separator: ' '),
                  style: Get.theme.textTheme.headline6!.copyWith(
                    color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ElevatedContainer(
                  child: Obx(
                    () => ListView.separated(
                      itemBuilder: (context, index) {
                        final currentItem =
                            _noticeController.notices.elementAt(index);
                        bool showDivider = currentItem.date != currentDate;
                        if (showDivider) {
                          currentDate = currentItem.date;
                        }
                        return Column(
                          children: [
                            if (showDivider)
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: CustomDivider(currentDate: currentDate),
                              ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Get.isDarkMode
                                      ? Colors.white54
                                      : Colors.black54,
                                  width: 1.5,
                                ),
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                    'assets/file_icons/${currentItem.documentType.toLowerCase()}.png'),
                                title: Text(currentItem.title,
                                    style: Get.theme.textTheme.subtitle1!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                subtitle: Text(currentItem.description),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: _noticeController.notices.length,
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  right: 10,
                  width: 75,
                  height: 75,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/nsut_logo.png')),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
