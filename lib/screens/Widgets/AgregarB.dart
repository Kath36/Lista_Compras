import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final String price;
  final String category;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final bool selected;

  const CustomListItem({
    required this.title,
    required this.price,
    required this.category,
    required this.onTap,
    required this.onLongPress,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.green[100] : Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        leading: Checkbox(
          value: selected,
          onChanged: (_) {
            onLongPress();
          },
        ),
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Pacifico', fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          'Precio: \$${price} \nCategoría: $category',
          style: TextStyle(fontFamily: 'Roboto', fontSize: 14.0, color: Colors.black87),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onLongPress,
        ),
        onTap: onTap,
      ),
    );
  }
}
