import 'package:flutter/material.dart';
import 'package:vladik/CartPage.dart';
import 'package:vladik/FavoritesPage.dart';
import 'package:vladik/productDetails.dart';
import 'package:vladik/ProfilePage.dart';
import 'SearchPage.dart';


void main() {
  runApp(MyApp());
}



class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainPage> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex != 1
          ? AppBar(
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'LiriShop',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffb54426B),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ) : null,
      body: _buildBody(),
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
            label: 'Домой',
            backgroundColor: Color(0xffb54426B),
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
            icon: Icon(Icons.account_circle),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  List<Product> likedProducts = [];



  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return ProductGrid(
          imageContent: ImageContent,
          textContent: TextContent,
          priceContent: PriceContent,
          likedProducts: likedProducts,
          onLike:(Product product) {
            setState(() {
              if (likedProducts.contains(product)) {
                likedProducts.remove(product);
              } else {
                likedProducts.add(product);
              }
            });
          },
        );
      default:
        return Container();
    }
  }
}

class ProductGrid extends StatelessWidget {
  final List<String> imageContent;
  final List<String> textContent;
  final List<double> priceContent;
  final List<Product> likedProducts;
  final Function(Product) onLike;

  ProductGrid({
    required this.imageContent,
    required this.textContent,
    required this.priceContent,
    required this.likedProducts,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: List.generate(imageContent.length, (index) {
        return ProductCard(
          imageUrl: imageContent[index],
          productName: textContent[index],
          productPrice: priceContent[index],
          productDescription: productDescription[index],
          isLiked: likedProducts.contains(Product(
            name: textContent[index],
            imageUrl: ImageContent[index],
            price: PriceContent[index],
            description: productDescription[index],
          )),
          onLike: () => onLike(Product(
            name: textContent[index],
            imageUrl: ImageContent[index],
            price: PriceContent[index],
            description: productDescription[index],
          )),
        );
      }),
    );
  }
}

// ProductCard.dart
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double productPrice;
  final String productDescription;
  final bool isLiked;
  final VoidCallback onLike;

  ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.onLike,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(
                        opacity: Tween<double>(
                          begin: 0.0,
                          end: 1.0,
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        )),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          )),
                          child: ProductDetailsPage(
                            imageUrl: imageUrl,
                            productDescription: productDescription,
                            productName: productName,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: Container(
                height: 63,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(),
                ),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : null,
                  ),
                  onPressed: onLike,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '\$${productPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              productName,
              style: TextStyle(fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}









