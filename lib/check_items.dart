import 'package:flutter/material.dart';



class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListPage(),
    );
  }
}

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<Item> items = [
    Item(name: 'Item 1', info1: 'Info 1', info2: 'Info 2', info3: 'Info 3', info4: 'Unavailable', available: false),
    Item(name: 'Item 2', info1: 'Info 1', info2: 'Info 2', info3: 'Info 3', info4: 'Unavailable', available: true),
    Item(name: 'Item 3', info1: 'Info 1', info2: 'Info 2', info3: 'Info 3', info4: 'Available', available: true),
    Item(name: 'Item 4', info1: 'Info 1', info2: 'Info 2', info3: 'Info 3', info4: 'Out of Order', available: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Screen'),
      ),
      body: ListView(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text('Item Name')),
              DataColumn(label: Text('Info 1')),
              DataColumn(label: Text('Info 2')),
              DataColumn(label: Text('Info 3')),
              DataColumn(label: Text('Availibility Status')),
              DataColumn(label: Text('Available')),
            ],showBottomBorder: true,dividerThickness: 90,
            rows: items.map((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item.name)),
                  DataCell(Text(item.info1)),
                  DataCell(Text(item.info2)),
                  DataCell(Text(item.info3)),
                  DataCell(Text(item.info4)),
                  DataCell(Checkbox(
                    value: item.available,
                    onChanged: (bool? value) {
                      setState(() {
                        item.available = value!;
                      });
                    },
                  )),
                ],
              );
            }).toList(),
          ),
    ElevatedButton(
    onPressed: (()=>Navigator.of(context, rootNavigator: true).pushNamed("/request")),
    child: Text('Proceed to Request'))],
      ),
    );
  }
}

class Item {
  final String name;
  final String info1;
  final String info2;
  final String info3;
  final String info4;
  bool available;

  Item({
    required this.name,
    required this.info1,
    required this.info2,
    required this.info3,
    required this.info4,
    required this.available,
  });
}