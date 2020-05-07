import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 55.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Payment',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: Card(
                      elevation: 6,
                      child: Container(
                        // width: MediaQuery.of(context).size.width * .5,
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/paybill.png',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170 * .25,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Bills',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '3 bills has not been paid',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Detail',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: Card(
                      elevation: 6,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset('assets/images/payservice.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170 * .20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Booking flight to receive',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '20% discount',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Detail',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: Card(
                      elevation: 6,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset('assets/images/payservice.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170 * .20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Booking flight to receive',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '20% discount',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Detail',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: Card(
                      elevation: 6,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset('assets/images/payservice.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170 * .20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Booking flight to receive',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '20% discount',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Detail',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: Card(
                      elevation: 6,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset('assets/images/payservice.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170 * .20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Booking flight to receive',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '20% discount',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Detail',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
