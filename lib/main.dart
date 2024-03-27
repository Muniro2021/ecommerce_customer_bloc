// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'bindings/intialbindings.dart';
import 'core/language/app_localizations.dart';
import 'core/language/cubit/language_cubit.dart';
import 'core/routes.dart';
import 'core/services/services.dart';
import 'core/theme/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, localState) {
              if (themeState is LoadedThemeState &&
                  localState is ChangeLanguage) {
                return GetMaterialApp(
                  locale: localState.locale,
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  debugShowCheckedModeBanner: false,
                  theme: themeState.themeData,
                  initialBinding: InitialBindings(),
                  getPages: routes,
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
