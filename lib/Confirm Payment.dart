import 'package:flutter/material.dart';

class PaymentGatewayScreen extends StatefulWidget {
  @override
  _PaymentGatewayScreenState createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  List<Item> items = [
    Item(name: 'Item 1', price: 400),
    Item(name: 'Item 2', price: 399),
    Item(name: 'Item 3', price: 110),
  ];

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  bool isChecked = false;

  void confirmPayment() {
    if (isChecked) {
      // Proceed to next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentConfirmationPage(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmation Required'),
            content: Text('Please confirm the items and grant permission to proceed.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Gateway'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Items:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('\Rs.${item.price.toStringAsFixed(2)}'),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Price:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '\Rs.${getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          CheckboxListTile(
            title: Text('I confirm the items and I grant permission to pay charges through SWD'),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: confirmPayment,
              child: Text('Confirm Payment'),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Payment Successful!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(onPressed: ()=> Navigator.of(context, rootNavigator: true).pushNamed("/catalog"), child: Text('Go to Requested Items'))
        ],
      ),
    );
  }
}

class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});
}
