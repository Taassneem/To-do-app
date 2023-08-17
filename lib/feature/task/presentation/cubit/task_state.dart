
// ignore_for_file: camel_case_types

sealed class TaskState {}

final class TaskInitial extends TaskState {}
final class getDateLoadingState extends TaskState {}
final class getDateSuccesState extends TaskState {}
final class getSelecteDateLoadingState extends TaskState {}
final class getSelecteDateSuccesState extends TaskState {}
final class getDateFailsState extends TaskState {}
final class getStartTimeSuccesState extends TaskState {}
final class getStartTimeLoadingState extends TaskState {}
final class getStartTimeFailsState extends TaskState {}
final class getEndTimeFailsState extends TaskState {}
final class getEndTimeSuccesState extends TaskState {}
final class getEndTimeLoadingState extends TaskState {}
final class insertTasksLoadingState extends TaskState {}
final class insertTasksSuccesState extends TaskState {}
final class insertTasksFailsState extends TaskState {}
final class getTasksLoadingState extends TaskState {}
final class getTasksSuccesState extends TaskState {}
final class getTasksFailsState extends TaskState {}
final class updateTasksLoadingState extends TaskState {}
final class deleteTasksLoadingState extends TaskState {}
final class updateTasksSuccesState extends TaskState {}
final class deleteTasksSuccesState extends TaskState {}
final class updateTasksFailsState extends TaskState {}
final class deleteTasksFailsState extends TaskState {}
final class ChangeChekIndex extends TaskState {}