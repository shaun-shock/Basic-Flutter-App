import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int _selectedIndex = 0;

  final List<String> catalogOptions = [
    'Requested Items',
    'Overdue Items',
    'Granted Items',
  ];

  Widget _buildCatalogContent() {
    switch (_selectedIndex) {
      case 0:
        return Option1Content();
      case 1:
        return Option2Content();
      case 2:
        return Option3Content();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: catalogOptions.map((option) {
              int index = catalogOptions.indexOf(option);
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: _selectedIndex==index?Colors.white:Colors.white24,

                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Text(option),
                      style: TextButton.styleFrom(
                        primary: _selectedIndex == index
                            ? Colors.blue
                            : Colors.black12,textStyle: TextStyle(fontSize: 20.0)

                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: _buildCatalogContent(),
          ),
        ],
      ),
    );
  }
}

class Option1Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Option 1 Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class Option2Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Option 2 Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class Option3Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Option 3 Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
