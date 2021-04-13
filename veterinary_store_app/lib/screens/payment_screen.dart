import 'package:flutter/material.dart';
import 'detail_product_screen.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  int _SelectRadio = 0;

  setSelectRadio(int val){
    setState(() {
      _SelectRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: Text("Name Product", style: TextStyle(fontSize: 30,color: Colors.black)),
        backgroundColor: Colors.cyanAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
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
                  color: Colors.grey,
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
                  color: Colors.grey,
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
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _SelectRadio,
                                  activeColor: Colors.cyanAccent,
                                  onChanged: (val){
                                    setSelectRadio(val);
                                  }
                              ),
                              Text(
                                'Cash',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _SelectRadio,
                                  activeColor: Colors.cyanAccent,
                                  onChanged: (val){
                                    setSelectRadio(val);
                                  }
                              ),
                              Text(
                                'Card',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                    child: Text(
                      'Coupon discount',
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
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.75,
                          height: 30,
                          child: TextField(
                            // maxLines: 1,
                            // maxLength: 800,
                            style: TextStyle(
                                fontFamily: 'Sans',
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(width: 1, color: Colors.cyanAccent,),),
                            onPressed: (){},
                            child: Text("Use",style: TextStyle(color: Colors.black,fontSize: 18,)),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
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
                Container(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduct()));},
                          child: Container(
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
                          ),
                        );
                      }
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
                    child: Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      '100.000 vnđ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
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
            child: Text('Pay'),
          ),
        ),
      ),
    );
  }
}