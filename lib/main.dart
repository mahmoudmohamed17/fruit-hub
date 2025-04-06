import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/func/on_generated_route.dart';
import 'package:fruit_hub/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/services/prefs.dart';
import 'package:fruit_hub/features/splash/presentation/view/splash_view.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:fruit_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setUpGetIt();
  Bloc.observer = CustomBlocObserver();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        useMaterial3: true,
      ),
      onGenerateRoute: onGeneratedRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
