import 'package:flutter/material.dart';
import 'package:pr/models/questions.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currValue;
  bool _selected;

  Question question;

  _init() {
    _currValue = -1;
    _selected = false;
    question = Question();
    Question.get().then((value) {
      setState(() {
        question = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 23.0),
        child: Card(
          elevation: 2.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text(question.description),
              ),
              Container(
                height: 225.0,
                child: ListView.builder(
                  itemCount: question.answers.length,
                  itemBuilder: (context, index) => Card(
                    color: question.answers[index].color,
                    elevation: 2.5,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          groupValue: _currValue,
                          activeColor: Colors.black,
                          onChanged: (int i) {
                            if (!_selected) {
                              _selected = !_selected;
                              question.answers[index].right
                                  ? question.answers[index].color = Colors.green
                                  : question.answers[index].color = Colors.red;
                              setState(() => _currValue = i);
                            }
                          },
                          value: index,
                        ),
                        Flexible(
                                                  child: Text(question.answers[index].description,
                              softWrap: true,
                              style: TextStyle(fontSize: 13.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text('Próxima'),
                  onPressed: () => _init(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
