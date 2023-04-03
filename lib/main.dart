import 'package:Denomination/history.dart';
import 'package:Denomination/manage_history.dart';
import 'package:Denomination/view_history.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("History");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Denomination',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'Flutter Denomination'),
        "/history": (context) => const History(),
        "view_history": (context) => const ViewHistory()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final history = Hive.box("History");
  int amountRequired = 0;
  int iTotal = 0,
      i2000 = 0,
      i500 = 0,
      i200 = 0,
      i100 = 0,
      i50 = 0,
      i20 = 0,
      i10 = 0,
      i5 = 0,
      i2 = 0,
      i1 = 0;

  ManageHistory manageHistory = ManageHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (iTotal == amountRequired) {
                  ManageHistory().addHistory(DateTime.now(), iTotal, i2000,
                      i500, i200, i100, i50, i20, i10, i5, i2, i1);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Added to history")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "Enter amount and denomination amount not same")));
                }
              });
            },
            icon: const Icon(Icons.save),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/history");
              },
              icon: const Icon(Icons.history))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              amountRequired =
                                  value.isEmpty ? 0 : int.parse(value);
                            });
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Enter Amount"))),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Total amount: ₹ ${iTotal = i2000 + i500 + i200 + i100 + i50 + i20 + i10 + i5 + i2 + i1}/-",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                    "${iTotal.bitLength < 1 ? "" : "${manageHistory.toWord((iTotal))} Rupees Only/-"} ",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.pink,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(
                      color:
                          iTotal == amountRequired ? Colors.teal : Colors.red,
                      width: 2.5),
                  children: [
                    TableRow(
                        decoration: BoxDecoration(
                            gradient: RadialGradient(
                                tileMode: TileMode.mirror,
                                colors: [
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              iTotal == amountRequired
                                  ? Colors.teal
                                  : Colors.red,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white
                            ])),
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("Count",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w800)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("Currency",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w800)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("Amount",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w800)),
                          ),
                        ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            i2000 = value.isEmpty ? 0 : int.parse(value) * 2000;
                          });
                        },
                      ),
                      const Center(child: Text("x 2000")),
                      Center(child: Text(i2000.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            i500 = value.isEmpty ? 0 : int.parse(value) * 500;
                          });
                        },
                      ),
                      const Center(child: Text("x 500")),
                      Center(child: Text(i500.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            i200 = value.isEmpty ? 0 : int.parse(value) * 200;
                          });
                        },
                      ),
                      const Center(child: Text("x 200")),
                      Center(child: Text(i200.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            i100 = value.isEmpty ? 0 : int.parse(value) * 100;
                          });
                        },
                      ),
                      const Center(child: Text("x 100")),
                      Center(child: Text(i100.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            i50 = value.isEmpty ? 0 : int.parse(value) * 50;
                          });
                        },
                      ),
                      const Center(child: Text("x 50")),
                      Center(child: Text(i50.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            i20 = value.isEmpty ? 0 : int.parse(value) * 20;
                          });
                        },
                      ),
                      const Center(child: Text("x 20")),
                      Center(child: Text(i20.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          setState(() {
                            i10 = value.isEmpty ? 0 : int.parse(value) * 10;
                          });
                        },
                      ),
                      const Center(child: Text("x 10")),
                      Center(child: Text(i10.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          setState(() {
                            i5 = value.isEmpty ? 0 : int.parse(value) * 5;
                          });
                        },
                      ),
                      const Center(child: Text("x 5")),
                      Center(child: Text(i5.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          setState(() {
                            i2 = value.isEmpty ? 0 : int.parse(value) * 2;
                          });
                        },
                      ),
                      const Center(child: Text("x 2")),
                      Center(child: Text(i2.toString())),
                    ]),
                    TableRow(children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            i1 = value.isEmpty ? 0 : 1 * int.parse(value);
                          });
                        },
                      ),
                      const Center(child: Text("x 1")),
                      Center(child: Text(i1.toString())),
                    ]),
                  ],
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
