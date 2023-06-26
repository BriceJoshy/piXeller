import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Item {
  final String name;
  final int quantity;
  final double price;
  final String? imageUrl;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
    this.imageUrl,
  });
}

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<Item> _items = [];
  File? _image;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  void _fetchItems() {
    FirebaseFirestore.instance
        .collection('ItemList')
        .get()
        .then((querySnapshot) {
      setState(() {
        _items = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Item(
            name: data['name'],
            quantity: data['quantity'],
            price: data['price'],
            imageUrl: data['imageUrl'],
          );
        }).toList();
      });
    }).catchError((error) {
      print('Error fetching items: $error');
    });
  }

  Future<String> _uploadImage(File image) async {
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(image.path);
    firebase_storage.UploadTask uploadTask = ref.putFile(image);
    firebase_storage.TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addItem() async {
    String name = _nameController.text.trim();
    int quantity = int.tryParse(_quantityController.text) ?? 0;
    double price = double.tryParse(_priceController.text) ?? 0.0;

    if (name.isNotEmpty && quantity > 0 && price > 0.0) {
      Item newItem;

      if (_image != null) {
        String imageUrl = await _uploadImage(_image!);
        newItem = Item(
          name: name,
          quantity: quantity,
          price: price,
          imageUrl: imageUrl,
        );
      } else {
        newItem = Item(
          name: name,
          quantity: quantity,
          price: price,
        );
      }

      FirebaseFirestore.instance.collection('ItemList').add({
        'name': newItem.name,
        'quantity': newItem.quantity,
        'price': newItem.price,
        'imageUrl': newItem.imageUrl,
      }).then((value) {
        setState(() {
          _items.add(newItem);
        });

        _nameController.clear();
        _quantityController.clear();
        _priceController.clear();
        _image = null;
      }).catchError((error) {
        print('Error adding item: $error');
      });
    }
  }

  void _deleteItem(int index) {
    final item = _items[index];

    FirebaseFirestore.instance
        .collection('ItemList')
        .where('name', isEqualTo: item.name)
        .where('quantity', isEqualTo: item.quantity)
        .where('price', isEqualTo: item.price)
        .where('imageUrl', isEqualTo: item.imageUrl)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });

      setState(() {
        _items.removeAt(index);
      });
    }).catchError((error) {
      print('Error deleting item: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(
                labelText: 'Item Quantity',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Item Price',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _addItem,
            child: const Text('Add'),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  leading: item.imageUrl != null
                      ? Image.network(item.imageUrl!)
                      : null,
                  title: Text(item.name),
                  subtitle: Text(
                    'Quantity: ${item.quantity}, Price: \$${item.price.toStringAsFixed(2)}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectImage,
        child: const Icon(Icons.image),
      ),
    );
  }
}
