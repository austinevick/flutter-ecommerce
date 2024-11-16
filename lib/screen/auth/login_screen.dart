import 'package:e_commerce_app/common/app_colors.dart';
import 'package:e_commerce_app/common/form_validation.dart';
import 'package:e_commerce_app/common/navigators.dart';
import 'package:e_commerce_app/screen/auth/auth_view_model.dart';
import 'package:e_commerce_app/screen/auth/register_screen.dart';
import 'package:e_commerce_app/screen/widget/custom_button.dart';
import 'package:e_commerce_app/screen/widget/custom_text.dart';
import 'package:e_commerce_app/screen/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool obscureText = true;
  void toggleText() => setState(() => obscureText = !obscureText);
  Widget buildIcon() => IconButton(
      onPressed: () => toggleText(),
      icon: Icon(
        obscureText ? Icons.visibility_off_outlined : Icons.visibility,
      ));

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final provider = ref.watch(authViewModel);
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText('Login',
                        fontWeight: FontWeight.bold, fontSize: 25),
                    const SizedBox(height: 100),
                    CustomTextfield(
                      controller: email,
                      hintText: 'Email',
                      validator: (value) => validateEmail(value!),
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    CustomTextfield(
                      controller: password,
                      hintText: 'Password',
                      obscureText: obscureText,
                      suffixIcon: buildIcon(),
                      validator: (value) =>
                          value!.isEmpty ? 'Field is required' : null,
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      isLoading: provider.isLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          provider.login(email.text, password.text);
                        }
                      },
                      child: ButtonLoader(
                          isLoading: provider.isLoading, text: 'LOGIN'),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      onPressed: () => push(const RegisterScreen()),
                      width: null,
                      height: null,
                      color: Colors.transparent,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            'Don\'t have an account?',
                            paddingRight: 4,
                          ),
                          CustomText(
                            'register',
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
    });
  }
}
