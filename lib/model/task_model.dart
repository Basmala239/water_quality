class TaskModel{
  String iconPath;
  String description;
  String date;
  bool fav;
  bool done;
  TaskModel(this.iconPath,this.description,this.date,this.fav,this.done);
  static Map<int,List<TaskModel>>taskList={
    0:[],
    1:[],
    2:[],
    3:[],
    4:[],
  };
}