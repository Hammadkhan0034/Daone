/// This class defines the variables used in the [register_page_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RegisterPageOneModel {
  var uid,fullName,phoneNumber,email;
  String? imageUrl;

  RegisterPageOneModel({this.uid,this.fullName,this.phoneNumber,this.email,this.imageUrl});

  //data from server
factory RegisterPageOneModel.fromMap(map){
 return RegisterPageOneModel(
   uid: map['uid'],
   email: map['email'],
   fullName: map['fullName'],
   phoneNumber: map['phoneNumber'],
   imageUrl: map['imageUrl']

 );
}
//sending data to server
Map<String,dynamic> toMap(){
return{
  'uid' : uid,
  'email' :email,
  'fullName' :fullName,
  'phoneNumber':phoneNumber,
  'imageUrl' :imageUrl
  };
}


}
