import 'package:flutter/material.dart';
import 'package:poc_remote_config/pages/widgets/country_values.dart';
import 'package:poc_remote_config/pages/widgets/default_values.dart';
import 'package:poc_remote_config/pages/widgets/platforms_values.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  List<Step> steps = const <Step>[
    Step(title: Text('DEFAULT VALUES'), content: DefaultValues()),
    Step(
        title: Text('DIFFERENT VALUES IN DIFFERENT PLATFORMS'),
        content: PlatformsValues()),
    Step(
        title: Text('DIFFERENT VALUES IN DIFFERENT COUNTRIES'),
        content: CountryValues()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stepper(
          // type: StepperType.horizontal,
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < steps.length) {
              if (_index == steps.length - 1) {
                setState(() {
                  _index = 0;
                });
              } else {
                setState(() {
                  _index += 1;
                });
              }
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },

          steps: steps,
        ),
      ),
    );
  }
}
