import 'package:flutter/material.dart';
import 'package:vladik/registration_page.dart';
import 'main.dart';
import 'package:vladik/FavoritesPage.dart';
import 'package:vladik/SearchPage.dart';
import 'profile.dart';
import 'methods.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthManager authManager = AuthManager();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _currentIndex = 3;
  bool _isAuth = false;
  bool _dataEntered = false;

  // Пример списка пользователей
  List<Map<String, String>> _users = [
    {'email': '123@mail.ru', 'password': '123'},
    // Добавьте здесь других пользователей при необходимости
  ];

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = await authManager.isLoggedIn();
    if(!isLoggedIn && _dataEntered) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage())
      );
    }
  }



  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _handleLogin(context);
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Text('Registration'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          if (_currentIndex == 0) {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (_currentIndex == 1) {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()),
            );
          } else if (_currentIndex == 2) {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => FavoritesPage()),
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
            backgroundColor: Color(0xffb54426B),
          ),
        ],
      ),
    );
  }

  void _handleLogin(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Проверка введенных данных с зарегистрированными пользователями
    for (var user in _users) {
      if (user['email'] == email && user['password'] == password) {
        // авторизация гуд
        await authManager.login();
        setState(() {
          _isAuth = true;
          _dataEntered = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Авторизация успешна'),
            duration: Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Готово',
              onPressed: () {
                if (_dataEntered) {
                  // Переход на страницу Profile.dart после успешной авторизации
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                }
              },
            ),
          ),
        );
        return;
      }
    }

    print('Неудачный вход');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Неверные email или пароль'),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
