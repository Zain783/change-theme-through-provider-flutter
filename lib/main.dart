import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut_4/provider/favourite_provider.dart';
import 'package:provider_tut_4/provider/theme_changer.dart';
import 'package:provider_tut_4/screens/favourite/favouritescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FavouriteItemProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeChangerProvider(),
          )
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChangerProvider =
                Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeChangerProvider.themeMode,
              theme: ThemeData(
                  primaryColor: Colors.red, primarySwatch: Colors.purple),
              darkTheme: ThemeData(brightness: Brightness.dark),
              home: FavouriteScreen(),
            );
          },
        ));
  }
}
