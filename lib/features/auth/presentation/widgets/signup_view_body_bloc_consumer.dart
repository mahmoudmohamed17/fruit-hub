import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/build_snack_bar.dart';
import 'package:fruit_hub/core/widgets/custom_progress_indicator.dart';
import 'package:fruit_hub/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          buildSnackBar(context, 'تم إنشاء الحساب بنجاح!');
          Navigator.of(context).pop();
        }
        if (state is SignupFailure) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
            isLoading: state is SignupLoading,
            child: const SignupViewBody());
      },
    );
  }
}
