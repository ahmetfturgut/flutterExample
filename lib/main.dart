 
import 'package:flutter/material.dart'; 
import 'burc_detay.dart';
import 'burc_liste.dart';

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      initialRoute: "/burcListesi",
      routes:{
        "/":(context)=>BurcListesi(),
        "/burcListesi":(context)=>BurcListesi(), 
      } , 
      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari =settings.name.split("/");
        if (pathElemanlari[1]=='burcDetay') {
          return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathElemanlari[2])));
        }
      },
    );
  }
}
