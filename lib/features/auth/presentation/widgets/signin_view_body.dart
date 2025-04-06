import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_password_field.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/signup_view.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/ask_about_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final formKey = GlobalKey<FormState>();
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('نسيت كلمة المرور؟',
                      style: AppStyles.semiBold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                      )),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                title: 'تسجيل دخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signIn(email, password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              AskAboutAcountWidget(
                questionText: 'لا تمتلك حساب؟',
                orderText: 'قم بإنشاء حساب',
                onTap: () {
                  Navigator.pushNamed(context, SignupView.routeName);
                },
              ),
              const SizedBox(
                height: 32,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  // to avoid calling the function if the widget is not mounted
                  if (context.mounted) {
                    context.read<SigninCubit>().signInWithGoogle();
                  }
                },
                label: 'تسجيل بواسطة جوجل',
                icon: Assets.imagesGoogle,
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                label: 'تسجيل بواسطة أبل',
                icon: Assets.imagesApple,
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  if (context.mounted) {
                    context.read<SigninCubit>().signInWithFacebook();
                  }
                },
                label: 'تسجيل بواسطة فيسبوك',
                icon: Assets.imagesFacebook,
              ),
              const SizedBox(
                height: 85,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
