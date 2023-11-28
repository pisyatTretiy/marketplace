import 'package:flutter/material.dart';
import 'SearchPage.dart';
import 'package:vladik/FavoritesPage.dart';
import 'main.dart';
import 'package:vladik/ProfilePage.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  int _currentIndex = 3;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Registration')),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffb54426B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth (DD.MM.YYYY)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Date of Birth is required';
                  }
                  // Добавьте дополнительные проверки формата даты здесь, если необходимо
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _handleRegistration(context);
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (_currentIndex == 1) {
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
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xffb54426B),
          ),
        ],
      ),
    );
  }

  void _handleRegistration(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Ваша логика для обработки регистрации
      // Можете использовать тот же подход с списком пользователей, как в предыдущем примере
      // Добавьте нового пользователя в список или в свою логику регистрации

      // Проверка успешности регистрации
      bool registrationSuccess = true; // Замените на вашу логику

      // Оповещение о результате регистрации
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            registrationSuccess
                ? 'Регистрация прошла успешно'
                : 'Ошибка регистрации',
          ),
          duration: Duration(seconds: 5),
          action: registrationSuccess
              ? SnackBarAction(
            label: 'Готово',
            onPressed: () {
              // Переход на главную страницу после успешной регистрации
              MaterialPageRoute(builder: (context) => MainPage());
              Navigator.pop(context);
            },
          )
              : null,
        ),
      );

      // После успешной регистрации, можно вернуться на предыдущую страницу
      if (registrationSuccess) {
        Navigator.pop(context);
      }
    }
  }
}