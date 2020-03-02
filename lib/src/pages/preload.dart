import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPageState createState() => _PreloadPageState();
}

class _PreloadPageState extends State<PreloadPage> {
  bool loading = false;

  void requestInfo() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      loading = true;
    });

    bool req = await Provider.of<AppData>(context).requestData();

    if (req) {
      // Ir para Home
     Navigator.pushReplacementNamed(context,'/home');
    } else {
      setState(() {
        loading = false;
      });

    }
  }

  void initState() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/flutter1_devstravel_logo.png',
            width: 200,
            ),

            loading ? Container(///Se houver loading aparece Carregando Informações
              margin: EdgeInsets.all(30),
              child: Text('Carregando Informações...',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ) : Container(),

            loading ? CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ) : Container(),

            !loading ? Container(///Se não houver loading aparece o botão
              margin: EdgeInsets.all(30),
              child: RaisedButton(
                child: Text('Tentar Novamente',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: (){},
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
