import 'package:fiverr_test/ui/widgets/expansion_list.dart';
import 'package:flutter/material.dart';

class TransferToBank extends StatefulWidget {
  @override
  _TransferToBankState createState() => _TransferToBankState();
}

class _TransferToBankState extends State<TransferToBank> {
  String selectedValue = 'USD wallet';
  String selectedValue1 = 'AOF Bank';
  String selectedValue2 = 'Nam Thang Long';

  List items = ['USD wallet', 'Japan wallet', 'Anything'];
  List items1 = ['AOF Bank', 'Japan bank', 'Anything'];
  List items2 = ['Nam Thang Long', 'Japan wallet', 'Anything'];

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
                  'Transfer\nto bank',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Choose wallet',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                ExpansionList(
                  onItemSelected: (selected) {
                    selectedValue = selected;
                  },
                  items: items,
                  title: selectedValue,
                ),
                SizedBox(height: 15),
                Text(
                  'Information',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                ExpansionList(
                  onItemSelected: (selected) {
                    selectedValue1 = selected;
                  },
                  items: items1,
                  title: selectedValue1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Swift code: 237482',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                ExpansionList(
                  onItemSelected: (selected) {
                    selectedValue2 = selected;
                  },
                  items: items2,
                  title: selectedValue2,
                ),
                SizedBox(
                  height: 17,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'AB27384003721'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Harry James'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Happy birthday!'),
                ),
                SizedBox(
                  height: 17,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: RaisedButton(
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => Bill()));
                      },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
