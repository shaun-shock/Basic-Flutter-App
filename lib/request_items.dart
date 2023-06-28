import 'package:flutter/material.dart';

class OrderStatusPage extends StatefulWidget {
  @override
  _OrderStatusPageState createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  List<Order> orders = [
    Order(id: 1, status: 'Available'),
    Order(id: 2, status: 'Available'),
    Order(id: 3, status: 'Not Available'),
  ];

  List<Order> selectedOrders = [];

  void toggleOrderSelection(Order order) {
    if (selectedOrders.contains(order)) {
      setState(() {
        selectedOrders.remove(order);
      });
    } else {
      setState(() {
        selectedOrders.add(order);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Requests'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final isSelected = selectedOrders.contains(order);

          return ListTile(
            title: Text('Order ${order.id}'),
            subtitle: Text('Status: ${order.status}'),
            trailing: Checkbox(
              value: isSelected,
              onChanged: (_) => toggleOrderSelection(order),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: selectedOrders.isEmpty ? null : () {
              Navigator.of(context, rootNavigator: true).pushNamed("/payment");
        },
        label: Text('Request Items'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Order {
  final int id;
  final String status;

  Order({required this.id, required this.status});
}
