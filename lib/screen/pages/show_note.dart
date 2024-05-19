import 'package:flutter/material.dart';
import 'package:water_quality/model/notification_model.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen(this.note,{super.key});
  final NotificationModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.centerRight,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
           boxShadow: [
              BoxShadow(
                color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset:const Offset(4,4),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(children: [
              Row(
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
                    child: Image.asset(note.imagePath, fit: BoxFit.cover),
                  ),
                ),
                ),
                const SizedBox(width: 10,),
                Text(note.name,style:
                  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                ))
                ],
              ),
              const SizedBox(height: 10,),
              Text(note.description)
            ]),
          ),
        ),
      ),
    ) ;
  }
}