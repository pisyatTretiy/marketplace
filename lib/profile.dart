import 'package:flutter/material.dart';
import 'package:vladik/FavoritesPage.dart';
import 'package:vladik/ProfilePage.dart';
import 'package:vladik/SearchPage.dart';
import 'package:vladik/main.dart';
import 'methods.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 3;
  AuthManager authManager = AuthManager();

  @override
  void initState() {
    super.initState();
    authManager = AuthManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb54426b),
        flexibleSpace: Center(
          child: Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://charts-static.billboard.com/img/2017/01/xxxtentacion-dms-344x344.jpg'),
            ),
            SizedBox(height: 16.0),
            Text(
              '123@mail.ru',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: ListView(
                children: [
                  ProfileButton('Мои отзывы и вопросы', onPressed: () {}),
                  ProfileButton('Мои заказы', onPressed: () {}),
                  ProfileButton('Мои возвраты', onPressed: () {}),
                  ProfileButton('Промокоды', onPressed: () {}),
                  ProfileButton('Мои избранные', onPressed: () {}),
                  ProfileButton('Уведомления', onPressed: () {}),
                  SizedBox(height: 32.0),
                  ProfileButton('Справка', onPressed: () {}),
                  ProfileButton('Служба поддержки', onPressed: () {}),
                  ProfileButton('Настройки', onPressed: () {}),
                  ProfileButton('Выйти', onPressed: () {
                    _handleLogout(context);
                  }, isLogoutButton: true),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (_currentIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (_currentIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          } else if (_currentIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
          } else if (_currentIndex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          }
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
            backgroundColor: Color(0xffb54426b),
          ),
        ],
      ),
    );
  }

  void _handleLogout(BuildContext context) async {
    await authManager.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLogoutButton;

  ProfileButton(this.text, {required this.onPressed, this.isLogoutButton = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
          color: isLogoutButton ? Colors.red : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, color: isLogoutButton ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
