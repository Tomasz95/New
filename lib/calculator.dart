abstract class Calculator {
  BmiResult calculate(double height, double weight) {
    double bmiResult = bmi(height, weight);
    BmiState bmiState = state(bmiResult);
    return BmiResult(bmiResult, bmiState);
  }

  BmiState state(double bmi) {
    if (bmi <= 18.5) {
      return BmiState.underweight;
    } else if (bmi > 18.5 && bmi <= 24.5) {
      return BmiState.good_shape;
    } else if (bmi > 24.5 && bmi <= 29.5) {
      return BmiState.overwheight;
    } else {
      return BmiState.obsity;
    }
  }

  double bmi(double height, double weight);
}

class MetricCalculator extends Calculator {
  @override
  double bmi(double height, double weight) {
    // TODO: implement bmi
    return (weight / (height * height) * 10000);
  }
}

class ImperialCalculator extends Calculator {
  @override
  double bmi(double height, double weight) {
    // TODO: implement bmi
    return 703 * (weight / (height * height) * 10000);
  }
}

enum BmiState { underweight, good_shape, overwheight, obsity }

class BmiResult {
  double result;
  BmiState state;

  BmiResult(this.result, this.state) {}
}

//    return (weight / (height*height)*10000);
