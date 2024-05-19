import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';
import 'package:water_quality/model/account_model.dart';
import 'package:water_quality/screen/colors.dart';
import 'package:water_quality/screen/pages/home_layout.dart';

import '../../controller/provider/account_provider.dart';

Widget accountWidget(String user,BuildContext context){
  
  return GestureDetector(
  onTap: () {
    AccountModel.currentUser=user;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
  },
  child:Container(
    height: 164,
    width: 145,
    decoration: BoxDecoration(
      color: MyColor.blueFF,
      borderRadius: BorderRadius.circular(5),
    ),
    
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              
              const Spacer(),
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColor.gray73),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: 
                IconButton(onPressed: (){
                  Provider.of<AccountProvider>(context,listen: false).deleteAccount(user);
                }, icon:  SvgPicture.asset(AssetsManager.cancelIcon,width: 13,height: 13)
              ))
              
            ],
          ),
          ClipOval(
            child: SizedBox.fromSize(
              size:  const Size.fromRadius(48), // Image radius
              child: Image.asset(AccountModel.accountMap[user]!.image, fit: BoxFit.cover),
            ),
          ),
          Text("${AccountModel.accountMap[user]!.firstName} ${AccountModel.accountMap[user]!.lastName}",
          style: const TextStyle(
             overflow: TextOverflow.ellipsis,
            fontFamily: AssetsManager.font,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: MyColor.black
          ),),
        ],
      ),
    ),

  ));
}