import 'package:fiverr_test/ui/screens/transfer_to_bank.dart';
import 'package:fiverr_test/ui/screens/transfer_to_wallet.dart';
import 'package:flutter/material.dart';

class TransferMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Transfer\nmoney',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TransferToBank()));
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: Text(
                                'To bank',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: Text(
                                'Lorem ipsum',
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink[300],
                        ),
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        // width: 200,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      ),
                      // Icon(
                      //   Icons.home,
                      //   color: Colors.grey,
                      //   size: 50,
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TransferToWallet()));
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: Text(
                                'To wallet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: Text(
                                'Lorem ipsum',
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange[400],
                        ),
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        // width: 200,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
