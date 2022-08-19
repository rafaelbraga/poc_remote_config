import 'package:flutter/material.dart';
import '../../remote_config/custom_remote_config.dart';

class PlatformsValues extends StatefulWidget {
  const PlatformsValues({Key? key}) : super(key: key);

  @override
  State<PlatformsValues> createState() => _PlatformsValuesState();
}

class _PlatformsValuesState extends State<PlatformsValues> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var plarform = CustomRemoteConfig()
        .getValueOrDefault(key: "platformExample", defaultValue: "platform?")
        .toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        width > 500
            ? Expanded(
                flex: 1,
                child: SizedBox(
                    height: 400,
                    child: Image.asset('assets/png/platforms.png')))
            : Container(),
        Expanded(
          flex: 1,
          child: Center(
            child: Column(
              children: [
                Text(plarform.toString()),
                if (ThemeData().platform == TargetPlatform.iOS)
                  const Icon(Icons.apple),
                if (ThemeData().platform == TargetPlatform.android)
                  const Icon(Icons.android),
                if (ThemeData().platform == TargetPlatform.macOS ||
                    ThemeData().platform == TargetPlatform.windows)
                  const Icon(Icons.browser_updated)
              ],
            ),
          ),
        )
      ],
    );
  }
}
