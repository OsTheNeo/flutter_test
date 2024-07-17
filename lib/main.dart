import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catbreeds/blocs/bloc.dart';
import 'package:catbreeds/data/repositories/cat_repository.dart';
import 'package:catbreeds/ui/screens/splash_screen.dart';
import 'package:catbreeds/utils/theme.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Catbreeds',
        theme: appTheme,
        home: SplashScreen(),
      ),
    );
  }
}