import 'dart:convert';

import  'package:http/http.dart' as http;

import 'model.dart';
class UserApi{

  // bool is access to site. when internet connection fail , return false 
 static  Future<(bool,User?)> signUp(String name,String email,String pass) async{
   try{
     final response = await http.post(Uri.parse('https://www.starcoder.ir/add_user.php'),body: {
      'name':name,
      'email':email,
      'pass':pass
    });
    Map<String,dynamic> json = jsonDecode(response.body) as Map<String,dynamic>;
    if(json['status']=='ok')return (true,User.fromJson(json));
    return (true,null);
   } on Exception catch(ex){
     return (false,null);
   }
  }


    // String is status.
 static  Future<(String,User?)> signIn(String email,String pass) async{
   try{
     final response = await http.post(Uri.parse('https://www.starcoder.ir/loggin.php'),body: {
      'email':email,
      'pass':pass
    });
    Map<String,dynamic> json = jsonDecode(response.body) as Map<String,dynamic>;
    if(json['status']=='ok')return ('ok',User.fromJson(json));
    return (json['status'] as String,null);
   } on Exception catch(ex){
     return ('',null);
   }
  }
}