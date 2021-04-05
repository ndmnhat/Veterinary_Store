import 'package:flutter/material.dart';
import 'package:smart_grid_view/smart_grid_view.dart';

import 'detail_product_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Container(
        child: SmartGridView(
          tileWidth: MediaQuery.of(context).size.width * 0.4,
          tileHeight: MediaQuery.of(context).size.height * 0.17,
          children: List.generate(10, (index) => GestureDetector(
            onTap: _changetodetail,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * 0.48,
                      height: MediaQuery.of(context).size.height * 0.21,
                    ),
                  ),
                  Text(
                    "Cú mèo",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    // textAlign: TextAlign.left,
                   ),
                  Text(
                    "10.000 vnd",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    // textAlign: TextAlign.left,
                  ),
                  Text(
                    "20.000 vnd",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough,
                    ),
                    // textAlign: TextAlign.left,
                  ),
                ],
              )
              ),
          ),
          )),
      ),
    );
  }

  void _changetodetail() {
    print("detail");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduct()));
  }
}