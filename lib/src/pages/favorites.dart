import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class FavoritesPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Favoritos',
        ),
        drawer: CustomDrawer(
            pageContext: context
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Text('Cidades Favoritas')
        ),
      ),
    );
  }
}