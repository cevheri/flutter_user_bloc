import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userbloc/account/login/bloc/login_bloc.dart';
import 'package:userbloc/account/login/login_repository.dart';
import 'package:userbloc/account/register/bloc/register_bloc.dart';
import 'package:userbloc/account/settings/settings_screen.dart';
import 'package:userbloc/main/bloc/main_bloc.dart';
import 'package:userbloc/routes.dart';
import 'package:userbloc/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:userbloc/shared/repository/account_repository.dart';
import 'package:userbloc/themes.dart';
import 'account/settings/bloc/settings_bloc.dart';

import 'account/login/login_screen.dart';
import 'account/register/register_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

// jhipster-merlin-needle-import-add - JHipster will add new imports here

class UserBlocApp extends StatelessWidget {
  const UserBlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UserBloc app',
      theme: Themes.jhLight,
      routes: {
        UserBlocRoutes.login: (context) {
          return BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(loginRepository: LoginRepository()),
            child: LoginScreen());
        },
        UserBlocRoutes.register: (context) {
          return BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(accountRepository: AccountRepository()),
            child: RegisterScreen());
        },
        UserBlocRoutes.main: (context) {
          return BlocProvider<MainBloc>(
            create: (context) => MainBloc(accountRepository: AccountRepository())
              ..add(Init()),
            child: MainScreen());
        },
      UserBlocRoutes.settings: (context) {
        return BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(accountRepository: AccountRepository())
            ..add(LoadCurrentUser()),
          child: SettingsScreen());
        },
        // jhipster-merlin-needle-route-add - JHipster will add new routes here
      },
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales
    );
  }
}
