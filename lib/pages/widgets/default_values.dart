import 'package:flutter/material.dart';
import 'package:poc_remote_config/remote_config/custom_remote_config.dart';

class DefaultValues extends StatefulWidget {
  const DefaultValues({Key? key}) : super(key: key);

  @override
  State<DefaultValues> createState() => _DefaultValuesState();
}

class _DefaultValuesState extends State<DefaultValues> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        width > 500
            ? Expanded(
                flex: 1,
                child: SizedBox(
                    height: 400, child: Image.asset('assets/png/defaults.png')))
            : Container(),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
                defaultColumnWidth: const FixedColumnWidth(120.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(
                      children: const [Text("IDENTIFIER")],
                    ),
                    Column(
                      children: const [Text("VALUE")],
                    )
                  ]),
                  TableRow(children: [
                    Column(
                      children: const [Text("boolExample")],
                    ),
                    Column(
                      children: [
                        Text(CustomRemoteConfig()
                            .getValueOrDefault(
                                key: "boolExample", defaultValue: false)
                            .toString()),
                      ],
                    )
                  ]),
                  TableRow(children: [
                    Column(
                      children: const [Text("doubleExample")],
                    ),
                    Column(
                      children: [
                        Text(CustomRemoteConfig()
                            .getValueOrDefault(
                                key: "doubleExample", defaultValue: 1.5)
                            .toString())
                      ],
                    )
                  ]),
                  TableRow(children: [
                    Column(
                      children: const [Text("intExample")],
                    ),
                    Column(
                      children: [
                        Text(CustomRemoteConfig()
                            .getValueOrDefault(
                                key: "intExample", defaultValue: 0)
                            .toString())
                      ],
                    )
                  ]),
                  TableRow(children: [
                    Column(
                      children: const [Text("textExample")],
                    ),
                    Column(
                      children: [
                        Text(CustomRemoteConfig()
                            .getValueOrDefault(
                                key: "textExample", defaultValue: "Text")
                            .toString())
                      ],
                    )
                  ])
                ]),
          ),
        ),
      ],
    );
    // return Row(
    //   children: [
    //     SizedBox(height: 400, child: Image.asset('assets/png/defaults.png')),
    //     Column(
    //       children: [
    //         Row(
    //           children: [
    //             const Text("boolExample"),
    //             const SizedBox(
    //               width: 30,
    //             ),
    // Text(CustomRemoteConfig()
    //     .getValueOrDefault(key: "boolExample", defaultValue: true)
    //     .toString())
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             const Text("doubleExample"),
    //             const SizedBox(
    //               width: 30,
    //             ),
    //             Text(CustomRemoteConfig()
    //                 .getValueOrDefault(key: "doubleExample", defaultValue: 0.0)
    //                 .toString())
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             const Text("intExample"),
    //             const SizedBox(
    //               width: 30,
    //             ),
    //             Text(CustomRemoteConfig()
    //                 .getValueOrDefault(key: "intExample", defaultValue: 0.0)
    //                 .toString())
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             const Text("textoExample"),
    //             const SizedBox(
    //               width: 30,
    //             ),
    // Text(CustomRemoteConfig()
    //     .getValueOrDefault(
    //         key: "textoExample", defaultValue: "Texto")
    //     .toString())
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
