import 'package:e_commerce_app/common/form_validation.dart';
import 'package:e_commerce_app/screen/auth/auth_view_model.dart';
import 'package:e_commerce_app/screen/widget/custom_button.dart';
import 'package:e_commerce_app/screen/widget/custom_text.dart';
import 'package:e_commerce_app/screen/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
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
                    const CustomText('REGISTER',
                        fontWeight: FontWeight.bold, fontSize: 25),
                    const SizedBox(height: 100),
                    CustomTextfield(
                      controller: name,
                      hintText: 'Full name',
                      validator: (value) =>
                          value!.isEmpty ? 'Field is required' : null,
                    ),
                    const SizedBox(height: 16),
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
                          provider.register(name.text.trim(), email.text.trim(),
                              password.text);
                        }
                      },
                      child: ButtonLoader(
                          isLoading: provider.isLoading, text: 'REGISTER'),
                    )
                  ],
                ),
              ),
            )),
      );
    });
  }
}
