import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catbreeds/blocs/bloc.dart';
import 'package:catbreeds/data/repositories/cat_repository.dart';
import 'package:catbreeds/ui/screens/splash_screen.dart';
import 'package:catbreeds/utils/theme.dart';
import 'package:catbreeds/data/repositories/auth_repository.dart';
import 'package:catbreeds/ui/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatBreedsBloc>(
          create: (context) => CatBreedsBloc(CatRepository()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(AuthRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Catbreeds',
        theme: appTheme,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              return SplashScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
