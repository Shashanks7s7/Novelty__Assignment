import 'package:flutter/material.dart';
import 'package:stockapp/screens/widgets/filter.dart';

import 'widgets/marketdetails.dart';


class MarketScreen extends StatelessWidget {
  int selectedPage;
  MarketScreen(this.selectedPage);

  @override
  Widget build(BuildContext context) {
    final tabpages=<Widget>[
     Filter({}, (){}),
    MarketDetails()
      
    
    ];
    final tabs=[
      const Tab(icon: Icon(Icons.add),text:"Add Stock"),
      const Tab(icon: Icon(Icons.view_agenda),text:"Market Details")
    ];
    return DefaultTabController(
      initialIndex: selectedPage,
      length: tabs.length
  , child: 
    Scaffold(
      appBar: AppBar(
        title: Text("Market"),
        centerTitle: true,
      
      bottom:TabBar(tabs: tabs) ,
      ),
      body: TabBarView(children: tabpages),
    ));
  }
}