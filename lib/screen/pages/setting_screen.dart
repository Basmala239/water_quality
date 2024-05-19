import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/controller/provider/account_provider.dart';
import 'package:water_quality/model/account_model.dart';
import 'package:water_quality/screen/colors.dart';

import '../../controller/provider/setting_provider.dart';
import '../size_config.dart';
class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final String user=AccountModel.currentUser;
  final bool hidePassword=true;
  final bool hideEmail=true;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final contactNumber = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 15*SizeConfig.horizontalBlock ),
      child: SizedBox(
        width: 800*SizeConfig.horizontalBlock,
        height: double.infinity,
        child:SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
        
                Icon(Icons.edit_outlined,size:45*SizeConfig.horizontalBlock ,),
                Text('Edit profile',
                style: TextStyle(
                  fontSize: 45*SizeConfig.horizontalBlock,
                  fontWeight: FontWeight.w600,
                ),),
                const Spacer(),
                SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipOval(
                    child: SizedBox.fromSize(
                      size:  const Size.fromRadius(100), // Image radius
                      child: Image.asset(AccountModel.accountMap[user]!.image, fit: BoxFit.cover),
                    ),
                 ),
                 ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Name',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const SizedBox(height: 5,),
                    Material(  child:
                        SizedBox(
                          
                          width: 355*SizeConfig.horizontalBlock,
                          child: TextField(
                            controller:firstName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              hintText:Provider.of<SettingProvider>(context).fristNameHint,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24*SizeConfig.horizontalBlock,
                                color: MyColor.grayAD
                              )
                            ),
                          ),
                        ),),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Last Name',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const SizedBox(height: 5,),
                    Material(  child:
                        SizedBox(
                          width: 355*SizeConfig.horizontalBlock,
                          child: TextField(
                            controller:lastName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              hintText: Provider.of<SettingProvider>(context).lastNameHint,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24*SizeConfig.horizontalBlock,
                                color: MyColor.grayAD
                              )
                            ),
                          ),
                        ),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const SizedBox(height: 5,),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 800*SizeConfig.horizontalBlock,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(user,style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24*SizeConfig.horizontalBlock,
                                  color: MyColor.grayAD
                                ),),
                      ),
                    )
                    
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const SizedBox(height: 5,),
                    Material(  child:
                        SizedBox(
                          width: 800*SizeConfig.horizontalBlock,
                          child: TextField(
                            controller:address,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              hintText: Provider.of<SettingProvider>(context).addressHint,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24*SizeConfig.horizontalBlock,
                                color: MyColor.grayAD
                              )
                            ),
                          ),
                        ),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contact Number',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const SizedBox(height: 5,),
                    Material(  child:
                        SizedBox(
                          width: 800*SizeConfig.horizontalBlock,
                          child: TextField(
                            controller:contactNumber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              hintText: Provider.of<SettingProvider>(context).contactHint,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24*SizeConfig.horizontalBlock,
                                color: MyColor.grayAD,
                                
                              ),
                              
                            ),
                          ),
                        ),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('City',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const SizedBox(height: 5,),
                    Material(  child:
                        SizedBox(
                          width: 355*SizeConfig.horizontalBlock,
                          child: TextField(
                            controller:city,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              hintText:Provider.of<SettingProvider>(context).cityHint,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24*SizeConfig.horizontalBlock,
                                color: MyColor.grayAD
                              )
                            ),
                          ),
                        ),),
                  ],
                ),Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('State',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const SizedBox(height: 5,),
                    Material(  child:
                        SizedBox(
                          width: 355*SizeConfig.horizontalBlock,
                          child: TextField(
                            controller:state,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              hintText: Provider.of<SettingProvider>(context).stateHint,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24*SizeConfig.horizontalBlock,
                                color: MyColor.grayAD
                              )
                            ),
                          ),
                        ),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const SizedBox(height: 5,),
                    Material(  child:
                        SizedBox(
                          width: 800*SizeConfig.horizontalBlock,
                          child: TextField(
                            controller:password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              hintText: Provider.of<SettingProvider>(context).passwordHint,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24*SizeConfig.horizontalBlock,
                                color: MyColor.grayAD
                              ),
                           
                            ),
                          ),
                        ),),
                  ],
                ),],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 181,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color:MyColor.blueB3 ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: SizedBox(
                    width: 180,
                    height: 50,
                    child: ElevatedButton(onPressed: (){
                      firstName.text='';
                      lastName.text='';
                      address.text='';
                      city.text='';
                      contactNumber.text='';
                      state.text='';
                      password.text='';

                    }, 
                    child:  Text('Cancel',
                    style: TextStyle(
                      color: MyColor.blueB3,
                      fontSize: 28*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600
                    ),
                    )))),
                const SizedBox(width: 10,),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                   
                      if(firstName.text.isNotEmpty){
                        Provider.of<SettingProvider>(context,listen: false).changeFirstName(firstName.text);
                        firstName.text='';
                        Provider.of<AccountProvider>(context,listen: false).addAccount(user);
                      }
                      if(lastName.text.isNotEmpty){
                        Provider.of<SettingProvider>(context,listen: false).changeLastName(lastName.text);
                        lastName.text='';
                        Provider.of<AccountProvider>(context,listen: false).addAccount(user);
                      }
                      if(address.text.isNotEmpty){
                        Provider.of<SettingProvider>(context,listen: false).changeAddress(address.text);
                        address.text='';
                      }
                      if(contactNumber.text.isNotEmpty){
                        Provider.of<SettingProvider>(context,listen: false).changeContactNumber(contactNumber.text);
                        contactNumber.text='';
                      }
                      if(city.text.isNotEmpty){
                        Provider.of<SettingProvider>(context,listen: false).changeCity(city.text);
                        city.text='';
                      }
                      if(state.text.isNotEmpty){
                       Provider.of<SettingProvider>(context,listen: false).changeState(state.text);
                       state.text='';
                      }
                      if(password.text.isNotEmpty){
                        Provider.of<SettingProvider>(context,listen: false).changePassword(password.text);
                        password.text='';
                      }
                    
                    
                  }, 
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyColor.blueB3)
                    ),
                  child:  Text('Save',
                  style: TextStyle(
                      color: MyColor.white,
                      fontSize: 28*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600
                    ),
                  ))
                  ),
                
              ],
            ),
            const SizedBox(height: 5,),
          ],
        )),
      ),
    );
  }
}