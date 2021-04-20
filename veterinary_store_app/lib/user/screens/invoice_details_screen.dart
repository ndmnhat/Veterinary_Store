import 'package:flutter/material.dart';
import 'package:veterinary_store_app/user/screens/detail_product_screen.dart';

class InvoiceDetail extends StatefulWidget {
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          'ID Bill: 1210145',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            // color: Colors.green,
                            width: 80.0,
                            height: 20.0,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.lightGreen)
                              ),
                              color: Colors.lightGreen,
                            ),
                            child: Text(
                              'Complete',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFeaeaea),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                    child: Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                    child: Text(
                      '16389 Đường 186 Khu phố 135 TP HCM TP Thủ Đức',
                      style: TextStyle(
                        // fontFamily: 'Sans',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFeaeaea),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                    child: Text(
                      'Shipping Method',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Bla bla bla',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFeaeaea),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Cash',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFeaeaea),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                    child: Text(
                      'Detail',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduct()));},
                        child: product(),
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyanAccent,
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: ElevatedButton(
            onPressed: (){},
            child: Text('Cancel'),
          ),
        ),
      ),
    );
  }

  Container product(){
   return Container(
     width: MediaQuery.of(context).size.width,
     child: Card(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(0.0),
       ),
       color: Colors.white,
       // elevation: 10,
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: ConstrainedBox(
               constraints: BoxConstraints(
                 maxWidth: MediaQuery.of(context).size.width * 0.28,
                 maxHeight: MediaQuery.of(context).size.width * 0.28,
               ),
               child: Image.network(
                   'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                   fit: BoxFit.fill
               ),
             ),
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Container(
                 width: MediaQuery.of(context).size.width * 0.5,
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                   child: Text(
                     'Demo',
                     style: TextStyle(
                       fontSize: 20,
                     ),
                   ),
                 ),
               ),
               Container(
                 width: MediaQuery.of(context).size.width * 0.5,
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                   child: Text(
                     '10.000 đ',
                     style: TextStyle(
                       fontSize: 18,
                     ),
                   ),
                 ),
               ),
             ],
           ),
           Column(
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.fromLTRB(5, 40, 0, 0),
                 child: Text(
                   '1',
                   style: TextStyle(
                     fontSize: 14,
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
}