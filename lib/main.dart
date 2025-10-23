import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app_routes.dart';
import 'app/app_theme.dart';
import 'providers/user_provider.dart';
import 'providers/progress_provider.dart';
import 'providers/fortress_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
        ChangeNotifierProvider(create: (_) => FortressProvider()),
      ],
      child: Builder(
        builder: (context) {
          final userProvider = context.watch<UserProvider>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: kAppName,
            theme: AppTheme.lightTheme,
            locale: const Locale('ar'),
            builder: (context, child) => Directionality(
              textDirection: TextDirection.rtl,
              child: child ?? const SizedBox.shrink(),
            ),
            initialRoute: userProvider.isAuthenticated
                ? AppRoutes.home
                : AppRoutes.login,
            routes: AppRoutes.routes,
            home: userProvider.isAuthenticated
                ? const HomeScreen()
                : const LoginScreen(),
          );
        },
      ),
    );
  }
}
