import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Order Page')),
      ),
      body: Center(
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)
          ),
          // Edit this part
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(52, 25, 83, 1),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(.60),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              label: 'Order',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Delivery',
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.location_on),
            ),
          ],
      )
    );
  }
}