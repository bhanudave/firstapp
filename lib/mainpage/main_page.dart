import 'dart:convert';

import 'package:firstapp/others/CountryPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class MyThirdPage extends StatefulWidget {
  @override
  _MyThirdPageState createState() => _MyThirdPageState();
}

class MyFourthPage extends StatefulWidget {
  @override
  _MyFourthPageState createState() => _MyFourthPageState();
}

/*Fragment Start*/
const List<String> tabNames = const <String>[
  'foo',
  'bar',
  'baz',
  'quox',
  'quuz',
  'corge',
  'grault',
  'garply',
  'waldo'
];

class _MyHomePageState extends State<MyHomePage> {
  int _screen = 0;
  int _count = 0;
  List data;

  // Declare this variable
  int selectedRadio;

  int _groupValue = -1;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
    selectedRadio = 0;
  }

  // Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabNames.length,
        child: new Scaffold(
//          appBar: AppBar(
//            title: Text('Home - TutorialKart'),
//          ),
          body: new TabBarView(
            // ignore: missing_return
            children: new List<Widget>.generate(tabNames.length, (int index) {
              switch (_screen) {
                case 0:
                  return new Center(
                    child: CountryPage(), // title: tabNames[index]
//                        child: new Text('First screen, ${tabNames[index]}, $_count'),
                  );
                case 1:
                  return new Center(
                      child: new SingleChildScrollView(
                          child: new ConstrainedBox(
                              constraints: new BoxConstraints(),
                              child: Column(children: <Widget>[
                                Center(
//                    child: new Text('Second screen'),
                                    child: Center(
                                        child: Column(children: <Widget>[
                                  Center(
                                    child: RaisedButton(
                                      child: Text('Go to Second Screen'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MySecondPage()),
                                        );
                                      },
                                      textColor: Colors.white,
                                      color: Colors.lightGreen,
                                    ),
                                  ),
                                  RadioListTile(
                                    value: 1,
                                    groupValue: selectedRadio,
                                    title: Text("Radio 1"),
                                    subtitle: Text("Radio 1 Subtitle"),
                                    activeColor: Colors.green,
                                    onChanged: (val) {
                                      print("Radio $val");
                                      setSelectedRadio(val);
                                    },
                                    secondary: OutlineButton(
                                      child: Text("Say Hi"),
                                      onPressed: () {
                                        print("Say Hello");
                                      },
                                    ),
                                    selected: false,
                                  ),
                                  RadioListTile(
                                    value: 2,
                                    groupValue: selectedRadio,
                                    title: Text("Radio 2"),
                                    subtitle: Text("Radio 2 Subtitle"),
                                    activeColor: Colors.green,
                                    onChanged: (val) {
                                      print("Radio $val");
                                      setSelectedRadio(val);
                                    },
                                    secondary: OutlineButton(
                                      child: Text("Say Hi"),
                                      onPressed: () {
                                        print("Say Hello");
                                      },
                                    ),
                                    selected: false,
                                  ),
                                  Radio(
                                    value: 3,
                                    groupValue: selectedRadio,
                                    activeColor: Colors.blue,
                                    onChanged: (val) {
                                      print("Radio $val");
                                      setSelectedRadio(val);
                                    },
                                  ),
                                  Radio(
                                    value: 4,
                                    groupValue: selectedRadio,
                                    activeColor: Colors.blue,
                                    onChanged: (val) {
                                      print("Radio $val");
                                      setSelectedRadio(val);
                                    },
                                  ),
                                  _myRadioButton(
                                    title: "Checkbox 0",
                                    value: 0,
                                    onChanged: (newValue) =>
                                        setState(() => _groupValue = newValue),
                                  ),
                                  _myRadioButton(
                                    title: "Checkbox 1",
                                    value: 1,
                                    onChanged: (newValue) =>
                                        setState(() => _groupValue = newValue),
                                  ),
                                  RaisedButton(child: Text('Disabled Button')),
                                  RaisedButton(
                                    child: Text('Default Enabled'),
                                    onPressed: () {
                                      print('IconButton is pressed');
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text('Text Color Changed'),
                                    textColor: Colors.red,
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Color Changed'),
                                    color: Colors.green,
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Button with Padding'),
                                    padding: EdgeInsets.all(20),
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('More Rounded Corners'),
                                    color: Colors.purpleAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0))),
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Elevation increased'),
                                    elevation: 5,
                                    onPressed: () {
                                      _launchURL();
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text('Splash Color as red'),
                                    splashColor: Colors.red,
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Zero Elevation'),
                                    elevation: 0,
                                    onPressed: () {
                                      _showScaffold(
                                          "This is a SnackBar called from another place.");
                                    },
                                  ),
                                  RaisedButton(
                                    onPressed: () {},
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            Color(0xFF0D47A1),
                                            Color(0xFF1976D2),
                                            Color(0xFF42A5F5),
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      child: const Text('Gradient Color'),
                                    ),
                                  ),
                                ])))
                              ]))));
                case 2:
//                  return new Center(
                  return new Scaffold(
//                    appBar: new AppBar(
//                        title: new Text(
//                          "Listviews",
//                          textAlign: TextAlign.justify,
//                        ),
//                        backgroundColor: Colors.purple),
                    body: new ListView.builder(
                      itemCount: data == null ? 0 : data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var post = data[index];
                        return new Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            child: Container(
                                child: Column(children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
//                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 12.0, 0, 6.0),
                                        child: Text(
                                          data[index]["title"],
                                          maxLines: 2,
//                                          sendersList[position],
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 12.0, 0, 6.0),
                                        child: Text(
                                          data[index]["body"],
//                                          subjectList[position],
                                          style: TextStyle(fontSize: 11.0),
                                          maxLines: 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
//                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "5m",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.star_border,
                                            size: 35.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 2.0,
                                color: Colors.grey,
                              )
                            ])));

//                            semanticContainer: true,
//                            clipBehavior: Clip.antiAliasWithSaveLayer,
//                            shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(10.0),
//                            ),
//                            elevation: 5,
//                            margin:
//                                EdgeInsets.only(left: 10, right: 10, top: 10),
//                            child: Container(
//                                height: 160,
//                                child: Stack(children: <Widget>[
//                                  Positioned(
//                                      top: 40,
//                                      left: 0,
//                                      right: 0,
//                                      bottom: 10,
//                                      child: Container(
//                                          color: Colors.white,
//                                          child: Column(
//                                            children: <Widget>[
//                                              Image.network(
//                                                'https://placeimg.com/640/480/any',
//                                                height: 90.0,
//                                                width: 90.0,
//                                                alignment:
//                                                    FractionalOffset.centerLeft,
////                                                fit: BoxFit.fill,
//                                              ),
////                                              child: new Text(data[index]["title"],),
////                                              shape: RoundedRectangleBorder(
////                                                borderRadius: BorderRadius.circular(12.0),
////                                              ),
////                                              elevation: 8,
//////                          margin: EdgeInsets.all(10),
////                                              margin: EdgeInsets.only(left: 10, right: 10, top: 12),
//                                            ],
//                                          ))),
//                                  new Text(data[index]["title"], textAlign: TextAlign.center, maxLines: 2, style: TextStyle(height: 3, fontSize: 12),),
////                                  new Text(data[index]["body"],),
//                                ])));
                      },
                    ),
