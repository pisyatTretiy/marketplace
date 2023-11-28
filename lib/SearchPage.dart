import 'package:flutter/material.dart';
import 'main.dart';
import 'package:vladik/FavoritesPage.dart';
import 'package:vladik/ProfilePage.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/f595922d-6826-4de7-ab74-c3257892c33a.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/50e0be31-5c11-4fdc-8439-f8b8ebb1ff68.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/672496b6-e265-4519-a4fa-be5ba9b6388f.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ],
            ),

            SizedBox(height: 20), // Отступ

            // Вторая полоса
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/95447994-3c90-4a21-a381-a8c3f6547d48.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/e3c9eeb4-fe7e-4cbc-9873-d07a3c5baea4.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/df4e6caf-68e5-4a6b-a2f8-ee5a88ebf754.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                // Аналогично для остальных изображений
              ],
            ),

            SizedBox(height: 20), // Отступ

            // Третья полоса
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/bdf855b6-4f3b-4668-bf70-1228b032867e.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/f93dcf38-d22d-4660-969a-25fb0c2a1ec7.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://main-cdn.sbermegamarket.ru/upload/mnt/249b1aef-1f99-43e3-b4ca-c3dc94af2dcf.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Color(0xffb54426B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1, // Установите индекс текущей страницы (в данном случае, Search)
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
