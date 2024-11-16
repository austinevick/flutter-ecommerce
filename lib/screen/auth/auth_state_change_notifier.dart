import 'package:e_commerce_app/screen/auth/login_screen.dart';
import 'package:e_commerce_app/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../preferenceManager/preference_manager.dart';

final emailProvider = FutureProvider((ref) => ref.watch(userEmailProvider));

class AuthStateChangeNotifier extends StatelessWidget {
  const AuthStateChangeNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
          body: ref.watch(emailProvider).when(
              data: (data) => data.isEmpty ? LoginScreen() : const HomeScreen(),
              error: (e, t) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink()));
    });
  }
}
