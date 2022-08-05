import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stockapp/models/market_model.dart';
import 'package:stockapp/models/stock_model.dart';

class API with ChangeNotifier {
  String baseurl = "http://192.168.1.74:5000";
  String? _userid;
  int totalUnits=0;

  double totalInvestment=0;
  double toalsoldamount=0;
  double totalbuyamount=0;
double currentamount=0;
double overallprofit=0;

   void update(String userid) {
    _userid =userid;
  }

  List<StockModel> stockData = [];
List<MarketModel> marketData=[];
List<MarketModel> filterdmarketData=[];
List<MarketModel> filterBuyData=[];
List<MarketModel> filterSellData=[];

  Future fetchStockData() async {
    final response = await http.get(Uri.parse(baseurl + "/stock/get/"));
    var data = jsonDecode(response.body);
    print(data[0]);
    stockData=[];
    if (stockData.isEmpty)
      for (int i = 0; i < data.length; i++) {
        stockData.add(StockModel.fromJson(data[i]));
      }
    notifyListeners();
  }

  postMarketData(String? id, String? stockName, int? transType,
      String? quantity, String? amount) async {
    if (id != null &&
        stockName != null &&
        transType != null &&
        quantity != null &&
        amount != null) {
      Map<String, String> body = {
        "userid": id,
        "stockName": stockName,
        "transactionType": transType.toString(),
        "quantity": quantity,
        "amount": amount
      };
      final response = await http.post(Uri.parse(baseurl + "/market/post/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));


    }
  }
  Future fetchMarketData() async {
    final response = await http.get(Uri.parse(baseurl + "/market/get/"));
    var data = jsonDecode(response.body);
   marketData=[];
   filterdmarketData=[];
    totalUnits=0;

   totalInvestment=0;
   toalsoldamount=0;
   totalbuyamount=0;
 currentamount=0;
 overallprofit=0;
    if (marketData.isEmpty){
      for (int i = 0; i < data.length; i++) {
        marketData.add(MarketModel.fromJson(data[i]));
      }
      findbyid();
    }
    notifyListeners();
  }


  findbyid(){
    marketData.forEach((element) { 
      if(element.userid==_userid){
        filterdmarketData.add(element);
      }
    });
    print(filterdmarketData);
    dashboardCalculation();
  }
  dashboardCalculation(){
     filterdmarketData.forEach((element) { 
      totalUnits=int.parse(element.quantity.toString())+totalUnits;
      totalInvestment=(double.parse(element.amount.toString())*int.parse(element.quantity.toString()))+totalInvestment;
       if(element.transactionType=="0"){
        filterBuyData.add(element);
        totalbuyamount=(double.parse(element.amount.toString())*int.parse(element.quantity.toString()))+totalbuyamount;
      }
      if(element.transactionType=="1"){
        filterSellData.add(element);
        toalsoldamount=(double.parse(element.amount.toString())*int.parse(element.quantity.toString()))+toalsoldamount;

      }
     
     });
     

  }
}
