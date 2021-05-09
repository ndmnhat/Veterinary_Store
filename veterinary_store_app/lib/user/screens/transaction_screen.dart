import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Container transaction(var context, String status, int color){

  Container boxDetail(String status,int color){
    if(color == 1){
      return Container(
          width: 80.0,
          height: 20.0,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Color(0xFF026E46))
            ),
            color: Color(0xFF026E46),
          ),
          child: Text(
            status,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
        ),
      );
    }
    else if(color == 2){
      return Container(
        // color: Colors.green,
        width: 80.0,
        height: 20.0,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Color(0xFF0D296E))
          ),
          color: Color(0xFF0D296E),
        ),
        child: Text(
          status,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    else if(color == 3){
      return Container(
        // color: Colors.green,
        width: 80.0,
        height: 20.0,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Color(0xFF9E331B))
          ),
          color: Color(0xFF9E331B),
        ),
        child: Text(
          status,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return Container();
  }

  return Container(
    width: MediaQuery.of(context).size.width * 0.94,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.white)
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'ID Bill',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: boxDetail(status, color)
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    'Day: 30/2/2021',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    'Username: User',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    'Totals: 100.000 vnđ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}