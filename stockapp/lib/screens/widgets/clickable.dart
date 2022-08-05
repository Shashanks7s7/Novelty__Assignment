import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  const Clickable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary);
    return Container(
      padding: EdgeInsets.all(10),

      //  width: size.height/2,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("dashboard"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[400]),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned.fill(
                    child: Container(
                             alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green[600],
                        )),
                  ),
                  Positioned.fill(
                      top: -20,
                      right: -50,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green[400],
                          ))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Dashboard',
                          style: textStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('market'),
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[400]),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned.fill(
                    left: -150,
                    top: 20,
                    bottom: 20,
                    child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[600],
                        )),
                  ),
                  Positioned(
                      top: 85,
                      right: 30,
                      child: Container(
                          margin: EdgeInsets.all(12),
                          height: 70,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue[500],
                          ))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business_center,
                        color: Colors.white,
                        size: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Market',
                          style: textStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('stockList'),
            child: Container(
              //padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange[400]),

              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: -32,
                    right: 8,
                    child: Container(
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange[600],
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Stocks',
                          style: textStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('stockList'),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[400]),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    bottom: -22,
                    right: 6,
                    child: Container(
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 35,
                        width: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.red[700],
                        )),
                  ),
                  Positioned(
                      bottom: -22,
                      right: 28,
                      child: Container(
                          //     alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          height: 25,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.red[700],
                          ))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.graphic_eq,
                        color: Colors.white,
                        size: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          child: Text(
                            'OverAll Stats',
                            style: textStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
