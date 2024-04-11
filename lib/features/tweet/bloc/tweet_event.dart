part of 'tweet_bloc.dart';

@immutable
sealed class TweetEvent {}

class PostTweetEvent extends TweetEvent{
  final String content;
  PostTweetEvent(this.content);
}
class GetTweetEvent extends TweetEvent{
  final String userId;
  GetTweetEvent(this.userId);
}
