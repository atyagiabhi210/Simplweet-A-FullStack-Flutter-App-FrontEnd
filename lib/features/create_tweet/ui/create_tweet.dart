import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fs_project/features/tweet/bloc/tweet_bloc.dart';


class CreateTweetPage extends StatefulWidget {
  @override
  State<CreateTweetPage> createState() {
    // TODO: implement createState
    return _CreateTweetPageState();
  }
}

class _CreateTweetPageState extends State<CreateTweetPage> {
  TweetBloc tweetBloc = TweetBloc();
  TextEditingController tweetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<TweetBloc, TweetState>(
      bloc: tweetBloc,

      listener: (context, state) {
        if(state is TweetSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Tweet posted successfully'),
          ));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case TweetInitial:
          return TweetModalSheet(tweetBloc: tweetBloc, tweetController: tweetController);
            
          case TweetLoadingState:
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            )
          );
          case TweetErrorState:
          return Scaffold(
            body: Center(
              child: Text('Error'),
            )
          ); 
          default:
          return TweetModalSheet(tweetBloc: tweetBloc, tweetController: tweetController);
        }
        
      },
    );
  }
}

class TweetModalSheet extends StatelessWidget {
  const TweetModalSheet({
    super.key,
    required this.tweetBloc,
    required this.tweetController,
  });

  final TweetBloc tweetBloc;
  final TextEditingController tweetController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Post your Simplweet here!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: tweetController,
                  minLines: 1,
                  maxLines: 30,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      focusColor: Colors.yellowAccent,
                      hintText: 'What\'s on your mind?',
                      border: //InputBorder.none
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              FloatingActionButton(
                backgroundColor: Colors.yellowAccent,
                onPressed: () {
                  log('Post Tweet Event Invoked');
                  log(tweetController.text);
                  tweetBloc.add(PostTweetEvent(tweetController.text));
                  tweetController.clear();
                },
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          )),
    );
  }
}
