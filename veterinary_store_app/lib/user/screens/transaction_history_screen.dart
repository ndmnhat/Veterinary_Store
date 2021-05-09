import 'package:flutter/material.dart';
import 'package:veterinary_store_app/user/screens/invoice_details_screen.dart';
import 'package:veterinary_store_app/user/screens/transaction_screen.dart';

class TranHis extends StatefulWidget {
  @override
  _TranHisState createState() => _TranHisState();
}

class _TranHisState extends State<TranHis> with SingleTickerProviderStateMixin {
  var _selectedIndex = 0;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'All',),
    Tab(text: 'Waiting',),
    Tab(text: 'Complete',),
    Tab(text: 'Cancel',),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(  // Added
      length: 4,  // Added
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[50]),
          centerTitle: true,
          title: Text("History", style: TextStyle(fontSize: 30, color: Colors.grey[50])),
          backgroundColor: Color(0xFF085B6E),
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[50],
            labelStyle: TextStyle(fontSize: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
          child: TabBarView(
            controller: _tabController,
              children: [
                // sẽ thay thành hàm return về ds các đơn hàng
                AllTransaction(),
                WaittingTransaction(),
                CompleteTransaction(),
                CancelTransaction(),
              ],
          ),
        ),
      ),
    );
  }
}
// tất cả các hóa đơn
class AllTransaction extends StatefulWidget {
  @override
  _AllTransactionState createState() => _AllTransactionState();
}

class _AllTransactionState extends State<AllTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(  // Added
      child:ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceDetail()));},
              child: transaction(this.context, "Complete",1),
            );
          }
      ),
    );
  }
}
// các hóa đơn đã hoàn thành
class CompleteTransaction extends StatefulWidget {
  @override
  _CompleteTransactionState createState() => _CompleteTransactionState();
}

class _CompleteTransactionState extends State<CompleteTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(child:ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceDetail()));},
            child: transaction(this.context,'Complete',1),
          );
        }
    ),);
  }
}

// các hóa đơn đang chờ xác nhận hoặc giao hàng

class WaittingTransaction extends StatefulWidget {
  @override
  _WaittingTransactionState createState() => _WaittingTransactionState();
}

class _WaittingTransactionState extends State<WaittingTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(child:ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceDetail()));},
            child: transaction(this.context, 'Waitting',2),
          );
        }
    ),);
  }
}

// các hóa đơn đã bị hủy

class CancelTransaction extends StatefulWidget {
  @override
  _CancelTransactionState createState() => _CancelTransactionState();
}

class _CancelTransactionState extends State<CancelTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(child:ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceDetail()));},
            child: transaction(this.context, 'Cancel',3),
          );
        }
    ),);
  }
}


