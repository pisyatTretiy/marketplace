import 'package:flutter/material.dart';



final List<String> ImageContent = [
  'https://images.biggeek.ru/1/435/e97a/22698-93t_natural.jpg',
  'https://www.ikea.com/pl/pl/images/products/aepplaryd-sofa-3-osobowa-lejde-jasnoszary__0992909_pe820327_s5.jpg',
  'https://mana.su/wp-content/uploads/2018/03/labuteni_jenskie_tufli_foto_48.jpg',
  'https://www.thesprucepets.com/thmb/IjQ1w-JlBl6ZygXSkVOPFDWoXYE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/PEO-litter-robot-4-automatic-litterbox-vicky-wasik-photo-02-f7b4e1d9d7424f20be36713975cd585c.jpg',
  'https://www.iphones.ru/wp-content/uploads/2023/08/zeekr001-5.jpg',
  'https://m.media-amazon.com/images/I/21wpJHZmftL._AC_.jpg',
  'https://www.cnet.com/a/img/resize/aee6fa621890d809c11d9c680911771b8a3db106/hub/2021/10/13/b8024a0e-b1a4-400c-96d5-1d68ee22e498/2022-bmw-m5-cs-011.jpg?auto=webp&width=1200',
  'https://imobile.market/assets/images/airpods-pro-2022.jpeg',
  'https://img.mvideo.ru/Pdb/50173661b.jpg',
  'https://www.crackerjack.co.nz/content/products/white-glo-bamboo-toothbrush-webimage1-w8132.jpg',
];

final List<String> TextContent = [
  'iPhone 15 Pro Max',
  'Sofa IKEA',
  'Labuteni Krasnie',
  'Cat Toilet',
  'ZEEKR апельсин',
  'Shelf IKEA',
  'BMW M5 CS',
  'Airpods pro',
  'iPhone 14 case',
  'Tooth Brush ECO',
];

final List<double> PriceContent = [1499.52, 199.52, 15.52, 299.52, 52188.52, 29.52, 100000.52, 249.52, 29.52, 19.52];

final List<String> productDescription = [
  'Невероятная мощь в компактном размере Новый корпус, новые возможности камеры, более мощный процессор и разъём USB-C – это лишь основные нововведения iPhone 15 Pro. Компактный, но мощный и функциональный, он станет идеальным гаджетом для любых задач и отличным инструментом для покорения соцсетей и видеохостингов. Всех, кто пропустил 14-е поколение, ждут дополнительные приятные изменения в виде таких фишек как Always-On, динамический остров и 48-Мегапиксельная основная камера, а улучшенная автономность позволит реже думать о зарядке.',
  'жёсткий, полужёсткий, полумягкий или мягкий предмет мебели со спинкой, предназначенный для сидения одного и/или нескольких человек.',
  'красная подошва туфель, в моделях обуви использует экзотические виды кожи, стразы Swarovski, кружево ручной работы.',
  '2',
  'Это крупный лифтбек с красивыми пропорциями, длинной колесной базой (3005 мм), колесами диаметром 22 дюйма и низким коэффициентом аэродинамического сопротивления Cx (0,23). Длина машины — 4970 мм, ширина — 1999 мм, высота — 1560 мм. Со сложенными задними сиденьями образуется багажный отсек объемом 2144 литра.',
  'многофункциональный предмет интерьера, который позволит удобно разместить различные аксессуары: наушники, декор, книги, игрушки, рамки с фотографиями, часы, цветочные горшки, сумки и многое другое. Конструкция предусматривает наличие горизонтальных полок и специальных держателей. Благодаря минималистичному дизайну и нейтральному цветовому решению модель прекрасно вписывается в любое оформление комнаты. Настенный монтаж обеспечивает компактное размещение. Практичные материалы гарантируют изделию износостойкость и долгий срок службы.',
  'Новый BMW M5 CS оснащен бензиновым двигателем V8 M TwinPower Turbo объемом 4,4 л, который развивает 635 л.с. (на 10 л.с. больше, чем M5 Competition) и располагает крутящим моментом 750 Нм. Силовой агрегат сочетается со спортивной автоматической коробкой передач Steptronic и и эффективным полным приводом M xDrive с активным задним дифференциалом М. Они обеспечивают M5 CS лучшую в классе динамику, недоступную для конкурентов.',
  '1',
  'это стильные, удобные и качественные наушники с беспроводным подключением. Модель имеет функцию активного шумоподавления и использует чип Apple H1, который гарантирует минимальную задержку при прослушивании музыки, а также обработку внешних шумов в реальном времени.',
  'Современенный и крутой кожанный чехол на iPhone 14. Премиальная кожа прямо с Американского буйвола - Андрей.',
  'Экологичская зубная щетка для чистки унитаза',
];

class ProductDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productDescription;

  ProductDetailsPage({
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Color(0xffB54426b),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              productDescription,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Liked'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cart'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Buy in one click'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 3) {
            Navigator.pop(context);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Назад',
            backgroundColor: Color(0xffb54426B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Профиль',
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: 3, // Replace with the actual number of products
        itemBuilder: (context, index) {
          final imageUrl = 'https://example.com/image_$index.jpg';
          final productName = 'Product $index';
          final productDescription = 'Description for product $index';

          return ListTile(
            title: Text(productName),
            subtitle: Text(productDescription),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    imageUrl: imageUrl,
                    productName: productName,
                    productDescription: productDescription,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
