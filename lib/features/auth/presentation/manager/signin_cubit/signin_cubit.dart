import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;
  SigninCubit(this.authRepo) : super(SigninInitial());
  Future<void> signIn(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signIn(email, password);
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold((failure) {
      emit(SigninFailure(message: failure.message));
    }, (userEnity) {
      emit(SigninSuccess(userEntity: userEnity));
    });
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold((failure) {
      emit(SigninFailure(message: failure.message));
    }, (userEnity) {
      emit(SigninSuccess(userEntity: userEnity));
    });
  }
}
