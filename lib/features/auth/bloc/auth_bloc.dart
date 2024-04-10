import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fs_project/features/auth/repos/auth_repo.dart';
import 'package:flutter_fs_project/features/auth/repos/models/usermodel.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthSignUpEvent>(authSignUpEvent);
    on<AuthSignInEvent>(authSignInEvent);
    on<AuthEvent>((event, emit) {});
  }
  FutureOr authSignUpEvent(
      AuthSignUpEvent event, Emitter<AuthState> emit) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    print('AuthSignUpEvent Invoked');

    emit(AuthLoadingState());

    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      print('User created: ${user.user!.email}');

      /*final String base_url = constants.Base_URL;
      try {
        final userCreated = await dio.post("https://flutter-fs-backend.onrender.com/api/v1/user", data: {
        "uid": auth.currentUser!.uid,
        "tweets": [],
        "firstName": event.firstName,
        "lastName": event.lastName,
        "email": event.email,
        "createdAt": DateTime.now().toString()
      });
      
      print(userCreated.data.toString());
      } catch (e) {
       
        print("error ${e.toString()}");
        emit(AuthErrorState(message: e.toString()));
      }
      */
      if (user != null) {
        try {
          AuthRepo.createUserRepo(UserModel(
            uid: user.user?.uid ?? '',
            tweets: [],
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            createdAt: DateTime.now()));
            print('User created in DB');
           emit(UserCreatedSuccessState());
        } catch (e) {
          log(e.toString());
          emit(AuthErrorState(message: e.toString()));
        }
        
      }
      else{
        emit(AuthErrorState(message: "User not created"));
        
      }
     
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  FutureOr authSignInEvent(
      AuthSignInEvent event, Emitter<AuthState> emit) async {
    print("Sign In Invoked");
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);

      print('User signed in: ${user.user!.email}');
      if (user != null) {
        UserModel? userModel = await AuthRepo.getUserRepo(user.user!.uid);
        if (userModel != null) {
          print('UserModel: ${userModel.email}');
        }
        else{
          emit(AuthErrorState(message: "User not found"));
        }
      }
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }
}
