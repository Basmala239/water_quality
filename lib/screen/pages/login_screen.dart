// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';
import 'package:water_quality/model/account_model.dart';
import 'package:water_quality/screen/colors.dart';
import 'package:water_quality/screen/pages/home_layout.dart';
import 'package:water_quality/screen/widget/account_widget.dart';
import '../../controller/provider/account_provider.dart';
import '../size_config.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  List <QueryDocumentSnapshot>data=[];
  addToList(){
    Provider.of<AccountProvider>(context,listen: false).emptyAll();
    for(int i=0;i<data.length;i++){
        AccountModel acc=AccountModel(data[i]['email'], data[i]['jobTitle'], data[i]['firstName'], data[i]['lastName'], data[i]['image'], data[i]['address'], data[i]['contactNumber'], data[i]['city'], data[i]['state'], data[i]['password'], data[i]['ind'], data[i]['haveNotification'], data[i]['lastVisit']);
        AccountModel.accountMap[data[i]['email']]=acc;
        AccountModel.accountList.add(data[i]['email']);
        AccountModel.userDocumentId[data[i]['email']]=data[i].id;
        if(data[i]['lastVisit']==true){
        Provider.of<AccountProvider>(context,listen: false).addAccount(data[i]['email']);
    }}
  }
  getUsers()async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("users").get();
    data.addAll(querySnapshot.docs);
    addToList();
  }
  @override
  void initState() {
    getUsers();
    super.initState();

  }
  final userName = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: 
    SingleChildScrollView(child: 
    Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: 
        Column(
          children: [
            Container(
              width: 1440*SizeConfig.horizontalBlock,
              height: 450*SizeConfig.verticalBlock,
              color: MyColor.blueB3,
              child:  Padding(
                padding: const EdgeInsets.only(left:20.0,top: 118),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sign into',
                    style: TextStyle(
                      fontSize: 34*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                      fontWeight: FontWeight.w600,
                      fontFamily: AssetsManager.font,
                      color: MyColor.white
                    ),),
                    Text('Water Quality control system',
                    style: TextStyle(
                      fontSize: 24*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                      fontWeight: FontWeight.w400,
                      fontFamily: AssetsManager.font,
                      color: MyColor.white
                    ),),
                    SizedBox(height: 20*SizeConfig.verticalBlock,),
                    Text('DIGITAL SYSTEM TO AUTOMATE\nTHE WATER QUALITY CONTROL\nMANAGEMENT',
                    style: TextStyle(
                      fontSize: 20*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                      fontWeight: FontWeight.w300,
                      fontFamily: AssetsManager.font,
                      color: MyColor.white
                    ),),
                  ],
                ),
              ),
            ),
            Container(
              width: 1440*SizeConfig.horizontalBlock,
              height: 450*SizeConfig.verticalBlock,
              color: MyColor.white,
              child: Padding(
                padding: const EdgeInsets.only(top:65,left: 73),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login as',
                    style: TextStyle(
                      color: MyColor.black,
                      fontFamily: AssetsManager.font,
                      fontSize: 16*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                      fontWeight: FontWeight.w400
                    ),),
                    SizedBox(height: 20*SizeConfig.verticalBlock,),
                    SizedBox(
                      height: 164,
                      width: 321,
                      child: GridView.builder(
                        shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      mainAxisSpacing: 8.0, 
                      crossAxisSpacing: 8.0, 
                      ),
                      padding: const EdgeInsets.all(8.0), 
                      itemCount: Provider.of<AccountProvider>(context).lastAccount.length, 
                      itemBuilder: (context, index)=>accountWidget(Provider.of<AccountProvider>(context).lastAccount[index],context)
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        )),
        Positioned(
          top: 70*SizeConfig.verticalBlock,
          left: 406*SizeConfig.horizontalBlock,
          right: 10*SizeConfig.horizontalBlock,
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 389*SizeConfig.horizontalBlock,
              height: 391*SizeConfig.verticalBlock,
              child: Image.asset(AssetsManager.appImage,fit: BoxFit.fill,),
            ),
            Container(
              width: 593.56*SizeConfig.horizontalBlock,
              height: 776*SizeConfig.verticalBlock,
              decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius:const BorderRadius.only( topRight: Radius.circular(40),bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40),),
                boxShadow: [
                  BoxShadow(
                    
                    color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset:const Offset(20, 20),
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 63,right: 68,top: 63),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      children: [
                        Text('Welcome to ',
                        style: TextStyle(
                          fontFamily: AssetsManager.font,
                          color: MyColor.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 21*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                        ),),
                        Text('Water world',
                        style: TextStyle(
                          fontFamily: AssetsManager.font,
                          color: MyColor.blueB3,
                          fontWeight: FontWeight.w600,
                          fontSize: 21*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                        ),),
                      ],
                    ),

                    SizedBox(height: 10*SizeConfig.verticalBlock,),
                    Text('Sign in',
                        style: TextStyle(
                          fontFamily: AssetsManager.font,
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 55*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                        ),),
                    SizedBox(height: 36*SizeConfig.verticalBlock,),
                     Text('"Ensuring Purity, Preserving Health: Our \nCommitment to Water Quality Excellence"',
                        style: TextStyle(
                          fontFamily: AssetsManager.font,
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 22*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                        ),),
                    SizedBox(height: 50*SizeConfig.verticalBlock,),
                    Text('Enter your username or email address',
                        style: TextStyle(
                          fontFamily: AssetsManager.font,
                          color: MyColor.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                        ),),
                    SizedBox(height: 10*SizeConfig.verticalBlock,),
                     Material(  child:
                      SizedBox(
                        height: 60*SizeConfig.verticalBlock,
                        width: 496*SizeConfig.horizontalBlock,
                        child: TextField(
                          controller: userName,
                          decoration: InputDecoration(
                            hintText: 'Username or email address',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14*SizeConfig.horizontalBlock,
                              color: MyColor.grayAD
                            )
                          ),
                        ),
                      ),),
                      Text(Provider.of<AccountProvider>(context).userNameError,style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),),
                    SizedBox(height: 30*SizeConfig.verticalBlock,),
                    Text('Enter your Password',
                        style: TextStyle(
                          fontFamily: AssetsManager.font,
                          color: MyColor.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                        ),),
                    SizedBox(height: 10*SizeConfig.verticalBlock,),
                     Material(  child:
                      SizedBox(
                        height: 60*SizeConfig.verticalBlock,
                        width: 496*SizeConfig.horizontalBlock,
                        child: TextField(
                          controller: password,
                          obscureText: Provider.of<AccountProvider>(context).hidePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14*SizeConfig.horizontalBlock,
                              color: MyColor.grayAD,
                            ),
                            suffixIcon:IconButton(
                              onPressed: (){
                                Provider.of<AccountProvider>(context,listen: false).showPassword();
                              }, 
                            icon: Provider.of<AccountProvider>(context).hidePassword?const  Icon(Icons.visibility_outlined):const Icon(Icons.visibility_off_outlined))
                          ),
                        ),
                      ),),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(Provider.of<AccountProvider>(context).passwordError,style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),),
                            const Spacer(),
                            TextButton(
                              onPressed: (){
                        
                              },
                              child: Text('Forgot Password  ',
                              style: TextStyle(
                                color: MyColor.blueF4,
                                fontSize: 13*SizeConfig.horizontalBlock*SizeConfig.verticalBlock,
                                fontWeight: FontWeight.w400,
                                fontFamily: AssetsManager.font
                              ),
                              
                              ))
                          ],
                        ),
                      ),
                      SizedBox(height: 30*SizeConfig.verticalBlock,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          SizedBox(
                            width: 400*SizeConfig.horizontalBlock*SizeConfig.horizontalBlock,
                            height: 56*SizeConfig.verticalBlock,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(MyColor.blueB3)
                              ),
                              child: Text('Sign in',
                              style: TextStyle(
                                color: MyColor.white,
                                fontSize:20*SizeConfig.verticalBlock,
                                fontFamily: AssetsManager.font,
                          
                              ),),
                              onPressed: (){
                                if(AccountModel.accountMap[userName.text]==null){
                                  Provider.of<AccountProvider>(context,listen: false).errorUserName();
                                }else if(AccountModel.accountMap[userName.text]?.password != password.text){
                                    Provider.of<AccountProvider>(context,listen: false).errorPassword();
                                }else{
                                  Provider.of<AccountProvider>(context,listen: false).addAccount(userName.text);
                                  Navigator.push(context, MaterialPageRoute(builder:(context)=> HomeLayout()));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            )
            
          ],
        ))
      ]
    )),
    );
  }
}