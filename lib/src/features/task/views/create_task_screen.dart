import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/app_date_picker.dart';
import 'package:todo_app/src/core/utils/app_time_picker.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/general_widgets/app_button.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final dateContrl = TextEditingController();
  final startTimeContrl = TextEditingController();
  final endTimeContrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 48.r,
                    width: 48.r,
                    decoration: BoxDecoration(
                      color: AppColors.grey04,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: AppColors.grey05,
                      size: 32.r,
                    ),
                  ),
                ),
                title: Center(
                  child: Text(
                    'Create new task',
                    style: theme.textTheme.s22w600.copyWith(
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
              const YMargin(24),
              Text(
                'Task Name',
                style: theme.textTheme.s22w600.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const YMargin(12),
              TextField(
                  decoration: InputDecoration(
                hintText: 'UI Designs',
                hintStyle: const TextStyle(color: AppColors.borderGrey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: AppColors.borderGrey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.borderGrey,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              )),
              const YMargin(24),
              Text(
                'Category',
                style: theme.textTheme.s22w600.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const YMargin(12),
              const ChipTabs(),
              const YMargin(24),
              Text(
                'Date & Time',
                style: theme.textTheme.s22w600.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const YMargin(12),
              GestureDetector(
                onTap: () async {
                  dateContrl.text = await openDatePicker(context: context) ??
                      DateTime.now().toDate;
                },
                child: TextFormField(
                    controller: dateContrl,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: '05 Apirl, Tuesday',
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.primary,
                        size: 16.r,
                      ).withContainer(
                          height: 28.r,
                          width: 28.r,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 16.w),
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1)),
                      hintStyle: const TextStyle(color: AppColors.borderGrey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: AppColors.borderGrey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.borderGrey,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    )),
              ),
              const YMargin(16),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: width(context) * 0.4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time',
                            style: theme.textTheme.s22w600.copyWith(
                              color: AppColors.textColor,
                            ),
                          ),
                          const YMargin(12),
                          GestureDetector(
                            onTap: () async {
                              startTimeContrl.text =
                                  await openTimePicker(context: context) ??
                                      DateTime.now().toTime;
                            },
                            child: TextFormField(
                                controller: startTimeContrl,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: '9:00AM',
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.primary,
                                    size: 32.r,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: AppColors.borderGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: const BorderSide(
                                      color: AppColors.borderGrey,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.borderGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  XMargin(12),
                  Expanded(
                    child: SizedBox(
                      width: width(context) * 0.4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End Time',
                            style: theme.textTheme.s22w600.copyWith(
                              color: AppColors.textColor,
                            ),
                          ),
                          const YMargin(12),
                          GestureDetector(
                            onTap: () async {
                              endTimeContrl.text =
                                  await openTimePicker(context: context) ??
                                      DateTime.now().toTime;
                            },
                            child: TextFormField(
                                controller: endTimeContrl,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: '9:00AM',
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.primary,
                                    size: 32.r,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: AppColors.borderGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: const BorderSide(
                                      color: AppColors.borderGrey,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.borderGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const YMargin(24),
              Text(
                'Description',
                style: theme.textTheme.s22w600.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const YMargin(12),
              TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText:
                        'Research design paths. There are many career paths within the field of design...',
                    hintMaxLines: 2,
                    hintStyle: const TextStyle(color: AppColors.borderGrey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: AppColors.borderGrey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.borderGrey,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  )),
              const YMargin(24),
              AppButton(text: 'Create Task', onPressed: () {}),
              const YMargin(24),
            ],
          ),
        ),
      ),
    );
  }
}

class ChipTabs extends StatefulWidget {
  const ChipTabs({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChipTabsState createState() => _ChipTabsState();
}

class _ChipTabsState extends State<ChipTabs> {
  int _selectedIndex = 0;

  final List<String> _tabs = ["Design", "Development", "Research"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(_tabs.length, (int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ChoiceChip(
            label: Container(
              height: 24.h,
              alignment: Alignment.center,
              child: Text(
                _tabs[index],
                style: TextStyle(
                  color: _selectedIndex != index
                      ? AppColors.textColor
                      : Colors.white,
                ),
              ),
            ),
            checkmarkColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
              side: const BorderSide(
                  color: Colors.transparent), // Remove the border
            ),
            selectedColor: AppColors.primary,
            backgroundColor: const Color.fromARGB(255, 164, 211, 254),
            selected: _selectedIndex == index,
            onSelected: (bool selected) {
              setState(() {
                // _selectedIndex = selected ? index : 0;
                _selectedIndex = index;
              });
            },
          ),
        );
      }),
    );
  }
}
