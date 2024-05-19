
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:water_quality/model/account_model.dart';
// import 'firebase_potions.dart';

// void main() async {
//     WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AddUser(),
//     );
//   }
// }
// class AddUser extends StatelessWidget {
//   AddUser({super.key});
//   CollectionReference experiment = FirebaseFirestore.instance.collection('experiment'); 
//     Future<void> addExpirement(String ele) {
//                     return experiment
//                         .add({
//                           'email': AccountModel.accountMap[ele]!.email,
//                           'jobTitle':  AccountModel.accountMap[ele]!.jobTitle,
//                           'firstName':  AccountModel.accountMap[ele]!.firstName,
//                           'lastName': AccountModel.accountMap[ele]!.lastName,
//                           'image': AccountModel.accountMap[ele]!.image ,
//                           'address': AccountModel.accountMap[ele]!.address,
//                           'contactNumber': AccountModel.accountMap[ele]!.contactNumber,
//                           'city': AccountModel.accountMap[ele]!.city,
//                           'state': AccountModel.accountMap[ele]!.state,
//                           'password':  AccountModel.accountMap[ele]!.password,
//                           'ind':  AccountModel.accountMap[ele]!.ind
//                         })
//                         .then((value) => print("User Added"))
//                         .catchError((error) => print("Failed to add user: $error"));
//                   }
                      
                    
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//       padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 15 ),
//       child: SizedBox(
//         height: double.infinity,
//         child:SingleChildScrollView(child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               children: [
                
//                 SizedBox(
//                   width: 180,
//                   height: 50,
//                   child: ElevatedButton(onPressed: (){
//                     for (var ele in AccountModel.accountList) {
                      
//                     print(ele);
//                     addExpirement(ele);
                    
//                   }}, 
//                   child:  Text('Save'))
//                   ),
                
//               ],
//             ),
//             const SizedBox(height: 5,),
//           ],
//         )),
//       ),
//     ));
//   }
// }