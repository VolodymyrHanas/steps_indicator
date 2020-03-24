import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps Indicator Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Steps Indicator Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedStep = 0;
  int nbSteps = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StepsIndicator(
            selectedStep: selectedStep,
            lineThickness: 2.0,
            nbSteps: nbSteps,
            doneLineColor: Colors.red,
            undoneLineColor: Colors.grey,
            unselectedStepWidget: (index) => UnselectedStep(index),
            selectedStepWidget: (index) => SelectedStep(index),
            doneStepWidget: DoneStep(),
          ),
          Container(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  if (selectedStep > 0) {
                    setState(() {
                      selectedStep--;
                    });
                  }
                },
                child: Text('Prev'),
              ),
              Container(width: 50),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  if (selectedStep < nbSteps) {
                    setState(() {
                      selectedStep++;
                    });
                  }
                },
                child: Text('Next'),
              )
            ],
          )
        ],
      )),
    );
  }
}

class UnselectedStep extends StatelessWidget {
  final int index;

  const UnselectedStep(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class SelectedStep extends StatelessWidget {
  final int index;

  const SelectedStep(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class DoneStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset("lib/done.png", width: 10, height: 10,)
      ),
    );
  }
}



