import 'package:flutter/material.dart';
import 'package:pr/models/questions.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currValue = 1;

  Question question;

  @override
  void initState() {
    question = Question();
    super.initState();
    Question.get().then((value) {
      setState(() {
        question.description = value.description;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 23.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: 300.0,
                      height: 330.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 20.0,
                                  left: 25.0,
                                  right: 25.0),
                              child: Text(question.description)),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0,
                                bottom: 20.0,
                                left: 25.0,
                                right: 25.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      groupValue: _currValue,
                                      onChanged: (int i) =>
                                          setState(() => _currValue = i),
                                      value: 1,
                                    ),
                                    Text(question.answers[0].description)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      groupValue: _currValue,
                                      onChanged: (int i) =>
                                          setState(() => _currValue = i),
                                      value: 2,
                                    ),
                                    Text('data')
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      groupValue: _currValue,
                                      onChanged: (int i) =>
                                          setState(() => _currValue = i),
                                      value: 3,
                                    ),
                                    Text('data')
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      groupValue: _currValue,
                                      onChanged: (int i) =>
                                          setState(() => _currValue = i),
                                      value: 4,
                                    ),
                                    Text('data')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
