import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/provider/api.dart';
import 'package:stockapp/provider/auth.dart';
import 'package:stockapp/screens/auth_screen.dart';
import 'package:stockapp/screens/dashboard_screen.dart';
import 'package:stockapp/screens/market_screen.dart';
import 'package:stockapp/screens/stocklist_screen.dart';

import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => Auth())),
        ChangeNotifierProxyProvider<Auth,API>(create: ((context) => API()), update:(_,auth,api)=>api!..update(auth.userid??"")),
               
      ],
     child:
    
   Consumer<Auth>(builder: (context, auth, _) =>  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.green,
      ),
      home:auth.authd?HomeScreen():FutureBuilder(future:auth.tryautologin(),
              builder: (context,snapshot)=> snapshot.connectionState==ConnectionState.waiting? SplashScreen():AuthScreen()
              ),
              routes: {
                "stockList":((context) => StockListScreen()),
                "dashboard":((context) => Dashboard_Screen()),
                "market":(((context) => MarketScreen(0)))
              },
    )));
  }
}
