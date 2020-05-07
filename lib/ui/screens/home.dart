import 'package:fiverr_test/ui/screens/bill.dart';
import 'package:fiverr_test/ui/screens/notification.dart';
import 'package:fiverr_test/ui/screens/payment.dart';
import 'package:fiverr_test/ui/screens/profile.dart';
import 'package:fiverr_test/ui/screens/receipt.dart';
import 'package:fiverr_test/ui/screens/recharge_money.dart';
import 'package:fiverr_test/ui/screens/settings.dart';
import 'package:fiverr_test/ui/screens/transaction_history.dart';
import 'package:fiverr_test/ui/screens/transfer_money.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_tabController.index != 0) {
            _tabController.animateTo(0);
            return false;
          } else {
            return showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                          title: Text('Are you sure'),
                          content: Text('Do you want to exit the app?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('No'),
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () => Navigator.of(context).pop(true),
                            )
                          ],
                        )) ??
                false;
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              mainHome(),
              TransactionHistory(),
              Payment(),
              Center(child: Text('Link')),
              Settings(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: 70,
          child: Card(
            margin: EdgeInsets.all(0),
            // elevation: 10,
            shadowColor: Colors.grey,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(boxShadow: [
                new BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 10.0,
                ),
              ]),
              height: 65,
              child: Card(
                margin: EdgeInsets.all(0),
                child: FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width /
                        (2 /
                            (MediaQuery.of(context).size.height /
                                MediaQuery.of(context).size.width)),
                    // height: 60,
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: false,
                      labelColor: Colors.pinkAccent,
                      labelPadding: EdgeInsets.symmetric(vertical: 10),
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.black12,
                      indicatorPadding: EdgeInsets.all(.0),
                      indicatorColor: Colors.white,
                      tabs: <Widget>[
                        Icon(Icons.home),
                        Icon(Icons.history),
                        Icon(Icons.payment),
                        Icon(Icons.link),
                        Icon(Icons.settings),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mainHome() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/img.jpeg'),
                ),
              ),
              title: Text('Hi Lee !'),
              subtitle: Text('Welcome back'),
              trailing: Container(
                  width: 55,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          icon: Icon(
                            Icons.grid_on,
                            // size: 15,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Notifications()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            // size: 15,
                          ),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => Settings()));
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 215,
            child: Swiper(
              // physics: ClampingScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              // pagination: new SwiperPagination(),
              // control: new SwiperControl(),
              // loop: false,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                        color: Colors.pink[100],
                      ),
                      width: 15,
                      height: 170,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 205,
                      width: MediaQuery.of(context).size.width - 46,
                      child: Card(
                        // shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 6,
                        color: Colors.pink[400],
                        margin: EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                'USD Wallet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                '\$12,000',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                'Wallet no',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                '1234 2345 3456 4567',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0)),
                        color: Colors.pink[200],
                      ),
                      width: 15,
                      height: 170,
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            alignment: Alignment.topLeft,
            child: Text('Functions'),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: 50,
            // color: Colors.red,
            margin: EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RechargeMoney()));
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 8,
                      child: Container(
                        height: 80,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.pinkAccent,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'RECHARGE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'money',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TransferMoney()));
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 8,
                      child: Container(
                        height: 80,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.cloud_upload,
                                color: Colors.pinkAccent,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'TRANSFER',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'money',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Bill()));
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 8,
                      child: Container(
                        height: 80,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.crop_rotate,
                                color: Colors.pinkAccent,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'EXCHANGE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'money',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),

          // Transactions

          Container(
            height: 35,
            child: ListTile(
              // leading: Text(''),
              title: Text('Recent transactions'),
              trailing: Text('More'),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Receipt()));
            },
            child: ListTile(
              // leading: Text(''),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Receive money',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '+ \$1,000',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('From: Harry Jame'),
                  ),
                  Text('${DateTime.now().day}/${DateTime.now().month}')
                ],
              ),
              // trailing: Text('More'),
            ),
          ),
          Divider(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Receipt()));
            },
            child: ListTile(
              // leading: Text(''),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Pay electric bill',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '- 9100',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('From: USD wallet'),
                  ),
                  Text('${DateTime.now().day}/${DateTime.now().month}')
                ],
              ),
              // trailing: Text('More'),
            ),
          ),
          Divider(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Receipt()));
            },
            child: ListTile(
              // leading: Text(''),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Booking flight',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '- 3,400 JPY',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('From: Japan wallet'),
                  ),
                  Text('${DateTime.now().day}/${DateTime.now().month}')
                ],
              ),
              // trailing: Text('More'),
            ),
          ),
          Divider(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Receipt()));
            },
            child: ListTile(
              // leading: Text(''),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Receive money',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '+ \$1,000',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('From: Harry Jame'),
                  ),
                  Text('${DateTime.now().day}/${DateTime.now().month}')
                ],
              ),
              // trailing: Text('More'),
            ),
          ),
          Divider(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Receipt()));
            },
            child: ListTile(
              // leading: Text(''),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Booking flight',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '- 3,400 JPY',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('From: Japan wallet'),
                  ),
                  Text('${DateTime.now().day}/${DateTime.now().month}')
                ],
              ),
              // trailing: Text('More'),
            ),
          ),
          Divider(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Receipt()));
            },
            child: ListTile(
              // leading: Text(''),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Booking flight',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '- 3,400 JPY',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('From: Japan wallet'),
                  ),
                  Text('${DateTime.now().day}/${DateTime.now().month}')
                ],
              ),
              // trailing: Text('More'),
            ),
          ),
          Divider(
            height: 1,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
