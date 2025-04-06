import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/custom_exception.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  // we are injecting the firebaseAuthService here
  // dependency injection is a design pattern that allows us to remove the hard-coded dependencies and make our application loosely coupled
  AuthRepoImpl(this.firebaseAuthService);
  @override
  Future<Either<Failure, UserEntity>> signUp(
      String email, String password, String name) async {
    try {
      var user =
          await firebaseAuthService.signUp(email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Eexception in sign up ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما الرجاء المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signIn(email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Eexception in sign in ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما الرجاء المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Eexception in signInWithGoogle ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما الرجاء المحاولة مرة أخرى'));
    }
  }
}
