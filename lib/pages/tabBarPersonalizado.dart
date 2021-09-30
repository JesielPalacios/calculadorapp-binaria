import 'package:flutter/material.dart';

class TabBarPersonalizado extends StatefulWidget {
  Color backGroudColor;
  TabBar tabBar;

  TabBarPersonalizado(this.backGroudColor, this.tabBar);

  @override
  State<StatefulWidget> createState() {
    return _TabBarPersonalizado(backGroudColor, tabBar);
  }
}

class _TabBarPersonalizado extends State<TabBarPersonalizado> {
  Color backGroudColor;
  TabBar tabBar;

  _TabBarPersonalizado(this.backGroudColor, this.tabBar);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.backGroudColor,
      child: this.tabBar,
    );
  }
}
