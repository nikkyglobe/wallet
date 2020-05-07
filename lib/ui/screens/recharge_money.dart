import 'package:fiverr_test/ui/widgets/expansion_list.dart';
import 'package:flutter/material.dart';

class RechargeMoney extends StatefulWidget {
  @override
  _RechargeMoneyState createState() => _RechargeMoneyState();
}

class _RechargeMoneyState extends State<RechargeMoney> {
  final numberController = TextEditingController();

  String selectedValue = 'USD wallet';

  List items = ['USD wallet', 'Japan wallet', 'Anything'];

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
                  'Recharge\nmoney',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Source: Wells Fargo',
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Choose wallet',
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 15),
                ExpansionList(
                  onItemSelected: (selected) {
                    selectedValue = selected;
                  },
                  items: items,
                  title: selectedValue,
                ),
                SizedBox(height: 30),
                Text(
                  'Amount',
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Number'),
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        numberController.text = '10';
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$ 10',
                            style: TextStyle(
                              // color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              // fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberController.text = '100';
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$ 100',
                            style: TextStyle(
                              // color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              // fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberController.text = '200';
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$ 200',
                            style: TextStyle(
                              // color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              // fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: RaisedButton(
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {},
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
