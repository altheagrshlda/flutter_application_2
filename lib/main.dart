import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MainScreen(title: 'Flutter Routing'),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavbar = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(224, 20, 33, 105),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        titleSpacing: 12,
        title: Row(
          children: [
            Image(
              width: 120.0,
              image: AssetImage("img/logo.jpg"),
              fit: BoxFit.contain,
              height: 40,
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color.fromARGB(255, 255, 255, 255)])),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
                title: const Text('Kategori'), onTap: () => print('kategori')),
            ListTile(
                leading: Icon(
                  Icons.star_border,
                ),
                title: const Text('Semua Kategori'),
                onTap: () => print('semua kategori')),
            ListTile(
                title: const Text(
                  'Buku',
                  style: TextStyle(color: Color.fromARGB(255, 23, 7, 100)),
                ),
                onTap: () => print('Buku')),
            ListTile(
                title: const Text(
                  'Novel',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () => print('Novel')),
            ListTile(
                title: const Text(
                  'Komik',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () => print('komik')),
            ListTile(
                title: const Text(
                  'Karya Ilmiah',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () => print('karya ilmiah')),
            ListTile(
                title: const Text(
                  'Majalah',
                  style: TextStyle(color: Color.fromARGB(255, 23, 7, 100)),
                ),
                onTap: () => print('Majalah')),
            ListTile(
                title: const Text(
                  'Majalah Anak',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () => print('Novel')),
            ListTile(
                title: const Text(
                  'Majalah Dewasa',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () => print('Majalah Dewasa')),
          ],
        ),
      ),
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3),
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomePage(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'Ini Beranda',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            margin: EdgeInsets.all(16),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: Text('Halaman Selanjutnya'),
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 30, top: 30, right: 20),
            child: Text(
              '...',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Alignment.bottomCenter;
              Navigator.pop(context);
            },
            child: Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
