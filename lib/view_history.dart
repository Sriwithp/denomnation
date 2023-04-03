import 'package:Denomination/history.dart';
import 'package:Denomination/manage_history.dart';
import 'package:flutter/material.dart';

class ViewHistory extends StatelessWidget {
  final i2000, i500, i200, i100, i50, i20, i10, i5, i2, i1, iTotal, iKey, date;
  const ViewHistory(
      {super.key,
      this.i2000,
      this.i500,
      this.i200,
      this.i100,
      this.i50,
      this.i20,
      this.i10,
      this.i5,
      this.i2,
      this.i1,
      this.iTotal,
      this.iKey,
      this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(date,
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.w700)),
                  Text("Total Amount: $iTotal"),
                  Text("${ManageHistory().toWord(iTotal)} Rupees Only/-"),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        Text((i2000 / 2000).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 2000", textAlign: TextAlign.center),
                        Text((i2000).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i500 / 500).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 500", textAlign: TextAlign.center),
                        Text((i500).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i200 / 200).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 200", textAlign: TextAlign.center),
                        Text((i200).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i100 / 100).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 100", textAlign: TextAlign.center),
                        Text((i100).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i50 / 50).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 50", textAlign: TextAlign.center),
                        Text((i50).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i20 / 20).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 20", textAlign: TextAlign.center),
                        Text((i20).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i10 / 10).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 10", textAlign: TextAlign.center),
                        Text((i10).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i5 / 5).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 5", textAlign: TextAlign.center),
                        Text((i5).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i2 / 2).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 2", textAlign: TextAlign.center),
                        Text((i2).toString(), textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text((i1 / 1).toString().replaceAll(".0", ""),
                            textAlign: TextAlign.center),
                        const Text("x 1", textAlign: TextAlign.center),
                        Text((i1).toString(), textAlign: TextAlign.center),
                      ]),
                    ],
                  ),
                  // SizedBox(height: 10),
                  // Icon(Icons.share)
                ],
              ),
            ),
          ),
          // SizedBox(height: 10),
          // Card(child: Icon(Icons.share))
        ],
      )),
    );
  }
}
