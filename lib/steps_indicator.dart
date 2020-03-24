library steps_indicator;

import 'package:flutter/material.dart';

class StepsIndicator extends StatelessWidget {
  final int selectedStep;
  final int nbSteps;
  final Color selectedStepColorOut;
  final Color selectedStepColorIn;
  final Color doneStepColor;
  final Color unselectedStepColor;
  final Color doneLineColor;
  final Color undoneLineColor;
  final bool isHorizontal;
  final double lineLength;
  final double lineThickness;
  final double doneStepSize;
  final double unselectedStepSize;
  final double selectedStepSize;
  final double selectedStepBorderSize;
  final Widget doneStepWidget;
  final Widget Function(int) unselectedStepWidget;
  final Widget Function(int) selectedStepWidget;

  const StepsIndicator(
      {this.selectedStep = 0,
      this.nbSteps = 4,
      this.selectedStepColorOut = Colors.blue,
      this.selectedStepColorIn = Colors.white,
      this.doneStepColor = Colors.blue,
      this.unselectedStepColor = Colors.blue,
      this.doneLineColor = Colors.blue,
      this.undoneLineColor = Colors.blue,
      this.isHorizontal = true,
      this.lineLength = 40,
      this.lineThickness = 1,
      this.doneStepSize = 10,
      this.unselectedStepSize = 10,
      this.selectedStepSize = 14,
      this.selectedStepBorderSize = 1,
      this.doneStepWidget,
      this.unselectedStepWidget,
      this.selectedStepWidget});

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      // Display in Row
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (var i = 0; i < nbSteps; i++) stepBuilder(i),
        ],
      );
    } else {
      // Display in Column
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (var i = 0; i < nbSteps; i++) stepBuilder(i),
        ],
      );
    }
  }

  Widget stepBuilder(int i) {
    if (isHorizontal) {
      // Display in Row
      return (selectedStep == i
          ? Row(
              children: <Widget>[
                stepSelectedWidget(i),
                selectedStep == nbSteps ? stepLineDoneWidget() : Container(),
                i != nbSteps - 1 ? stepLineUndoneWidget() : Container()
              ],
            )
          : selectedStep > i
              ? Row(
                  children: <Widget>[
                    stepDoneWidget(),
                    i < nbSteps - 1 ? stepLineDoneWidget() : Container(),
                  ],
                )
              : Row(
                  children: <Widget>[
                    stepUnselectedWidget(i),
                    i != nbSteps - 1 ? stepLineUndoneWidget() : Container()
                  ],
                ));
    } else {
      // Display in Column
      return (selectedStep == i
          ? Column(
              children: <Widget>[
                stepSelectedWidget(i),
                selectedStep == nbSteps ? stepLineDoneWidget() : Container(),
                i != nbSteps - 1 ? stepLineUndoneWidget() : Container()
              ],
            )
          : selectedStep > i
              ? Column(
                  children: <Widget>[
                    stepDoneWidget(),
                    i < nbSteps - 1 ? stepLineDoneWidget() : Container(),
                  ],
                )
              : Column(
                  children: <Widget>[
                    stepUnselectedWidget(i),
                    i != nbSteps - 1 ? stepLineUndoneWidget() : Container()
                  ],
                ));
    }
  }

  Widget stepSelectedWidget(int index) {
    return Hero(
      tag: 'selectedStep',
      child: selectedStepWidget != null
          ? selectedStepWidget(index + 1)
          : ClipRRect(
              borderRadius: BorderRadius.circular(selectedStepSize),
              child: Container(
                  decoration: BoxDecoration(
                      color: selectedStepColorIn,
                      borderRadius: BorderRadius.circular(selectedStepSize),
                      border: Border.all(
                          width: selectedStepBorderSize,
                          color: selectedStepColorOut)),
                  height: selectedStepSize,
                  width: selectedStepSize,
                  child: Container()),
            ),
    );
  }

  Widget stepDoneWidget() {
    return doneStepWidget != null
        ? doneStepWidget
        : ClipRRect(
            borderRadius: BorderRadius.circular(doneStepSize),
            child: Container(
              color: doneStepColor,
              height: doneStepSize,
              width: doneStepSize,
              child: Container(),
            ),
          );
  }

  Widget stepUnselectedWidget(int index) {
    return unselectedStepWidget != null
        ? unselectedStepWidget(index + 1)
        : ClipRRect(
            borderRadius: BorderRadius.circular(unselectedStepSize),
            child: Container(
              color: unselectedStepColor,
              height: unselectedStepSize,
              width: unselectedStepSize,
              child: Container(),
            ),
          );
  }

  Widget stepLineDoneWidget() {
    return Container(
        height: isHorizontal ? lineThickness : lineLength,
        width: isHorizontal ? lineLength : lineThickness,
        color: doneLineColor);
  }

  Widget stepLineUndoneWidget() {
    return Container(
        height: isHorizontal ? lineThickness : lineLength,
        width: isHorizontal ? lineLength : lineThickness,
        color: undoneLineColor);
  }
}
