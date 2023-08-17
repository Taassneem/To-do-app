// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/common/common.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/feature/task/presentation/components/add_task_components.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_cubit.dart';

import '../../cubit/task_state.dart';

// ignore: must_be_immutable
class AddTask extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<TaskCubit, TaskState>(
            listener: (context, state) {
              if (state is insertTasksSuccesState) {
                showToast(message: 'succes', state: ToastState.succces);
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<TaskCubit>(context).formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddTaskComponents(
                      controller:
                          BlocProvider.of<TaskCubit>(context).titleController,
                      title: AppString.title,
                      titleHint: AppString.titleHint,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return AppString.titleErrorMsg;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0.h),
                    AddTaskComponents(
                      controller:
                          BlocProvider.of<TaskCubit>(context).noteController,
                      title: AppString.note,
                      titleHint: AppString.noteHint,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return AppString.noteErrorMsg;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0.h),
                    AddTaskComponents(
                      title: AppString.date,
                      titleHint: DateFormat.yMd().format(
                          BlocProvider.of<TaskCubit>(context).currentDate),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            BlocProvider.of<TaskCubit>(context)
                                .getDate(context);
                          },
                          icon: const Icon(Icons.calendar_month_outlined),
                          color: AppColors.white),
                      readOnly: true,
                    ),
                    SizedBox(height: 24.0.h),
                    Row(
                      children: [
                        Expanded(
                            child: AddTaskComponents(
                          title: AppString.startTime,
                          titleHint:
                              BlocProvider.of<TaskCubit>(context).startTime,
                          suffixIcon: IconButton(
                              onPressed: () async {
                                BlocProvider.of<TaskCubit>(context)
                                    .getStartTime(context);
                              },
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: AppColors.white,
                              )),
                          readOnly: true,
                        )),
                        SizedBox(
                          width: 25.w,
                        ),
                        Expanded(
                            child: AddTaskComponents(
                          title: AppString.endTime,
                          titleHint:
                              BlocProvider.of<TaskCubit>(context).endTime,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              BlocProvider.of<TaskCubit>(context)
                                  .getEndTime(context);
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
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      height: 68.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.color,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10.w,
                                    ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<TaskCubit>(context)
                                          .changeChekIndex(index);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          BlocProvider.of<TaskCubit>(context)
                                              .getColor(index),
                                      child: index ==
                                              BlocProvider.of<TaskCubit>(
                                                      context)
                                                  .currentIndex
                                          ? const Icon(Icons.check)
                                          : null,
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 90.h,
                    ),
                    state is insertTasksLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ))
                        : SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: CustomElevatedButton(
                              text: AppString.createTask,
                              onPressed: () {
                                if (BlocProvider.of<TaskCubit>(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<TaskCubit>(context)
                                      .insertTasks();
                                }
                              },
                            ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
