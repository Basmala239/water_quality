import 'package:water_quality/controller/assets_manager/assets_manager.dart';

class AccountModel{
  String email;
  String jobTitle;
  String firstName;
  String lastName;
  String image;
  String address;
  String contactNumber;
  String city;
  String state;
  String password;
  int ind;
  bool haveNotification=false;
  AccountModel(this.email,this.jobTitle,this.firstName,this.lastName, this.image, this.address, this. contactNumber, this.city, this.state, this.password,this.ind,this.haveNotification);
  static Map<String,AccountModel>accountMap={
    'ahmed1@gmail.com':  AccountModel('ahmed1@gmail.com','Chemist','Ahmed', 'Mohmaed',AssetsManager.ahmed1Image , 'Alex', '01234895874', 'Alex', 'Eypet', 'ahmed1',0,false),
    'ana1@gmail.com':    AccountModel('ana1@gmail.com','Operating Techinician','Ana', 'Bob',AssetsManager.ana1Image , 'Paris', '123-458-74', 'Paris', 'france', 'ana1',1,false),
    'hassan1@gmail.com': AccountModel('hassan1@gmail.com',"IT Depertment",'Hassan', 'Amer',AssetsManager.ahmed1Image , 'Dubai', '458-743-478', 'Dubai', 'Emirates', 'hassan1',2,false),
    'mohamed1@gmail.com':AccountModel('mohamed1@gmail.com',"Lab Technicion",'Mohamed', 'Ahmed',AssetsManager.mohamed1Image , 'Alex', '01220155581', 'Alex', 'Eypet', 'mohamed1',3,false),
    'sabah1@gmail.com':  AccountModel('sabah1@gmail.com',"Engineer",'Sabah', 'Ahmed',AssetsManager.sabah1Image , 'Alex', '01255345874', 'Alex', 'Eypet', 'sabah1',4,false),
  };
  static List<String>accountList=[
    'ahmed1@gmail.com', 
    'ana1@gmail.com',
    'hassan1@gmail.com', 
    'mohamed1@gmail.com',
    'sabah1@gmail.com'  
  ]; 
  static String currentUser= 'ahmed1@gmail.com';
}