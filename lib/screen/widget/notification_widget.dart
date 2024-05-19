import 'package:flutter/material.dart';

import '../../model/notification_model.dart';

Widget notificationWidget(NotificationModel notification,Function delete,Function navigator){
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: GestureDetector(
      onTap: (){
        
        navigator();
      },
      child: Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        border:const  Border(bottom: BorderSide(color: Color(0xFF595959),width: 1)),
        color: notification.read?Colors.white:const Color.fromARGB(255, 121, 192, 244),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)
              ),
              child: ClipOval(
              child: SizedBox.fromSize(
                size:  const Size.fromRadius(100), // Image radius
                child: Image.asset(notification.imagePath, fit: BoxFit.cover),
              ),
            ),
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Text(notification.name,style:
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16
                ) ,),
                Text(notification.description,style:
                const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Color(0xFF595959),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ) ,),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text(notification.time,style:
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14
                ) ,),
                IconButton(onPressed:() {delete();}
                , icon: const Icon(Icons.delete_outline))
              ],
            )
          ],
        ),
      ),
    )),
  );
}