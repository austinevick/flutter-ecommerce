import 'package:e_commerce_app/common/app_colors.dart';
import 'package:e_commerce_app/common/navigators.dart';
import 'package:e_commerce_app/screen/auth/auth_state_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: OverlaySupport.global(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.backgroundColor,
            appBarTheme:
                const AppBarTheme(backgroundColor: AppColors.backgroundColor),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          navigatorKey: navigatorKey,
          home: const AuthStateChangeNotifier(),
        ),
      ),
    );
  }
}
