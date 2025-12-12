import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Application Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(child: Text('No favorites yet.'));
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'You have '
            '${appState.favorites.length} favorites:',
          ),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 412,
          height: 917,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: const Color(0xE04B88A6)),
          child: Stack(
            children: [
              Positioned(
                left: 18,
                top: 12,
                child: SizedBox(
                  width: 136,
                  height: 42,
                  child: Text(
                    'FunPAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Hammersmith One',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 103,
                top: 74,
                child: SizedBox(
                  width: 206,
                  height: 40,
                  child: Text(
                    'Hi, John Doe!',
                    style: TextStyle(
                      color: const Color(0xFF353535),
                      fontSize: 32,
                      fontFamily: 'Hammersmith One',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 850,
                child: Container(
                  width: 412,
                  height: 67,
                  decoration: BoxDecoration(color: const Color(0xFFE6F4F1)),
                ),
              ),
              Positioned(
                left: 326,
                top: 859,
                child: Container(width: 50, height: 50, child: Stack()),
              ),
              Positioned(
                left: 18,
                top: 151,
                child: Container(
                  width: 376,
                  height: 155,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 230,
                child: SizedBox(
                  width: 212,
                  height: 40,
                  child: Text(
                    'Rp 1.000.000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 262,
                child: SizedBox(
                  width: 98,
                  height: 44,
                  child: Text(
                    'Point 1.000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 151,
                child: Container(
                  width: 376,
                  height: 55,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFBCD7D2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 132,
                top: 213,
                child: Container(width: 25, height: 25, child: Stack()),
              ),
              Positioned(
                left: 36,
                top: 195,
                child: SizedBox(
                  width: 85,
                  height: 48,
                  child: Text(
                    'Balance',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 150,
                child: SizedBox(
                  width: 225,
                  height: 54,
                  child: Text(
                    'Account No.\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 171,
                child: SizedBox(
                  width: 225,
                  height: 51,
                  child: Text(
                    '+62 8989-xxxx-xx89',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 260,
                top: 226,
                child: Container(width: 40, height: 40, child: Stack()),
              ),
              Positioned(
                left: 332,
                top: 226,
                child: Container(width: 40, height: 40, child: Stack()),
              ),
              Positioned(
                left: 256,
                top: 260,
                child: SizedBox(
                  width: 80,
                  height: 52,
                  child: Text(
                    'Top up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 317,
                top: 260,
                child: SizedBox(
                  width: 121,
                  height: 52,
                  child: Text(
                    'Withdraw',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 280,
                top: 166,
                child: Container(width: 25, height: 25, child: Stack()),
              ),
              Positioned(
                left: 335,
                top: 167,
                child: Container(width: 25, height: 25, child: Stack()),
              ),
              Positioned(
                left: 6,
                top: 350,
                child: Container(
                  width: 400,
                  height: 254,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFC9F7FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 6,
                top: 628,
                child: Container(
                  width: 400,
                  height: 210,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFC9F7FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 677,
                child: Container(
                  width: 381,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 730,
                child: Container(
                  width: 381,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 784,
                child: Container(
                  width: 381,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 350,
                child: SizedBox(
                  width: 193,
                  height: 50,
                  child: Text(
                    'SEND & RECEIVE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 630,
                child: SizedBox(
                  width: 193,
                  height: 50,
                  child: Text(
                    'PAYMENT',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 259,
                top: 360,
                child: Container(
                  width: 135,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 267,
                top: 351,
                child: SizedBox(
                  width: 88,
                  height: 42,
                  child: Text(
                    'SEE ALL',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 358,
                top: 362,
                child: Container(width: 25, height: 25, child: Stack()),
              ),
              Positioned(
                left: 259,
                top: 637,
                child: Container(
                  width: 135,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 267,
                top: 628,
                child: SizedBox(
                  width: 88,
                  height: 42,
                  child: Text(
                    'SEE ALL',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 358,
                top: 639,
                child: Container(width: 25, height: 25, child: Stack()),
              ),
              Positioned(
                left: 22,
                top: 400,
                child: Container(
                  width: 77,
                  height: 82,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 409,
                child: Container(width: 45, height: 45, child: Stack()),
              ),
              Positioned(
                left: 32,
                top: 442,
                child: SizedBox(
                  width: 58,
                  height: 40,
                  child: Text(
                    'Person',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 121,
                top: 401,
                child: Container(
                  width: 77,
                  height: 82,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 137,
                top: 410,
                child: Container(width: 45, height: 45, child: Stack()),
              ),
              Positioned(
                left: 131,
                top: 443,
                child: SizedBox(
                  width: 58,
                  height: 40,
                  child: Text(
                    'Person',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 216,
                top: 402,
                child: Container(
                  width: 77,
                  height: 82,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 230,
                top: 417,
                child: Container(width: 50, height: 50, child: Stack()),
              ),
              Positioned(
                left: 315,
                top: 402,
                child: Container(
                  width: 77,
                  height: 82,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 329,
                top: 417,
                child: Container(width: 50, height: 50, child: Stack()),
              ),
              Positioned(
                left: 22,
                top: 506,
                child: Container(
                  width: 77,
                  height: 82,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 314,
                top: 508,
                child: Container(
                  width: 77,
                  height: 82,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 335,
                top: 545,
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: Text(
                    'Gift',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 216,
                top: 506,
                child: Container(
                  width: 77,
                  height: 82,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 506,
                child: Container(
                  width: 77,
                  height: 82,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9FCAE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 122,
                top: 543,
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: Text(
                    'Request',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 135,
                top: 510,
                child: Container(width: 45, height: 45, child: Stack()),
              ),
              Positioned(
                left: 24,
                top: 543,
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: Text(
                    'Transfer',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 512,
                child: Container(width: 45, height: 45, child: Stack()),
              ),
              Positioned(
                left: 29,
                top: 859,
                child: Container(width: 50, height: 50, child: Stack()),
              ),
              Positioned(
                left: 178,
                top: 859,
                child: Container(width: 50, height: 50, child: Stack()),
              ),
              Positioned(
                left: 219,
                top: 545,
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: Text(
                    'Split bill',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Gulzar',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 230,
                top: 512,
                child: Container(width: 45, height: 45, child: Stack()),
              ),
              Positioned(
                left: 329,
                top: 512,
                child: Container(width: 45, height: 45, child: Stack()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}