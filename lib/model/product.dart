import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/screens/shopping_screens.dart';
import 'package:flutter_toko_sederhana/screens/tambah_produk.dart';

class ProdukModel {
  String name;
  String price;
  int stok;
  String image;

  ProdukModel({
    required this.name,
    required this.price,
    required this.stok,
    required this.image,
  });
}

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  final List<ProdukModel> produkList = [
    ProdukModel(
      name: "Tenda Kecil",
      price: "Rp3.000",
      stok: 10,
      image: "assets/images/foto/tenda.jpg",
    ),
    ProdukModel(
      name: "Flysheet",
      price: "Rp5.000",
      stok: 15,
      image: "assets/images/foto/fly.jpg",
    ),
  ];

  void tambahProduk(ProdukModel produk) {
    setState(() {
      produkList.add(produk);
    });
  }

  void editProduk(int index, ProdukModel produk) {
    setState(() {
      produkList[index] = produk;
    });
  }

  void hapusProduk(int index) {
    setState(() {
      produkList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Eiger Store",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        leading: Image.asset('assets/images/foto/logo.jpg'),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 198, 211, 198),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shop()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produkList.length,
        itemBuilder: (context, index) {
          final model = produkList[index];
          return Card(
            child: ListTile(
              leading: Image.asset(
                model.image,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              title: Text(model.name),
              subtitle: Text("${model.price} | Stok: ${model.stok}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () async {
                      final hasil = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormProduk(produk: model),
                        ),
                      );
                      if (hasil != null) editProduk(index, hasil);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => hapusProduk(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormProduk()),
          );
          if (hasil != null) tambahProduk(hasil);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
