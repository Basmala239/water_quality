
class NotificationModel{
  int id;
  String imagePath;
  String name;
  String time;
  String description;
  String type;
  bool read;
  NotificationModel(this.id,this.imagePath,this.name,this.time,this.description,this.read,this.type);
  
}
class NotificationData{
  static Map<int,List<NotificationModel>>notificationLast={
    0:[],
    1:[],
    2:[],
    3:[],
    4:[

    ],
  };
}