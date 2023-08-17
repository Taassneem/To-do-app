import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/database/sqflite/sqflite_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/feature/task/presentation/cubit/task_state.dart';

import '../../../../core/utils/app_color.dart';
import '../../data/model/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 30)));
  int currentIndex = 0;
  void getDate(context) async {
    emit(getDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(getDateSuccesState());
    } else {
      // ignore: avoid_print
      print('picked date is null');
      emit(getDateFailsState());
    }
  }

  void getStartTime(context) async {
    emit(getStartTimeLoadingState());
    TimeOfDay? pickedStartTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      emit(getStartTimeSuccesState());
    } else {
      // ignore: avoid_print
      print('picked time is null');
      emit(getStartTimeFailsState());
    }
  }

  void getEndTime(context) async {
    emit(getEndTimeLoadingState());
    TimeOfDay? pickedEndTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(getEndTimeSuccesState());
    } else {
      // ignore: avoid_print
      print('picked time is null');
      emit(getEndTimeFailsState());
    }
  }

  void changeChekIndex(index) {
    emit(ChangeChekIndex());
    currentIndex = index;
  }

  void insertTasks() async {
    emit(insertTasksLoadingState());

    try {
    await  sl<SqfliteHelper>().insertToDB(TaskModel(
          
          note: noteController.text,
          title: titleController.text,
          endTime: endTime,
          startTime: startTime,
          isComplete: 0,
          color: currentIndex,
          date: DateFormat.yMd().format(currentDate)));
      emit(insertTasksSuccesState());
      titleController.clear();
      noteController.clear();
    } catch (e) {
      emit(insertTasksFailsState());
    }
  }

  List<TaskModel> homeScreen = [];
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
}
