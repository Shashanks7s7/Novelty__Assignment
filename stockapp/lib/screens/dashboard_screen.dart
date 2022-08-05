import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/provider/api.dart';

import '../provider/auth.dart';

class Dashboard_Screen extends StatefulWidget {
  const Dashboard_Screen({Key? key}) : super(key: key);

  @override
  State<Dashboard_Screen> createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var textStyle = const TextStyle(
        fontFamily: "Lato",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black);
    final auth = Provider.of<Auth>(context);
       final userdata = Provider.of<API>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: size.height / 3.5,
            width: double.infinity,
            child: Image.network(
              "https://t4.ftcdn.net/jpg/04/43/19/67/360_F_443196734_SDFxQSAZbALBUapEtEBuio6xc8SOMUf0.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                "User: ${auth.userId}",
                style: textStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Information",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          SizedBox(height: size.height / 35),
          rowww('Total Units', userdata.totalUnits.toString()),
          rowww("Total Investment", userdata.totalInvestment.toString()),
          rowww("Sold Amount", userdata.toalsoldamount.toString()),
          rowww("Buy Amount", userdata.totalbuyamount.toString()),
          rowww("Over all Profit", "87744"),


        ])));
  }

  Widget rowww(String na, String ya) {
    return Card(
      elevation: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              na,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              ya,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