//                    child: new Text('Third screen'),
                  );
              }
            }),
          ),
//          bottomNavigationBar: BottomAppBar(
//            shape: const CircularNotchedRectangle(),
//            child: Container(height: 50.0,),
//          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => launch("tel://9829194215"),
            child: new Icon(Icons.add_call),
//              child: new Text("Call me")

//            onPressed: () => setState(() => _count++),
//            tooltip: 'Increment Counter',
//            child: const Icon(Icons.add),
          ),
//          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new AnimatedCrossFade(
                firstChild: new Material(
                  color: Theme.of(context).primaryColor,
                  child: new TabBar(
                    isScrollable: true,
                    tabs: new List.generate(tabNames.length, (index) {
                      return new Tab(text: tabNames[index].toUpperCase());
                    }),
                  ),
                ),
                secondChild: new Container(),
                crossFadeState: _screen == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              ),
              new BottomNavigationBar(
                currentIndex: _screen,
                onTap: (int index) {
                  setState(() {
                    _screen = index;
                  });
                },
                items: [
                  new BottomNavigationBarItem(
                    icon: new Icon(Icons.account_balance),
                    title: new Text('Dashboard'),
                  ),
                  new BottomNavigationBarItem(
                    icon: new Icon(Icons.add_to_home_screen),
                    title: new Text('Home'),
                  ),
                  new BottomNavigationBarItem(
                    icon: new Icon(Icons.add_alert),
                    title: new Text('Notification'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _MySecondPageState extends State<MySecondPage> {
  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Screen'),
        ),
        body: Center(
            child: new SingleChildScrollView(
                child: new ConstrainedBox(
          constraints: new BoxConstraints(),
          child: Column(children: <Widget>[
            Center(
              child: RaisedButton(
                child: Text('Go back to Home Screen'),
                onPressed: () {
                  Navigator.pop(context);
                },
                textColor: Colors.white,
                color: Colors.lightGreen,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('Go to Third Screen'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyThirdPage()),
                  );
                },
                textColor: Colors.white,
                color: Colors.lightGreen,
              ),
            ),
            Center(
                child: Icon(
              Icons.directions_transit,
              color: Colors.red,
            )),
            Center(
                child: Icon(
              Icons.directions_transit,
              color: Colors.green,
              size: 70,
            )),
            Text('Trains',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Futura',
                  color: Colors.deepOrange,
                )),
            Center(
                child: Text(
              'Students',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            DataTable(
              columns: [
                DataColumn(label: Text('RollNo')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Class')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Arya')),
                  DataCell(Text('6')),
                ]),
                DataRow(cells: [
                  DataCell(Text('12')),
                  DataCell(Text('John')),
                  DataCell(Text('9')),
                ]),
                DataRow(cells: [
                  DataCell(Text('42')),
                  DataCell(Text('Tony')),
                  DataCell(Text('8')),
                ]),
              ],
            ),
            Text(
              'Raised Buttons with Different Properties',
              style: TextStyle(fontSize: 16),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                child: ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.add_comment),
                    Icon(Icons.airline_seat_individual_suite),
                    Icon(Icons.add_location),
                  ],
                  isSelected: _selections,
                  onPressed: (int index) {
                    setState(() {
                      _selections[index] = !_selections[index];
                    });
                  },
                )),
          ]),
        ))));
  }
}

