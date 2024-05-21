import 'package:water_quality/controller/assets_manager/assets_manager.dart';

class TaskModel{
  String iconPath;
  String description;
  String date;
  bool fav;
  TaskModel(this.iconPath,this.description,this.date,this.fav);
  static List<TaskModel>taskList=[
    TaskModel(AssetsManager.reportIcon,'Daily Report 1','Jan 18 at 5:00 pm ',false),
    TaskModel(AssetsManager.clockImage,'Attend the meeting','Jan 18 at 6:00 pm ',true),
    TaskModel(AssetsManager.cardImage,'Send Monthly Report','Jan 18 at 1:00 pm ',false),
    TaskModel(AssetsManager.reportIcon,'Daily Report 2','Jan 18 at 2:00 pm ',true),
    TaskModel(AssetsManager.bookImage,'Train   new internships','Jan 18 at 7:00 pm ',false),
  ];
}