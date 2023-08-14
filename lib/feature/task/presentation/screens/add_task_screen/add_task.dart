import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/feature/task/presentation/components/add_task_components.dart';

// ignore: must_be_immutable
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  TextEditingController startTimeController = TextEditingController();

  TextEditingController endTimeController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 30)));
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          AppString.addTask,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddTaskComponents(
              controller: titleController,
              title: AppString.title,
              titleHint: AppString.titleHint,
            ),
            const SizedBox(height: 24.0),
            AddTaskComponents(
              controller: noteController,
              title: AppString.note,
              titleHint: AppString.noteHint,
            ),
            const SizedBox(height: 24.0),
            AddTaskComponents(
              title: AppString.date,
              titleHint: DateFormat.yMd().format(currentDate),
              suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030));

                    setState(() {
                      if (pickedDate != null) {
                        currentDate = pickedDate;
                      } else {
                        // ignore: avoid_print
                        print('picked date is null');
                      }
                    });
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                  color: AppColors.white),
              readOnly: true,
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                    child: AddTaskComponents(
                  title: AppString.startTime,
                  titleHint: startTime,
                  suffixIcon: IconButton(
                      onPressed: () async {
                        TimeOfDay? pickedStartTime = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(DateTime.now()));
                        setState(() {
                          if (pickedStartTime != null) {
                            startTime = pickedStartTime.format(context);
                          } else {
                            // ignore: avoid_print
                            print('picked time is null');
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.timer_outlined,
                        color: AppColors.white,
                      )),
                  readOnly: true,
                )),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                    child: AddTaskComponents(
                  title: AppString.endTime,
                  titleHint: endTime,
                  suffixIcon: IconButton(
                    onPressed: () async {
                      TimeOfDay? pickedEndTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(DateTime.now()));
                      setState(() {
                        endTime = pickedEndTime!.format(context);
                      });
                    },
                    icon: const Icon(
                      Icons.timer_outlined,
                      color: AppColors.white,
                    ),
                  ),
                  readOnly: true,
                ))
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.color,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemBuilder: (context, index) {
                          Color getColor(index) {
                            switch (index) {
                              case 0:
                                return AppColors.blue;
                              case 1:
                                return AppColors.red;
                              case 2:
                                return AppColors.brown;
                              case 3:
                                return AppColors.green;
                              case 4:
                                return AppColors.grey;
                              case 5:
                                return AppColors.deeoGrey;

                              default:
                                return AppColors.purple;
                            }
                          }

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: getColor(index),
                              child: index == currentIndex
                                  ? const Icon(Icons.check)
                                  : null,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                height: 48,
                child: CustomElevatedButton(
                  text: AppString.createTask,
                  onPressed: () {},
                ))
          ],
        ),
      ),
    );
  }
}
