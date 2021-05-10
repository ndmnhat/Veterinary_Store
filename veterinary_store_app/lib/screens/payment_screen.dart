import 'package:flutter/material.dart';
import 'package:veterinary_store_app/screens/detail_product_screen.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  int _selectRadio;

  @override
  void initState() {
    super.initState();
    _selectRadio = 1;
  }

  setSelectRadio(int val){
    setState(() {
      _selectRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: Text("Name Product", style: TextStyle(fontSize: 30,color: Colors.black)),
        backgroundColor: Color(0xFF085B6E),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Container(
                width:  MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2
                    )
                  ]
                ),
                child: Text(
                '16389 Đường 186 Khu phố 135 TP HCM TP Thủ Đức',
                style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Shipping Method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Container(
                width:  MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2
                    ),
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
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(4.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2
                    ),
                  ]
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: _selectRadio,
                            activeColor: Color(0xFF085B6E),
                            onChanged: (val){
                              setSelectRadio(val);
                            }
                        ),
                        Text(
                          'Cash',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: _selectRadio,
                            activeColor: Color(0xFF085B6E),
                            onChanged: (val){
                              setSelectRadio(val);
                            }
                        ),
                        Text(
                          'Card',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Coupon Discount',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2
                    ),
                  ]
                ),
                child: Row(
                  children: [
                    Expanded(
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
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFF085B6E),
                      ),
                      onPressed: (){},
                      child: Text(
                        "Use",
                        style: TextStyle(color: Colors.white, fontSize: 18,)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Detail',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2
                    ),
                  ]
                ),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduct()));},
                        child: product(),
                      );
                    }
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2
                    ),
                  ]
                ),
                child: Text(
                  '100.000 vnđ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 50)
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
            padding: EdgeInsets.fromLTRB(16, 5.0, 16, 5.0),
            child: OutlinedButton(
              onPressed: (){},
              style: OutlinedButton.styleFrom(backgroundColor: Color(0xFF0D9ABA)),
              child: Text(
                'Pay',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[50]),
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
        elevation: 2,
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