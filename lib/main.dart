import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test_app/src/data/repository/api/repo_settings.dart';
import 'package:test_app/src/presentation/screens/home_screen/home_screen.dart';
import 'package:test_app/src/presentation/screens/profile_screen/profile_screen.dart';
import 'package:test_app/src/presentation/screens/settings_screen/settings_screen.dart';

import 'generated/l10n.dart';
import 'src/presentation/screens/navigation_bar/navigation_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repoSettings = RepoSettings();
  await repoSettings.init();
  var defaultLocale = const Locale('ru');
  final locale = await repoSettings.readLocale();
  if (locale == 'en') {
    defaultLocale = const Locale('en');
  }

  runApp(
    TestApp(
      locale: defaultLocale,
    ),
  );
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key, required this.locale}) : super(key: key);
  final Locale locale;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => RepoSettings(),
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Navigation(),
          '/settings_screen': (context) => const SettingsScreen(),
          '/home_screen': (context) => const HomeScreen(),
          '/profile_screen': (context) => const ProfileScreen(),
        },
        initialRoute: '/',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: locale,
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
