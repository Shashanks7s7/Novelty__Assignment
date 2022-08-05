import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../provider/api.dart';

class MarketDetails extends StatefulWidget {
  const MarketDetails({Key? key}) : super(key: key);

  @override
  State<MarketDetails> createState() => _MarketDetailsState();
}

class _MarketDetailsState extends State<MarketDetails> {
  @override
    

  Widget build(BuildContext context) {
     var marketData = Provider.of<API>(context, listen: false).marketData;
 return Scaffold(
    
      body:RefreshIndicator(
        color: Colors.red,
        backgroundColor: Colors.blue,
        onRefresh: ()async{
          marketData=[];
          await Provider.of<API>(context,listen: false).fetchMarketData();
        },
        child: SingleChildScrollView(
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
                         DataColumn(label: Text('Trans. Type')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Amount')),
                              DataColumn(label: Text('Trans. Date')),
                      ],
                      rows: [
                        for (int i = 0; i < marketData.length; i++)
                          DataRow(cells: [
                            DataCell(Text((i + 1).toString())),
                            DataCell(Text(marketData[i].stockName.toString())),
                            DataCell(Text(marketData[i].transactionType=="0"?"buy":"sell")), 
                            DataCell(Text(marketData[i].quantity.toString())),
                            DataCell(Text(marketData[i].amount.toString())),
                             DataCell(Text(marketData[i].createdAt.toString().split("T")[0])),
                          ]),
                      ]),
                ),
              ),
      ),
    );
  }
}