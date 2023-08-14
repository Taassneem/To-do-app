import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/common/common.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/feature/task/presentation/screens/add_task_screen/add_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                AppString.today,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: AppColors.white,
                dateTextStyle: Theme.of(context).textTheme.bodySmall!,
                dayTextStyle: Theme.of(context).textTheme.bodySmall!,
                monthTextStyle: Theme.of(context).textTheme.bodySmall!,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
              const SizedBox(
                height: 11,
              ),
              // noTasksWidget(context),
              InkWell(
                child: const taskComponent(),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 240,
                          color: AppColors.deepGrey,
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                    text: AppString.completed,
                                    onPressed: () {}),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                    text: AppString.deleteTask,
                                    backgroundColor: AppColors.red,
                                    onPressed: () {}),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                    text: AppString.cancel, onPressed: () {}),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),

              const SizedBox(
                height: 24,
              ),
              const taskComponent2(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigate(context: context, screen: const AddTask());
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Row noTasksWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(AppAssets.pic4),
            const SizedBox(
              height: 11,
            ),
            Text(
              AppString.question,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              AppString.tab,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class taskComponent2 extends StatelessWidget {
  const taskComponent2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.brown,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task 1',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                    const Icon(
                      Icons.timer_sharp,
                      color: AppColors.white,
                      size: 24,
                    ),
                    Text(' 09:33 PM - 09:48 PM',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
                Text(
                  'Learn Dart',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              width: 110,
            ),
            Container(
              height: 80,
              width: 0.5,
              color: AppColors.white,
            ),
            const SizedBox(
              width: 9,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                AppString.toDo,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class taskComponent extends StatelessWidget {
  const taskComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.red,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task 1',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                    const Icon(
                      Icons.timer_sharp,
                      color: AppColors.white,
                      size: 24,
                    ),
                    Text(' 09:33 PM - 09:48 PM',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
                Text(
                  'Learn Dart',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              width: 110,
            ),
            Container(
              height: 80,
              width: 0.5,
              color: AppColors.white,
            ),
            const SizedBox(
              width: 9,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                AppString.toDo,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
