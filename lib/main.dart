import 'package:exploring/Confirm%20Payment.dart';
import 'package:exploring/request_items.dart';

import 'check_items.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'catalog.dart';
import 'request_items.dart';
import 'package:exploring/Confirm Payment.dart';
import 'forgot_password_get_otp.dart';
import 'reset_password.dart';

void main()  {

  runApp(MaterialApp(
      routes:{
      "/" :(context)=> LoginPage(),
       "/search":(context)=>MyApp(),
      "/check_cart":(context)=>ItemScreen(),
        '/catalog': (content)=>CatalogScreen(),
        '/request' : (content)=>OrderStatusPage(),
        '/payment' : (content)=>PaymentGatewayScreen(),
       'forgor' : (content)=>EmailVerificationPage()
      }));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable List with Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    'Default Settings',
    'Local Host Activated',
    'Run with tethering Activated',
    'Examination',
    'Protected View',
    'Use Linux OS',
    'Use Microsoft Windows OS',
    'Internet Deactivated',
    'BITSAT Examination',
    'Administration Mode',
  ];

  List<String> filteredItems = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void filterItems(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredItems = items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredItems = items;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog Page',), centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: filterItems,
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                  onTap: (() {Navigator.of(context, rootNavigator: true).pushNamed("/check_cart");}),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: ((){Navigator.of(context, rootNavigator: true).pushNamed("/check_cart");}),
            child: Text('Request Items'),
          ),],
      ),
    );
  }
}
