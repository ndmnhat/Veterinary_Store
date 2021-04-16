import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:veterinary_store_app/user/screens/detail_product/detail_product_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: StaggeredGridView.countBuilder(
          //padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              _changetodetail();
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: product(1,2),
            ),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }

  // int a int b dùng để truyền dữ liệu vào

  Container product(int a,int b){
    return Container(
      //padding: EdgeInsets.all(8),
      //color: Colors.green,
      decoration: BoxDecoration(
        // color: colors[this.noteList[index].color],
        border: Border.all(width: 0.5, color: Colors.black),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: SizedBox(
              height: 190,
              width: 250,
              child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  fit: BoxFit.fill),
            ),
          ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Cú mèo",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      // fontFamily: 'Sans',
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "10.000 vnđ",
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      // fontFamily: 'Sans',
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "20.000 vnđ",
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      // fontFamily: 'Sans',
                      // fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _changetodetail() {
    print("detail");
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduct()));
  }
}