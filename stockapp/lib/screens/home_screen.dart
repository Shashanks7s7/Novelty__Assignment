import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/provider/api.dart';
import 'package:stockapp/provider/auth.dart';
import 'package:stockapp/screens/widgets/clickable.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool isloading = false;
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      isloading = true;
    });
    await Provider.of<API>(context, listen: false).fetchStockData();
     await Provider.of<API>(context, listen: false).fetchMarketData();
   
    setState(() {
      isloading = false;
    });
  }

  Widget build(BuildContext context) {
    final stockData = Provider.of<API>(context, listen: false).stockData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>Provider.of<Auth>(context,listen: false).logout(), icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Clickable()
    );
  }
}
