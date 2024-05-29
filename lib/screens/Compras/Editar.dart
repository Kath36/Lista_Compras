import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditItemPage extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final Function(Map<String, dynamic>, int) onEdit;
  final TextEditingController _productController;
  final TextEditingController _priceController;
  final TextEditingController _categoryController;

  EditItemPage({
    required this.item,
    required this.index,
    required this.onEdit,
  })  : _productController = TextEditingController(text: item['name']),
        _priceController = TextEditingController(text: item['price']),
        _categoryController = TextEditingController(text: item['category']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Producto',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _productController,
                      decoration: InputDecoration(
                        labelText: 'Nombre del Producto',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        labelText: 'Precio del Producto',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _categoryController,
                      decoration: InputDecoration(
                        labelText: 'Categoría del Producto',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_productController.text.isEmpty ||
                            _priceController.text.isEmpty ||
                            _categoryController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Por favor completa todos los campos.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          Map<String, dynamic> editedItem = {
                            'name': _productController.text,
                            'price': _priceController.text,
                            'category': _categoryController.text,
                          };
                          onEdit(editedItem, index);
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Guardar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
