import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fs_project/features/create_tweet/ui/create_tweet.dart';
import 'package:flutter_fs_project/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_fs_project/features/tweet/models/tweet_model.dart';
import 'package:flutter_fs_project/features/tweet/ui/components/tweetCard.dart';

class Tweets extends StatefulWidget {
  @override
  State<Tweets> createState() {
    return _TweetsState();
  }
}

class _TweetsState extends State<Tweets> {
  List<TweetModel> tweets = [
    TweetModel(
        tweetId: "1",
        content: "OHH YEAHHHH",
        createdAt: DateTime.now(),
        adminId: "Oh"),
    TweetModel(
        tweetId: "2",
        content: "content",
        createdAt: DateTime.now(),
        adminId: "adminId")
  ];
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simplweet'),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Profile'),
                  ));
                },
                icon: Icon(Icons.person)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellowAccent,
        onPressed: () {
          _openTweetModal();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Tweets'),
              ElevatedButton(
                  onPressed: () {
                    try {
                      auth.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => OnboardingScreen()));
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Sign Out')),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: tweets.length,
                itemBuilder: (context, index) {
                  return TweetCard(
                    tweetModel: tweets[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openTweetModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.grey[900],
        enableDrag: true,
        //barrierColor: Colors.yellowAccent,
        context: context,
        builder: (context) {
          return CreateTweetPage();
        });
  }
}
