import 'package:devstravel/src/pages/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/app_data.dart';

import 'src/pages/preload.dart';
import 'src/pages/home.dart';
import 'src/pages/search.dart';
import 'src/pages/continent.dart';
import 'src/pages/list_city.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppData(),
        ),
    ],
    child: MyApp(),
   ),
  );

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/preload': (context) => PreloadPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/favorites': (context) => FavoritesPage(),
        '/list_city': (context) => ListCityPage(),
      },
      initialRoute: '/preload',
    );
  }
}

///=> Siginifica retorno imediato