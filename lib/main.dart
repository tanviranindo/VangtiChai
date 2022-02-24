import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vangtichai/logics.dart';
import 'app_constants.dart';

/// @author Tanvir Rahman
/// @ID 19101268

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VangtiChai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const VangtiChai(),
    );
  }
}

class VangtiChai extends StatefulWidget {
  const VangtiChai({Key? key}) : super(key: key);

  @override
  _VangtiChaiState createState() => _VangtiChaiState();
}

class _VangtiChaiState extends State<VangtiChai> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Calculation>(
      create: (context) => Calculation(),
      child: Consumer<Calculation>(
        builder: (context, calculate, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("VangtiChai"),
            ),
            body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                if (orientation == Orientation.portrait) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0, left: 15, right: 15, bottom: 40.0),
                          child: Text(
                            "Taka: " + calculate.getTotal(),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: textStyle,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: (((MediaQuery.of(context).size.height) * 3) / 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    for (var i = 0; i < calculate.notes.length; i++)
                                      Text(calculate.notes[i].toString() + ": " + calculate.noteCounts[i].toString(),
                                          maxLines: 3, overflow: TextOverflow.clip, style: textStyle),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  for (var i = 1; i <= 9; i += 3)
                                    Row(
                                      children: [
                                        for (var j = i; j < (i + 3); j++)
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: AspectRatio(
                                                aspectRatio: 1 / 1,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    calculate.setTotal("$j");
                                                  },
                                                  child: Container(
                                                    color: buttonColor,
                                                    child: Center(
                                                        child: Padding(
                                                      padding: const EdgeInsets.all(8),
                                                      child: Text(
                                                        "$j",
                                                        style: textStyle,
                                                      ),
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: AspectRatio(
                                            aspectRatio: 1 / 1,
                                            child: GestureDetector(
                                              onTap: () {
                                                calculate.setTotal("0");
                                              },
                                              child: Container(
                                                color: buttonColor,
                                                child: const Center(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    "0",
                                                    style: textStyle,
                                                  ),
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: AspectRatio(
                                            aspectRatio: 2 / 1,
                                            child: GestureDetector(
                                              onTap: () {
                                                calculate.clear();
                                              },
                                              child: Container(
                                                color: buttonColor,
                                                child: const Center(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    "CLEAR",
                                                    style: textStyle,
                                                  ),
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                          child: Text(
                            "Taka: " + calculate.getTotal(),
                            maxLines: 3,
                            overflow: TextOverflow.clip,
                            style: textStyle,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 15.0, bottom: 0.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) / 2,
                              height: (MediaQuery.of(context).size.height) - 160.0,
                              child: Column(
                                children: [
                                  for (var i = 0; i < 4; i++)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: (MediaQuery.of(context).size.height) / 7,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15, right: 15),
                                            child: Text(
                                              calculate.notes[i].toString() + ": " + calculate.noteCounts[i].toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.clip,
                                              style: textStyle,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: (MediaQuery.of(context).size.height) / 7,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15, right: 15),
                                            child: Text(
                                              calculate.notes[i + 4].toString() + ": " + calculate.noteCounts[i + 4].toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.clip,
                                              style: textStyle,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) / 2,
                              height: (MediaQuery.of(context).size.height) - 148.0,
                              child: Column(
                                children: [
                                  for (var i = 1; i <= 8; i += 4)
                                    Row(
                                      children: [
                                        for (var j = i; j < (i + 4); j++)
                                          Expanded(
                                            flex: 1,
                                            child: GestureDetector(
                                              onTap: () {
                                                calculate.setTotal("$j");
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Container(
                                                  color: buttonColor,
                                                  height: (MediaQuery.of(context).size.height) / 6,
                                                  child: Center(
                                                      child: Text(
                                                    "$j",
                                                    style: textStyle,
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            calculate.setTotal("9");
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                              height: (MediaQuery.of(context).size.height) / 6,
                                              color: buttonColor,
                                              child: const Center(
                                                  child: Text(
                                                "9",
                                                style: textStyle,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            calculate.setTotal("0");
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                              height: (MediaQuery.of(context).size.height) / 6,
                                              color: buttonColor,
                                              child: const Center(
                                                  child: Text(
                                                "0",
                                                style: textStyle,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            calculate.clear();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                              height: (MediaQuery.of(context).size.height) / 6,
                                              color: buttonColor,
                                              child: const Center(
                                                  child: Text(
                                                "CLEAR",
                                                style: textStyle,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
