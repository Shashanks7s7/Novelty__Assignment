
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/provider/api.dart';

class StockListScreen extends StatefulWidget {
  const StockListScreen({Key? key}) : super(key: key);

  @override
  State<StockListScreen> createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  @override
  bool isloading = false;
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  fetchdata();
  }
  fetchdata()async{
      setState(() {
      isloading = true;
    });
    await Provider.of<API>(context, listen: false).fetchStockData();
    setState(() {
      isloading = false;
    });
  }

  Widget build(BuildContext context) {
    var stockData = Provider.of<API>(context, listen: false).stockData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stocks List"),
        centerTitle: true,
        actions: [
          IconButton(onPressed:  () async{
          stockData=[];
         await fetchdata();
        }, icon: Icon(Icons.refresh))
        ],
      ),
      body: RefreshIndicator(
        
        onRefresh: () async{
          stockData=[];
         await fetchdata();
        },
        child:
             isloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: DataTable(
                          sortAscending: false,
                          dataRowHeight: 75,
                          border: TableBorder.all(
                            width: 1.2,
                            color: Colors.black54,
                          ),
                          columnSpacing: MediaQuery.of(context).size.width / 4,
                          dividerThickness: 1,
                          columns: const [
                            DataColumn(label: Text('SN')),
                            DataColumn(label: Text('Stock Name')),
                            DataColumn(label: Text('Quantity')),
                            DataColumn(label: Text('Amount')),
                          ],
                          rows: [
                            for (int i = 0; i < stockData.length; i++)
                              DataRow(cells: [
                                DataCell(Text((i + 1).toString())),
                                DataCell(Text(stockData[i].stockName.toString())),
                                DataCell(Text(stockData[i].quantity.toString())),
                                DataCell(Text(stockData[i].amount.toString())),
                              ]),
                          ]),
                    ),
                  ),
      
      ),
          
    );
  }
}