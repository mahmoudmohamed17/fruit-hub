import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> signUp({required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException in sign up ${e.toString()} And code ${e.code}.');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'الحساب موجود بالفعل حاول ايجاد حساب آخر.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالإنترنت الرجاء التحقق من الاتصال.');
      } else {
        throw CustomException(message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى.');
      }
    } catch (e) {
      log('FirebaseAuthException in sign up ${e.toString()}');
      throw CustomException(message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى.');
    }
  }

  Future<User> signIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException in sign in ${e.toString()} And code ${e.code}.');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'البريد الإلكتروني او الرقم السرى غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'البريد الإلكتروني او الرقم السرى غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'لا يوجد اتصال بالإنترنت الرجاء التحقق من الاتصال.');
      } else {
        throw CustomException(message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى.');
      }
    } catch (e) {
      log('FirebaseAuthException in sign in ${e.toString()}');
      throw CustomException(message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return (FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((value) => value.user!));
  }
}
