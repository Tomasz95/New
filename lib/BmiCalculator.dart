import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculator.dart';

class BmiCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }
}

class BMIState extends State<BmiCalculator> {
  Calculator calculator = new MetricCalculator();

  BmiResult _calculation;
  String _calcResult;
  String _result;
  bool change = false;

  TextEditingController _ageFieldController = new TextEditingController();
  TextEditingController _heightFieldController = new TextEditingController();
  TextEditingController _weightFieldController = new TextEditingController();

  void calculateBMI() {
    double height = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);

    if (height != null && weight != null) {
      setState(() {
        _calculation = calculator.calculate(height, weight);
        _calcResult = _calculation.result.toStringAsFixed(2);
        if (_calculation.state == BmiState.underweight) {
          _result = "Niedowaga";
        } else if (_calculation.state == BmiState.good_shape) {
          _result = "Dobra forma";
        } else if (_calculation.state == BmiState.overwheight) {
          _result = "Nadwaga";
        } else {
          _result = "Otyłość";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();   // czemu to wygenerowało mi sie automatycznie

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: new Text('BMI Kalkulator'),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(3.5),
        children: <Widget>[
          new Image.asset(
            "images/a.jpg",
            height: 120.0,
            width: 150.0,
          ),
          new Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(5.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                  value: change,
                  onChanged: (bool value) {

                    if(value == false){
                      calculator = MetricCalculator();

                    }else{
                      calculator = ImperialCalculator();

                    }
                    change = value;
                    setState(() {

                    });
                  },

                ),
                new TextField(
                  controller: _ageFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: 'Wprowdź wiek',
                      icon: new Icon(Icons.calendar_today)),
                ),
                new TextField(
                  controller: _heightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: change ? 'Wprowadź swój wzrost w stopach ' : 'Wprowadź swój wzrost w centymetrach',
                      icon: new Icon(Icons.info)),
                ),
                new TextField(
                  controller: _weightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: change ? 'Wprowadź swóją  wagę w funtach' : 'Wprowadź swóją  wagę w kilogramach',
                      icon: new Icon(Icons.shutter_speed)),
                ),
                new Padding(padding: const EdgeInsets.all(7.5)),
                new RaisedButton(
                  onPressed: calculateBMI,
                  child: new Text(
                    'Oblicz',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
          new Padding(padding: const EdgeInsets.all(5.5)),
          new Container(
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  _calcResult != null ? '$_calcResult' : '',
                  style: new TextStyle(
                    color: Colors.red,
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                new Text(
                  _calcResult != null ? '$_result' : '',
                  style: new TextStyle(fontSize: 45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// dodać zmiane wartości (po kliknięciu switcha żeby przeliczało wartość)s
}
