part of 'tweet_bloc.dart';

@immutable
sealed class TweetState {}

final class TweetInitial extends TweetState {}

class TweetLoadingState extends TweetState{}

class TweetErrorState extends TweetState{
  final String message;
  TweetErrorState(this.message);
}
class TweetSuccessState extends TweetState{
  
}