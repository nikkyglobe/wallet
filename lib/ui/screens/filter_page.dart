import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double val = 10;
  DateTime fromSelectedDate = DateTime.now();
  DateTime toSelectedDate = DateTime.now();

  Future<Null> _fromSelectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: fromSelectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != fromSelectedDate)
      setState(() {
        fromSelectedDate = picked;
      });
  }

  Future<Null> _toSelectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: toSelectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != toSelectedDate)
      setState(() {
        toSelectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 55.0,
            bottom: 20.0,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'From date',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () => _fromSelectDate(context),
                      child: Container(
                        height: 65,
                        child: Card(
                          elevation: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "${fromSelectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black54),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.date_range,
                                  color: Colors.grey,
                                ),
                                onPressed: () => _fromSelectDate(context),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'To date',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () => _toSelectDate(context),
                      child: Container(
                        height: 65,
                        child: Card(
                          elevation: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${toSelectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black54),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.date_range,
                                  color: Colors.grey,
                                ),
                                onPressed: () => _toSelectDate(context),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Amount of money',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      child: Center(
                          child: Text(
                        '\$${val.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      )),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            color: Colors.grey,
                            height: 20,
                            width: 2,
                          ),
                          Expanded(
                              child: Slider(
                            value: val,
                            onChanged: (e) => change(e),
                            activeColor: Colors.pinkAccent,
                            inactiveColor: Colors.grey,
                            divisions: 10000,
                            label: val.floor().toString(),
                            min: 10,
                            max: 10000,
                          )),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  color: Colors.grey,
                                  height: 20,
                                  width: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '\$10',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'over \$10000',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.pinkAccent,
                  child: Text(
                    "Apply",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void change(e) {
    setState(() {
      val = e;
    });
  }
}