class _MyThirdPageState extends State<MyThirdPage> {
  bool isSwitched = false;
  TextEditingController nameController = TextEditingController();
  String fullName = '';
  double iconSize = 40;

  double _fontSize = 20;

  void increaseFontSize() {
    setState(() {
      _fontSize = 30;
    });
  }

  double opacityLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Third Screen'),
        ),
        body: Center(
          child: new SingleChildScrollView(
              child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: Column(children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text('Go back to Second Screen'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textColor: Colors.white,
                  color: Colors.lightGreen,
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text('Go Checkbox'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyFourthPage()),
                    );
                  },
                  textColor: Colors.white,
                  color: Colors.lightGreen,
                ),
              ),
              MaterialButton(
                child: Text(
                  'Show details',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () => setState(() {
                  opacityLevel = 1.0;
                }),
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 3),
                opacity: opacityLevel,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Name: Bhanu Prakash Dave',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Age: 35',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Occupation: Android Developer',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Image.network('https://urlzs.com/RsqCz'),
              /*Download Image From URL*/
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    'Hello! Welcome to TutorialKart. We shall zoom this text when you long press on it.',
                    style: TextStyle(fontSize: _fontSize),
                    textAlign: TextAlign.center,
                  )),
              RaisedButton(
                onPressed: () => {increaseFontSize()},
                child: Text('Bigger Font'),
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                    onChanged: (text) {
                      setState(() {
                        fullName = text;
                        //you can access nameController in its scope to get
                        // the value of text entered as shown below
                        //fullName = nameController.text;
                      });
                    },
                  )),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(fullName),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 10),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Icon(
                          Icons.account_box,
                          size: iconSize,
                          color: Colors.deepPurple,
                        ),
                        Text('My Account')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.settings,
                          size: iconSize,
                          color: Colors.purple,
                        ),
                        Text('Settings')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.lightbulb_outline,
                          size: iconSize,
                          color: Colors.amber,
                        ),
                        Text('Ideas')
                      ]),
                    ]),
                    TableRow(children: [
                      Icon(
                        Icons.cake,
                        size: iconSize,
                        color: Colors.amberAccent,
                      ),
                      Icon(
                        Icons.voice_chat,
                        size: iconSize,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.add_location,
                        size: iconSize,
                        color: Colors.brown,
                      ),
                    ]),
                  ],
                ),
              ),
            ]),
          )),
        ));
  }
}

class _MyFourthPageState extends State {
  Map<String, bool> values = {
    'Apple': false,
    'Banana': false,
    'Cherry': false,
    'Mango': false,
    'Orange': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Fourth Screen'),
        ),
        body: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text('Go back to Third Screen'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textColor: Colors.white,
                  color: Colors.lightGreen,
                ),
              ),
              RaisedButton(
                child: Text(
                  " Get Selected Checkbox Items ",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: getCheckboxItems,
                color: Colors.deepOrange,
                textColor: Colors.white,
                splashColor: Colors.grey,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              Expanded(
                child: ListView(
                  children: values.keys.map((String key) {
                    return new CheckboxListTile(
                      title: new Text(key),
                      value: values[key],
                      activeColor: Colors.pink,
                      checkColor: Colors.white,
                      onChanged: (bool value) {
                        setState(() {
                          values[key] = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ]));
  }
}
