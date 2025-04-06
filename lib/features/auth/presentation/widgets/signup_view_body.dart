import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/func/build_snack_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/ask_about_account_widget.dart';
import 'package:fruit_hub/core/widgets/custom_password_field.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/terms_and_conditions_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String email, name, password;
  bool isTermsAccepted = false;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                hintText: 'الاسم',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(
                height: 16,
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
              TermsAndConditionsWidget(
                onTermsAccepted: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  title: 'إنشاء حساب جديد',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (isTermsAccepted) {
                        context
                            .read<SignupCubit>()
                            .signUp(email, password, name);
                      } else {
                        buildSnackBar(context, 'الرجاء قبول الشروط والأحكام.');
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
              const SizedBox(
                height: 26,
              ),
              AskAboutAcountWidget(
                questionText: 'تمتلك حساب بالفعل؟',
                orderText: 'تسجيل دخول',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
