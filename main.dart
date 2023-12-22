import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class ShoppingCartItem {
  String name;
  double price;
  int quantity;

  ShoppingCartItem(this.name, this.price, {this.quantity = 0});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VegetablesPage(selectedItems: []),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            backgroundColor: Colors.purple,
          ),
          child:Padding(
            padding: EdgeInsets.all(10),
          child: Text(
            "Start Shopping",
            style: TextStyle(color: Colors.white,fontSize: 25),
          ),
        ),
      ),),
    );
  }
}

class VegetablesPage extends StatefulWidget {
  final List<ShoppingCartItem> selectedItems;

  VegetablesPage({required this.selectedItems});

  @override
  _VegetablesPageState createState() => _VegetablesPageState();
}

class _VegetablesPageState extends State<VegetablesPage> {
  final List<ShoppingCartItem> vegetablesPageItems = [
    ShoppingCartItem("Cauliflower", 2.36),
    ShoppingCartItem("Potatoes", 1.25),
    ShoppingCartItem("Beans", 0.84),
    ShoppingCartItem("Cabbage", 1.34),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            'Choose Vegetables',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: vegetablesPageItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(vegetablesPageItems[index].name),
                      Text(
                        "\$${vegetablesPageItems[index].price.toStringAsFixed(2)} / Kg",
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 50,
                        child: Text("Qty: ${vegetablesPageItems[index].quantity}"),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            vegetablesPageItems[index].quantity++;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (vegetablesPageItems[index].quantity > 0) {
                              vegetablesPageItems[index].quantity--;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    if (vegetablesPageItems[index].quantity > 0) {
                      widget.selectedItems.add(vegetablesPageItems[index]);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FruitsPage(selectedItems: widget.selectedItems),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                // Implement logic to cancel and reset quantities
                for (var item in vegetablesPageItems) {
                  item.quantity = 0;
                }
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text("Cancel"),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FruitsPage(selectedItems: [...widget.selectedItems, ...vegetablesPageItems]),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class FruitsPage extends StatefulWidget {
  final List<ShoppingCartItem> selectedItems;

  FruitsPage({required this.selectedItems});

  @override
  _FruitsPageState createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  final List<ShoppingCartItem> fruitsPageItems = [
    ShoppingCartItem("Apple", 1.36),
    ShoppingCartItem("Grapes", 0.25),
    ShoppingCartItem("Banana", 2.84),
    ShoppingCartItem("Mangoes", 2.34),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            'Choose Fruits',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: fruitsPageItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(fruitsPageItems[index].name),
                      Text(
                        "\$${fruitsPageItems[index].price.toStringAsFixed(2)} / Kg",
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 50,
                        child: Text("Qty: ${fruitsPageItems[index].quantity}"),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            fruitsPageItems[index].quantity++;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (fruitsPageItems[index].quantity > 0) {
                              fruitsPageItems[index].quantity--;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    if (fruitsPageItems[index].quantity > 0) {
                      widget.selectedItems.add(fruitsPageItems[index]);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BillPage(selectedItems: widget.selectedItems),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                // Implement logic to cancel and reset quantities
                for (var item in fruitsPageItems) {
                  item.quantity = 0;
                }
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text("Cancel"),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BillPage(selectedItems: [...widget.selectedItems, ...fruitsPageItems]),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class BillPage extends StatelessWidget {
  final List<ShoppingCartItem> selectedItems;

  BillPage({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    // Remove items with a quantity of zero
    final filteredItems = selectedItems.where((item) => item.quantity > 0).toList();

    double total = filteredItems.fold(0, (previous, item) => previous + item.price * item.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bill',style: TextStyle(fontSize: 40)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Items Summary", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            for (var item in filteredItems)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${item.name} x ${item.quantity}", style: TextStyle(fontSize: 18)),
                  Text("\$${(item.price * item.quantity).toStringAsFixed(2)}", style: TextStyle(fontSize: 18)),
                ],
              ),
            SizedBox(height: 20),
            Text("Total: \$${total.toStringAsFixed(2)}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              child: Text("Cancel"),
            ),
            FloatingActionButton(
              onPressed: () {
                // Implement logic to cancel and reset quantities
                for (var item in filteredItems) {
                  item.quantity = 0;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartPage(),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
