import 'package:flutter/material.dart';
import 'package:veterinary_store_app/admin/screens/add_product_screen.dart';

class ProductManagement extends StatefulWidget {
  @override
  _ProductManagementState createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  var dts = DTS();

  void _toaddproduct() {
    print("detail");
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddProduct()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: _toaddproduct, child: Text('Add product')),
            PaginatedDataTable(
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Producer')),
                  DataColumn(label: Text('Quantity')),
                ],
                source: dts)
          ],
        ),
      ),
    );
  }
}

class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('Name$index')),
      DataCell(Text('Price$index')),
      DataCell(Text('Producer$index')),
      DataCell(Text('Quantity$index')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 4;

  @override
  int get selectedRowCount => 0;
}
