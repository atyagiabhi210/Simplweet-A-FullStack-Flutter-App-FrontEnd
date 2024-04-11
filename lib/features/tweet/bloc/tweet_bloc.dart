import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fs_project/features/tweet/repos/tweet_repo.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'tweet_event.dart';
part 'tweet_state.dart';

class TweetBloc extends Bloc<TweetEvent, TweetState> {

  TweetBloc() : super(TweetInitial()) {
    on<PostTweetEvent>(postTweetEvent);
    on<TweetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  FutureOr postTweetEvent(PostTweetEvent event, Emitter<TweetState> emit) async{
    emit(TweetLoadingState());
    final String adminId=FirebaseAuth.instance.currentUser?.uid ?? '';
    try{
      emit(TweetLoadingState());
      final String tweetId= Uuid().v4();
      
      TweetRepo.postTweet(
        tweetId,
        event.content,
        DateTime.now().toIso8601String(),
        adminId

      );
      log(adminId);
      log("Tweet created in db");
      emit(TweetSuccessState());
    }
    catch(e){
      log(e.toString());
      emit(TweetErrorState(e.toString()));
    }
  }
}
