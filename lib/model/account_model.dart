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
  bool lastVisit=false;
  AccountModel(this.email,this.jobTitle,this.firstName,this.lastName, this.image, this.address, this. contactNumber, this.city, this.state, this.password,this.ind,this.haveNotification,this.lastVisit);
  static Map<String,AccountModel>accountMap={};
  static List<String>accountList=[]; 
  static String currentUser= 'ahmed1@gmail.com';
  static Map<String,String> userDocumentId= {};
}