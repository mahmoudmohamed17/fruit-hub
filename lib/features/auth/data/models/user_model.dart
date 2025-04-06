import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name});
  
  // creating object from user model is also the same as creating object from user entity
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }
}
