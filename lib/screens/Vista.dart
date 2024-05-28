import 'package:Lista_Compras/screens/Agregar.dart';
import 'package:Lista_Compras/screens/Editar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ViewItemsPage extends StatefulWidget {
  @override
  _ViewItemsPageState createState() => _ViewItemsPageState();
}

class _ViewItemsPageState extends State<ViewItemsPage> {
  final List<Map<String, dynamic>> items = [];
  int? _selectedIndex;

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _navigateToAddItemPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItemPage(
        onAddItem: (newItem) {
          setState(() {
            items.add(newItem);
          });
        },
      )),
    );
  }

  void _navigateToEditItemPage(BuildContext context) {
    if (_selectedIndex != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditItemPage(
            item: items[_selectedIndex!],
            index: _selectedIndex!,
            onEdit: (editedItem, index) {
              setState(() {
                items[index] = editedItem;
              });
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: kIsWeb
                  ? DecorationImage(
                      image: NetworkImage('https://c8.alamy.com/compfr/2c80h6r/modele-d-achat-en-ligne-sans-couture-objets-de-commerce-electronique-dessines-a-la-main-blancs-isoles-sur-fond-noir-illustration-vectorielle-2c80h6r.jpg'),
                      fit: BoxFit.cover, 
                    )
                  : DecorationImage(
                      image: AssetImage('assets/background_image.jpg'),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Column(
            children: [
              if (items.isEmpty)
               Container(
  color: Colors.white, 
  padding: EdgeInsets.all(8.0),
  child: Text(
    'No hay compras pendientes',
    style: TextStyle(fontSize: 18.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.black),
  ),
),

              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: _selectedIndex == index ? Colors.green[100] : Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      child: ListTile(
                        leading: Checkbox(
                          value: _selectedIndex == index,
                          onChanged: (bool? value) {
                            setState(() {
                              _selectedIndex = value! ? index : null;
                            });
                          },
                        ),
                        title: Text(
                          items[index]['name'],
                          style: TextStyle(fontFamily: 'Pacifico', fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        subtitle: Text(
                          'Precio: \$${items[index]['price']} \nCategoría: ${items[index]['category']}',
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 14.0, color: Colors.black87),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _removeItem(index);
                          },
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _navigateToAddItemPage(context),
                      icon: Icon(Icons.add),
                      label: Text('Agregar',
                                        style: TextStyle(color: Colors.white), 
),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _navigateToEditItemPage(context),
                      icon: Icon(Icons.edit), 
                      label: Text('Editar',
                                        style: TextStyle(color: Colors.white), 
),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
