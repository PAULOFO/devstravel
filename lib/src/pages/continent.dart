import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/city_box.dart';

class ContinentPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  void seeCityAction(context, continentIndex) {
    Navigator.pushNamed(context, '/list_city', arguments: continentIndex);
  }

  void cityBoxAction( cityData ) {

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Escolha um Continente',
        ),
        drawer: CustomDrawer(
            pageContext: context
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (context, index) {
            var cities = [];
            for (var country in appdata.data[index]['countries']) {
              cities.addAll( country['cities'] );
            }

            return Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        "${appdata.data[index]['name']} (${cities.length})",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica Neue',
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Ver Cidades',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica Neue',
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: (){
                        seeCityAction(context, index);
                      },
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.only(bottom: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (cityContext, cityIndex){
                      return CityBox(
                        data: cities[cityIndex],
                        onTap: cityBoxAction
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}