import 'package:burc_rehberi/utils/strings.dart';
import 'package:flutter/material.dart';

import 'models/burc.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar = [];
  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];
    for (var i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";
      var eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          onTap: (){
            Navigator.pushNamed(context, "/burcDetay/$index");
          },
          leading: Image.asset(
            "images/" + tumBurclar[index].burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            tumBurclar[index].burcAdi,
            style: TextStyle(
                fontSize: 24,
                color: Colors.pink.shade500,
                fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            tumBurclar[index].burcTarihi,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black38,
                fontWeight: FontWeight.w700),
          ),
          trailing:Icon(Icons.arrow_forward_ios,color: Colors.pink,) ,
        ),
      ),
    );
  }
}
