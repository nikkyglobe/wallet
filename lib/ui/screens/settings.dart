import 'package:fiverr_test/ui/screens/home.dart';
import 'package:fiverr_test/ui/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool switchPayVal = true;
  bool switchNotVal = false;
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              ExpansionTile(
                // backgroundColor: Colors.grey,
                title: Text('Account'),

                children: <Widget>[
                  Divider(
                    height: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: ListTile(
                      // leading: Text(''),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Edit profile'),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  ListTile(
                    // leading: Text(''),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('Change password'),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                // leading: Text(''),
                title: Text('Manage wallet'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                // leading: Text(''),
                title: Text('Language'),
                trailing: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('english'),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                  // leading: Text(''),
                  title: Text('Fast payment'),
                  trailing: Switch(
                    value: switchPayVal,
                    onChanged: (bool newValue) {
                      setState(() {
                        switchPayVal = newValue;
                      });
                    },
                  )),
              Divider(
                height: 1,
              ),
              ListTile(
                  // leading: Text(''),
                  title: Text('Notification'),
                  trailing: Switch(
                    value: switchNotVal,
                    onChanged: (bool newValue) {
                      setState(() {
                        switchNotVal = newValue;
                      });
                    },
                  )),
              Divider(
                height: 1,
              ),
              ListTile(
                // leading: Text(''),
                title: Text('Manage bank link'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
              Divider(
                height: 1,
              ),
              ExpansionTile(
                // backgroundColor: Colors.grey,
                title: Text('Wallet security'),
                subtitle: LinearProgressIndicator(
                  value: .4,
                  backgroundColor: Colors.black12,
                  valueColor: AlwaysStoppedAnimation(Colors.yellow),
                ),

                children: <Widget>[
                  Divider(
                    height: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      // leading: Text(''),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Link 1'),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      // leading: Text(''),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Link 2'),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                ],
              ),
              Divider(
                height: 6,
              ),
              ListTile(
                // leading: Text(''),
                title: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text('Verify mail'),
                ),
                trailing: Icon(
                  Icons.done,
                  size: 25,
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                // leading: Text(''),
                title: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text('Verify identity card'),
                ),
                trailing: Icon(
                  Icons.done,
                  size: 25,
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                // leading: Text(''),
                title: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text('Verify phone No.'),
                ),
                trailing: Icon(
                  Icons.done,
                  size: 25,
                  color: Colors.green,
                ),
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Support ?',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
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
