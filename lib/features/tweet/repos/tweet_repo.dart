import 'package:dio/dio.dart';
import 'package:flutter_fs_project/features/tweet/models/tweet_model.dart';
import 'package:flutter_fs_project/constants.dart' as constants;
class TweetRepo{
  static Future<bool> postTweet(String tweetId, String content, String createdAt, String adminId) async{
    Dio dio=Dio();
    final response= await dio.post(constants.Base_URL+"tweet",
    data: {
      "tweetId":tweetId,
      "content":content,
      "createdAt":createdAt,
      "adminId":adminId
    });
    if(response.statusCode!>=200 && response.statusCode!<=300){
      return true;
    }
    else{
      return false;
    }
  }

}