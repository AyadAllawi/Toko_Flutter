import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HalamanState();
}

class _HalamanState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hallo, Good Morning",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        automaticallyImplyLeading: false,
      ),

      // drawer: MyDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/foto/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              SizedBox(height: 50),
              Image.asset(
                'assets/images/foto/logo.jpg',
                fit: BoxFit.cover,
                width: 250,
                height: 130,
              ),
              const SizedBox(height: 20),
              const Text(
                "Selamat Datang di Rempoa Adventures!",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Lakukan Tugasmu dan tanggung jawabmu untuk perusahaan ini dengan iklhas",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
