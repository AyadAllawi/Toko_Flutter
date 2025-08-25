import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/extension/navigation.dart';
import 'package:flutter_toko_sederhana/preference/shared_preference.dart';
import 'package:flutter_toko_sederhana/views/login.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PROFIL LENGKAP",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFF349A9B),
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              PreferenceHandler.removeLogin();
              context.pushReplacement(Login());
            },
            icon: Icon(Icons.logout, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: Color(0xFF2A7B7C),
              padding: EdgeInsets.all(12.0),
            ),
          ),
        ],
      ),

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/foto/back.jpg"),
            fit: BoxFit.cover,
            opacity: 0.9,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/foto/ayad.jpg'),
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'AYAD ALLAWI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 24),

                // Contact Info Cards
                _buildInfoCard(
                  icon: Icons.email,
                  text: 'ayadallawi315@gmail.com',
                ),
                _buildInfoCard(icon: Icons.phone, text: '085880475905'),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.post_add,
                          label: 'Postingan',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.people,
                          label: 'Followers',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Halo! Saya Ayad, seorang lulusan SMA yang sedang belajar sebagai pengembang Flutter pemula, membangun UI yang keren dan kreatif',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF349A9B), Color(0xFF2A7B7C)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'AYAD PROGRAMING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF349A9B).withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 22),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF349A9B).withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
