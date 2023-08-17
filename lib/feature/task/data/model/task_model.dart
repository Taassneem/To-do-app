
class TaskModel {
  final int? id;
  final String title;
  final String note;
  final String endTime;
  final String startTime;
  final String date;
  final int isComplete;
  final int color;
  TaskModel(
      {required this.date,  this.id,
      required this.note,
      required this.title,
      required this.endTime,
      required this.startTime,
      required this.isComplete,
      required this.color});
      // ignore: non_constant_identifier_names
      
}
