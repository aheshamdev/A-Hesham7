import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/ai_mode.dart';
import 'providers/auth_provider.dart';
import 'providers/daily_plan_provider.dart';
import 'providers/progress_provider.dart';
import 'providers/audio_provider.dart';
import 'routes/app_routes.dart';
import 'services/api_service.dart';
import 'services/audio_service.dart';
import 'services/daily_plan_repository.dart';
import 'services/firebase_service.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseService = FirebaseService();
    final apiService = ApiService(baseUrl: 'http://localhost:8000');
    final audioService = AudioService();
    final dailyPlanRepository = DailyPlanRepository();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(firebaseService: firebaseService)..init()),
        ChangeNotifierProvider(create: (_) => DailyPlanProvider(repository: dailyPlanRepository)),
        ChangeNotifierProvider(create: (_) => ProgressProvider(firebaseService: firebaseService)),
        ChangeNotifierProvider(create: (_) => AudioProvider(audioService: audioService, apiService: apiService)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'حصون الحفظ',
        theme: AppTheme.buildTheme(),
        routes: AppRoutes.routes(),
        initialRoute: AppRoutes.home,
        // Force RTL layout
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child ?? const SizedBox.shrink(),
          );
        },
        // Localization placeholders (add more locales and delegates later)
        localizationsDelegates: const [
          // GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
      ),
    );
  }
}
