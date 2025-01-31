import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return myAppState();
  }
}

class myAppState extends State<MyApp> {
  final TextEditingController weightCon = TextEditingController();
  final TextEditingController heightCon = TextEditingController();

  String? selectedWeightUnit = "Kilograms (kg)";
  String? selectedHeightUnit = "Centimeters (cm)";

  double bmiResult = 0.0;
  String bmiCategory = "";

  Color bmiColor = Colors.grey;

  void calculateBMI() {
    double weight = double.tryParse(weightCon.text) ?? 0;
    double height = double.tryParse(heightCon.text) ?? 0;

    // Convert weight to kilograms if in pounds
    if (selectedWeightUnit == "Pounds (lbs)") {
      weight = weight * 0.453592; // Convert lbs to kg
    }

    // Convert height to meters
    if (selectedHeightUnit == "Centimeters (cm)") {
      height = height / 100; // Convert cm to meters
    } else if (selectedHeightUnit == "Feet (ft)") {
      height = height * 0.3048; // Convert feet to meters
    } else if (selectedHeightUnit == "Inches (in)") {
      height = height * 0.0254; // Convert inches to meters
    }

    // Calculate BMI if valid inputs
    if (weight > 0 && height > 0) {
      setState(() {
        bmiResult = weight / (height * height);
        bmiCategory = getBMICategory(bmiResult);
      });
    } else {
      setState(() {
        bmiResult = 0.0;
        bmiCategory = "Invalid Input";
      });
    }
    bmiColor = getBMIColor(bmiResult);
    print(' bmiResult $bmiResult ');
    print(' bmiCategory $bmiCategory ');
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi >= 18.5 && bmi < 25) return "Normal weight";
    if (bmi >= 25 && bmi < 30) return "Overweight";
    return "Obese";
  }

  // Get color for BMI category
  Color getBMIColor(double bmiValue) {
    if (bmiValue < 18.5) {
      return Colors.blue; // Underweight
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      return Colors.green; // Normal weight
    } else if (bmiValue >= 25 && bmiValue < 30) {
      return Colors.orange; // Overweight
    } else {
      return Colors.red; // Obesity
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "BMI Calculator",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            //physics: NeverScrollableScrollPhysics(), // Disable scrolling
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   'Weight',
                      //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      // ),
                      DropdownButton<String>(
                        value: selectedWeightUnit,
                        hint: Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        //icon: Icon(Icons.arrow_drop_down),
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 20), // Adjust the space here
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        isExpanded: false, // Set true if you want full width
                        items: <String>["Kilograms (kg)", "Pounds (lbs)"]
                            .map((String WeightUnit) => DropdownMenuItem<String>(
                                  value: WeightUnit,
                                  child: Text(
                                    WeightUnit,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                        onChanged: (String? newWeightUnit) {
                          setState(() {
                            selectedWeightUnit = newWeightUnit;
                            print(newWeightUnit);
                          });
                        },
                      ),

                      SizedBox(
                        width: 110,
                        child: TextField(
                          controller: weightCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Weight',
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5),
                                borderRadius: BorderRadius.circular(12.0)),
                            fillColor: Colors.grey[200], // Background color
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   'Height',
                      //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      // ),

                      DropdownButton<String>(
                        value: selectedHeightUnit,
                        hint: Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(Icons.arrow_drop_down),
                        isExpanded: false, // Set true if you want full width
                        items: <String>[
                          "Centimeters (cm)",
                          "Meters (m)",
                          "Feet (ft)",
                          "Inches (in)"
                        ]
                            .map((String HeightUnit) => DropdownMenuItem<String>(
                                  value: HeightUnit,
                                  child: Text(
                                    HeightUnit,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                        onChanged: (String? newHeightUnit) {
                          setState(() {
                            selectedHeightUnit = newHeightUnit;
                            print(newHeightUnit);
                          });
                        },
                      ),

                      Container(
                        width: 110,
                        child: TextField(
                          controller: heightCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Height',
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5),
                                borderRadius: BorderRadius.circular(12.0)),
                            fillColor: Colors.grey[200], // Background color
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      calculateBMI();
                      FocusScope.of(context).unfocus();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      side: BorderSide(
                        color: Colors.blue, // Border color
                        width: 2.0, // Border width
                      ),
                      backgroundColor: Colors.blue[900],
                      elevation: 5,
                      shadowColor: Colors.purple,
                      overlayColor: Color(0xffef0000),
                    ),
                    child: Text(
                      'Check BMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  // Display BMI Result
                  Text(
                    "BMI: ${bmiResult.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Category: $bmiCategory",
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: bmiColor.withOpacity(0.3), // Light background color
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor:
                          (bmiResult / 40), // Adjust to show percentage of 40
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: bmiColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),

                  SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                //width: 87,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: Text(
                                  'Under W.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                //width: 87,
                                height: 25,
                                color: Colors.green,
                                child: Text(
                                  'Normal W.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                //width: 87,
                                height: 25,
                                color: Colors.orange,
                                child: Text(
                                  'Over W.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                //width: 87,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Text(
                                  'Obese',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('16.0'),
                            Text('18.5'),
                            Text('25.0'),
                            Text('30.0'),
                            Text('30+'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
