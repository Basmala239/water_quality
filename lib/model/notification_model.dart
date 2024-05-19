import 'package:water_quality/controller/assets_manager/assets_manager.dart';

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
    0:[
      NotificationModel(0,AssetsManager.ana1Image,'Ana Bob',"2 min","new Note",false,'note'),
      NotificationModel(1,AssetsManager.ana1Image,'Ana Bob',"2 min","new Report",false,'Report')
    ],
    1:[],
    2:[NotificationModel(0,AssetsManager.ana1Image,'Ana Bob',"2 min","new Note",false,'note'),],
    3:[],
    4:[],
  };
}