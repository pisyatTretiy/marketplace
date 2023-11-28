import 'package:flutter/material.dart';
import 'package:vladik/ProfilePage.dart';
import 'package:vladik/SearchPage.dart';
import 'package:vladik/main.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int _currentIndex = 2; // Индекс страницы "Избранное"

  Widget _buildFavoritesBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildFavoriteCard('Product 1'),
        _buildFavoriteCard('Product 2'),
        _buildFavoriteCard('Product 3'),
        // Добавьте другие карточки избранных товаров по необходимости
      ],
    );
  }

  Widget _buildFavoriteCard(String productName) {
    return Card(
      child: ListTile(
        title: Text(productName),
        subtitle: Text('Description'),
        onTap: () {
          // Обработка нажатия на карточку (по вашему желанию)
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildFavoritesBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()),
              );
            } else if (_currentIndex == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()),
              ); // Замените на путь к странице поиска
            } else if (_currentIndex == 3) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),
              ); // Замените на путь к странице профиля
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Домой',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
            backgroundColor: Color(0xffb54426B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
