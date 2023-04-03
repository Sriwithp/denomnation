import 'package:Denomination/manage_history.dart';
import 'package:Denomination/view_history.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final history = Hive.box("History");
  List<Map<String, dynamic>> historyItems = [];
  ManageHistory manageHistory = ManageHistory();

  @override
  void initState() {
    super.initState();
    historyItems = manageHistory.getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Denomination History"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () {
                manageHistory.deleteHistory();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("All Items Deleted")));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete)),
          const SizedBox(width: 10)
        ],
      ),
      body: ListView.builder(
          itemCount: historyItems.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewHistory(
                                i2000: historyItems[index]["2000"],
                                i500: historyItems[index]["500"],
                                i200: historyItems[index]["200"],
                                i100: historyItems[index]["100"],
                                i50: historyItems[index]["50"],
                                i20: historyItems[index]["20"],
                                i10: historyItems[index]["10"],
                                i5: historyItems[index]["5"],
                                i2: historyItems[index]["2"],
                                i1: historyItems[index]["1"],
                                iTotal: historyItems[index]["total"],
                                date: historyItems[index]["date"],
                              )));
                },
                title: Text(historyItems[index]["date"].toString(),
                    style: const TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.w700)),
                subtitle: Text(historyItems[index]["total"].toString()),
                leading: CircleAvatar(child: Text((index + 1).toString())),
                trailing: IconButton(
                    onPressed: () {
                      history.delete(historyItems[index]["key"]);
                      setState(() {
                        historyItems = manageHistory.getHistory();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Item deleted")));
                      });
                    },
                    icon: const Icon(Icons.delete)),
              ),
            );
          })),
    );
  }
}
