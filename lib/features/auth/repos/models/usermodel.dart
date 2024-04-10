// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class UserModel {
  final String uid;
  final List<String> tweets;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime createdAt;
  const UserModel({
    required this.uid,
    required this.tweets,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createdAt
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'tweets': tweets,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
   return UserModel(
      uid: map['uid']?? '',
      tweets: List<String>.from(map['tweets'] as List<dynamic>),
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      createdAt: DateTime.fromMicrosecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
