import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:stockapp/provider/api.dart';
import 'package:stockapp/provider/auth.dart';
import 'package:stockapp/screens/market_screen.dart';

class Filter extends StatefulWidget {
  final Function savefilters;
  final Map<String, bool> currentFilters;
  Filter(this.currentFilters, this.savefilters);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  String? _buttonselectedstock;
 
  bool isloading = false;
  int radioval=0;
TextEditingController quantityController=TextEditingController();
TextEditingController amountController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final stockdata = Provider.of<API>(context, listen: false);
    final auth=Provider.of<Auth>(context, listen: false);
   
    return Scaffold(
        body: isloading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please Wait...."),
                    SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 120, child: Text("Stock")),
                            Container(
                              height: 60,
                              width: 200,
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _buttonselectedstock,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    hint: const Text("--Select--"),
                                    items: stockdata.stockData
                                        .map(
                                            (value) => DropdownMenuItem<String>(
                                                  value: value.stockName,
                                                  child: SizedBox(
                                                      width: 120,
                                                    
                                                          child: Text(value
                                                              .stockName
                                                              .toString(),overflow: TextOverflow.clip,softWrap: true,))),
                                                )
                                        .toList(),
                                    onChanged: (String? newval) {
                                      if (newval != null) {
                                        setState(() {
                                          _buttonselectedstock=newval;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                        Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text("Transaction Type"),
                              ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [0].map((int index){
                                return
                                Row(
                                  children: [
                                    Text("buy"),
                                    Radio<int>(value: index,
                                     onChanged: (int? value){
                                      if(value!=null){
                                        setState(() {
                                          radioval=value;
                                          print(value);
                                        });
                                      }
                                     },groupValue:radioval ),
                                  ],
                                );}).toList(),
                              
                            ),
                          ),
                            SizedBox(
                                width: 100,
                            child: Row(
                              children: [1].map((int index){
                                return
                                Row(
                                  children: [
                                    Text("sell"),
                                    Radio<int>(value: index,
                                     onChanged: (int? value){
                                      if(value!=null){
                                        setState(() {
                                          radioval=value;
                                          print(value);
                                        });
                                      }
                                     },groupValue:radioval ),
                                  ],
                                );}).toList(),
                              
                            ),
                          ),
                                                  
                            ]),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                "Quantity",
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                ),
                                controller: quantityController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text("Amount"),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  )),
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                     
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                                label: Text("Add"),
                                icon: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  print(quantityController.text+" "+amountController.text);
                           await stockdata.postMarketData(auth.userid, _buttonselectedstock, radioval,quantityController.text ,amountController.text );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              new MarketScreen(1)));
                                })
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ));
  }
}
