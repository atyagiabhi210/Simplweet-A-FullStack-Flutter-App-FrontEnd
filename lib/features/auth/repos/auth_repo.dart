import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_fs_project/constants.dart' as constants;
import 'package:flutter_fs_project/features/auth/repos/models/usermodel.dart';
class AuthRepo{
  //we make these API calls static so that we can call them without creating an instance of the class
  static Future<UserModel?> getUserRepo(String uid) async{
    try {
      Dio dio=Dio();
   final response= await dio.get(constants.Base_URL+"user/$uid");
   if(response.statusCode!>=200&& response.statusCode!<300){
      UserModel userModel= UserModel.fromMap(response.data);
      return userModel;
   }
   else{
      return null;
   }

    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> createUserRepo(UserModel userModel)async{
   
      Dio dio=Dio();
      final response=await dio.post(constants.Base_URL+"user",
      data: userModel.toMap());
     if(response.statusCode!>=200&& response.statusCode!<300){
       return true;
     } else{
      return false;
     }
    
  }
}