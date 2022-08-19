import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poc_remote_config/remote_config/custom_remote_config.dart';

class CountryValues extends StatefulWidget {
  const CountryValues({Key? key}) : super(key: key);

  @override
  State<CountryValues> createState() => _CountryValuesState();
}

late Map<String, dynamic> countryJson;
late Country country;
@override
void initState() {
  WidgetsFlutterBinding.ensureInitialized();

  initState();
}

class _CountryValuesState extends State<CountryValues> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    countryJson = jsonDecode(CustomRemoteConfig().getValueOrDefault(
        key: "CountryConditionalExample", defaultValue: "country"));
    country = Country.fromJson(countryJson);
    return Row(
      children: [
        width > 500
            ? Expanded(
                flex: 1,
                child: SizedBox(
                    height: 400,
                    child: Image.asset('assets/png/countries.png')))
            : Container(),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: Column(
                children: [
                  Text(country.name!),
                  Image.network(
                    country.flag!,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Country {
  String? name;
  String? flag;

  Country({this.name, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
  }
}
