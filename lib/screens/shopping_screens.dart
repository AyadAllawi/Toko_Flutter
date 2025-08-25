import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/screens/tambah_produk.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ini Halaman Belanja"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.javascript),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/foto/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Selamat Datang Di Halaman Belanja"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormProduk()),
                  );
                },
                child: Text("Tambah Produk"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
