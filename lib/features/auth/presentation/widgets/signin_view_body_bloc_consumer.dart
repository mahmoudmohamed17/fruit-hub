import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/build_snack_bar.dart';
import 'package:fruit_hub/core/widgets/custom_progress_indicator.dart';
import 'package:fruit_hub/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          buildSnackBar(context, 'تم تسجيل الدخول بنجاح!');
        }
        if (state is SigninFailure) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
            isLoading: state is SigninLoading, child: const SigninViewBody());
      },
    );
  }
}
