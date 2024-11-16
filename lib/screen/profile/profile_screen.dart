import 'package:e_commerce_app/common/app_colors.dart';
import 'package:e_commerce_app/common/navigators.dart';
import 'package:e_commerce_app/preferenceManager/preference_manager.dart';
import 'package:e_commerce_app/screen/auth/login_screen.dart';
import 'package:e_commerce_app/screen/widget/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String email = '';

  void initData() async {
    final name = await PreferenceManager.getUserName();
    final email = await PreferenceManager.getUserEmail();
    setState(() {
      this.email = email;
      this.name = name;
    });
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () => PreferenceManager.delete()
                  .whenComplete(() => pushAndRemoveUntil(const LoginScreen())),
              icon: const CustomText(
                'Logout',
                color: AppColors.primaryColor,
              ))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 35),
            ),
            CustomText(name, paddingTop: 20, fontSize: 25),
            CustomText(email, paddingTop: 20)
          ],
        ),
      )),
    );
  }
}
