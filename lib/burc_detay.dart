import 'package:flutter/material.dart';

import 'burc_liste.dart';

class BurcDetay extends StatelessWidget {
  int gelenDeger;
  BurcDetay(this.gelenDeger);
  @override
  Widget build(BuildContext context) {
    var burcDetayi = BurcListesi.tumBurclar[gelenDeger];

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            primary: true,
            pinned: true,
            backgroundColor: Colors.pink,
           
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+burcDetayi.burcBuyukResim),
              title: Text(burcDetayi.burcAdi + " Burcu ve Özellikleri") ,
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(
                burcDetayi.burcDetayi,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
