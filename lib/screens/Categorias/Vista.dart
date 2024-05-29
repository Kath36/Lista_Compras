import 'package:flutter/material.dart';

class ViewCategoriesPage extends StatefulWidget {
  final List<String> categories;
  final Function(String) onAddCategory;

  ViewCategoriesPage({required this.categories, required this.onAddCategory});

  @override
  _ViewCategoriesPageState createState() => _ViewCategoriesPageState();
}

class _ViewCategoriesPageState extends State<ViewCategoriesPage> {
  final TextEditingController _categoryNameController = TextEditingController();

  void _addCategory() {
    if (_categoryNameController.text.isNotEmpty) {
      widget.onAddCategory(_categoryNameController.text);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor ingrese un nombre de categoría.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.categories[index]),
                  );
                },
              ),
            ),
            TextField(
              controller: _categoryNameController,
              decoration: InputDecoration(
                labelText: 'Nombre de Categoría',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addCategory,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: Text(
                'Agregar Categoría',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
