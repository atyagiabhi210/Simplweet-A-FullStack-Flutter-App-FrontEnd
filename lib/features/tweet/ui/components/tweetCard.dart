import 'package:flutter/material.dart';
import 'package:flutter_fs_project/features/tweet/models/tweet_model.dart';

class TweetCard extends StatelessWidget {
  TweetModel tweetModel;
 // UserModel userModel;

  TweetCard({super.key, required this.tweetModel, });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      padding:const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius:const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2)),
      child: Column(
        children: [
         const SizedBox(
            height: 2,
          ),
          Row(
            children: [
                  const Icon(Icons.person),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
              
                  Text("firstName"),
                 const SizedBox(
                    width: 20,
                  ),
                  Text(tweetModel.createdAt.toString())
                ],
              ),
            ],
          ),
         const Divider(
            color: Colors.black,
          ),
          Padding(
            padding:const EdgeInsets.fromLTRB(5, 2, 5, 2),
            child: Text(
             tweetModel.content,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
