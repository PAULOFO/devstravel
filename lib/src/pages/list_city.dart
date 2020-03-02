import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/city_box.dart';


class ListCityPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  void cityBoxAction(cityData) {

  }

  @override
  Widget build(BuildContext context) {
    final continentIndex = ModalRoute.of(context).settings.arguments;

    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        var cities = [];
        for (var country in appdata.data[continentIndex]['countries']) {
          cities.addAll( country['cities']);
        }

        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
            showBack: true,
          ),
          drawer: CustomDrawer(
              pageContext: context
          ),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length,(index) {
              return CityBox(
                data: cities[index],
                onTap: cityBoxAction,
              );
            }),
          ),
        );
      }
    );
  }
}

