import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sale Foid - Food Sales App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const FoodSalesHomePage(),
    );
  }
}

class FoodSalesHomePage extends StatefulWidget {
  const FoodSalesHomePage({super.key});

  @override
  State<FoodSalesHomePage> createState() => _FoodSalesHomePageState();
}

class _FoodSalesHomePageState extends State<FoodSalesHomePage> {
  // Sample food items data
  final List<Map<String, dynamic>> foodItems = [
    {'name': 'Pizza', 'price': 12.99, 'image': Icons.local_pizza},
    {'name': 'Burger', 'price': 8.99, 'image': Icons.fastfood},
    {'name': 'Pasta', 'price': 10.50, 'image': Icons.restaurant},
    {'name': 'Salad', 'price': 6.99, 'image': Icons.eco},
    {'name': 'Ice Cream', 'price': 4.50, 'image': Icons.icecream},
  ];

  // Cart to hold selected items
  final List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });
  }

  double get totalPrice => cart.fold(0.0, (sum, item) => sum + (item['price'] as double));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale Foid - Food Sales'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(item['image'], size: 40, color: Colors.orange),
                    title: Text(item['name']),
                    subtitle: Text('\$${item['price'].toStringAsFixed(2)}'),
                    trailing: ElevatedButton(
                      onPressed: () => addToCart(item),
                      child: const Text('Add to Cart'),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cart Items: ${cart.length}'),
                Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}