import 'package:flutter/material.dart';
import 'package:veterinary_store_app/screens/detail_product_screen.dart';

class InvoiceDetail extends StatefulWidget {
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[50]),
        centerTitle: true,
        backgroundColor: Color(0xFF085B6E),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
        child: Container(
          color: Colors.grey[50],
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey)
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                          // color: Colors.green,
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
                            'Complete',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ID Bill:',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          '1210145',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(children: [
                      Expanded(
                        child: Text(
                          'Day:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        '30/2/2021',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],),
                    SizedBox(height: 4),
                    Row(children:[
                      Expanded(
                        child: Text(
                          'Username:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        'User',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ]),
                    Row(children: [
                      Expanded(
                        child: Text(
                          'Totals:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        '100.000 vnđ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ]),
                  ]
                ),
              ),
              SizedBox(height: 30,),
              Text(
                'Address',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey)
                  ]
                ),
                child: Text(
                  '16389 Đường 186, Khu phố 135, TP Thủ Đức',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Shipping Method',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey)
                  ]
                ),
                child: Text(
                  'Bla bla bla',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Payment Method',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey)
                  ]
                ),
                child: Text(
                  'Cash',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Detail',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduct()));},
                        child: product(),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey)
          ]
        ),
        child: BottomAppBar(
          color: Colors.grey[50],
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0D9ABA)
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey[50],
                  fontSize: 20
                ),
              ),
            ),
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
                       fontSize: 18,
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
                       fontSize: 16,
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