import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/common/common.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/feature/task/presentation/screens/add_task_screen/add_task.dart';

import '../../../data/model/task_model.dart';
import '../../cubit/task_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return Column(
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
                    height: 10,
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
                      BlocProvider.of<TaskCubit>(context).getSelectedDate(date);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocProvider.of<TaskCubit>(context).homeScreen.isEmpty
                      ? noTasksWidget(context)
                      : Expanded(
                          child: ListView.builder(
                            itemCount: BlocProvider.of<TaskCubit>(context)
                                .homeScreen
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                child: taskComponent(
                                  taskModel: BlocProvider.of<TaskCubit>(context)
                                      .homeScreen[index],
                                ),
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
                                              BlocProvider.of<TaskCubit>(
                                                              context)
                                                          .homeScreen[index]
                                                          .isComplete ==
                                                      1
                                                  ? Container()
                                                  : SizedBox(
                                                      height: 48,
                                                      width: double.infinity,
                                                      child:
                                                          CustomElevatedButton(
                                                              text: AppString
                                                                  .completed,
                                                              onPressed: () {
                                                                BlocProvider.of<
                                                                            TaskCubit>(
                                                                        context)
                                                                    .updateTask(BlocProvider.of<TaskCubit>(
                                                                            context)
                                                                        .homeScreen[
                                                                            index]
                                                                        .id);
                                                                Navigator.pop(
                                                                    context);
                                                              }),
                                                    ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              SizedBox(
                                                height: 48,
                                                width: double.infinity,
                                                child: CustomElevatedButton(
                                                    text: AppString.deleteTask,
                                                    backgroundColor:
                                                        AppColors.red,
                                                    onPressed: () {
                                                      BlocProvider.of<
                                                                  TaskCubit>(
                                                              context)
                                                          .deleteTask(BlocProvider
                                                                  .of<TaskCubit>(
                                                                      context)
                                                              .homeScreen[index]
                                                              .id);
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              SizedBox(
                                                height: 40,
                                                width: double.infinity,
                                                child: CustomElevatedButton(
                                                    text: AppString.cancel,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                              );
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigate(context: context, screen: AddTask());
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
class taskComponent extends StatelessWidget {
  const taskComponent({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: getColor(taskModel.color),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  taskModel.title,
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
                    Text(' ${taskModel.startTime} - ${taskModel.endTime}',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
                Text(
                  taskModel.note,
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
                taskModel.isComplete == 1
                    ? AppString.taskCompleted
                    : AppString.toDo,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
