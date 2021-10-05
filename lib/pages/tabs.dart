import 'package:flutter/material.dart';
import 'package:CalculadorApp/pages/menuTabs/conversionesNumericas/estructura.dart';
import 'package:CalculadorApp/pages/menuTabs/operacionesBinarios/estructura.dart';
import 'package:CalculadorApp/pages/menuTabs/operacionesLogicas/estructura.dart';
import 'package:CalculadorApp/pages/tabbarpersonalizado.dart';

class NavegacionMenuTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavegacionMenuTabBar();
  }
}

class _NavegacionMenuTabBar extends State<NavegacionMenuTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(title: Text("CalculadorApp Binaria  📲")),
          body: TabBarView(
            children: [
              EstructuraConversiones(),
              EstructuraOperacionesBinarios(),
              EstructuraOperacionesLogicas()
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 58,
            child: TabBarPersonalizado(
                Colors.blue,
                TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                        text: 'Conversor',
                        icon: Icon(Icons.transform),
                        iconMargin: const EdgeInsets.only(bottom: 2.0)),
                    Tab(
                        text: 'Op Binarios',
                        icon: Icon(Icons.calculate),
                        iconMargin: const EdgeInsets.only(bottom: 2.0)),
                    Tab(
                        text: 'Op Lógicas',
                        icon: Icon(Icons.border_right_sharp),
                        iconMargin: const EdgeInsets.only(bottom: 2.0)),
                  ],
                )),
          )),
    );
  }
}
