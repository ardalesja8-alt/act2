import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MaterialApp and Scaffold
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drink Menu',
      home: Scaffold(
        // 2. AppBar titled "My Drink Menu"
        appBar: AppBar(
          title: const Text("My Drink Menu"),
          backgroundColor: Colors.green[400],
          centerTitle: true,
        ),
        body: const DrinkMenuScreen(),
      ),
    );
  }
}

class DrinkMenuScreen extends StatelessWidget {
  const DrinkMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of drinks - for ListView
    final drinks = [
      {"name": "Caramel Macchiato", "price": "₱150", "icon": Icons.coffee},
      {"name": "Milktea Classic", "price": "₱99", "icon": Icons.local_drink},
      {"name": "Mango Smoothie", "price": "₱120", "icon": Icons.emoji_food_beverage},
      {"name": "Iced Americano", "price": "₱110", "icon": Icons.coffee_maker},
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      // 5. ListView of at least 3 drinks
      child: ListView.builder(
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          return Container(
            // CHALLENGE: Use Container to style each drink card
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.brown[50],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.brown.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 3. A Column with a title and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinks[index]["name"] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      drinks[index]["price"] as String,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.brown[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // 4. A Row with an icon and a button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      drinks[index]["icon"] as IconData,
                      color: Colors.brown,
                      size: 28,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${drinks[index]["name"]} added to cart!'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[400],
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Order"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}