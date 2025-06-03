import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trading Signal App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.lightBlue),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;
  List<String> currencyPairs = [
    'BTCUSDT', 'ETHUSDT', 'BNBUSDT', 'XRPUSDT', 'ADAUSDT',
    'SOLUSDT', 'DOTUSDT', 'LTCUSDT', 'DOGEUSDT', 'SHIBUSDT',
    'TRXUSDT', 'AVAXUSDT', 'LINKUSDT', 'UNIUSDT', 'XLMUSDT',
    'MATICUSDT', 'ETCUSDT', 'FILUSDT', 'ICPUSDT', 'EOSUSDT',
    'XMRUSDT', 'DASHUSDT', 'ZECUSDT', 'NEOUSDT', 'IOTAUSDT',
    'XTZUSDT', 'ALGOUSDT', 'EGLDUSDT', 'THETAUSDT', 'AAVEUSDT',
    'MKRUSDT', 'COMPUSDT', 'SNXUSDT', 'YFIUSDT', 'CRVUSDT',
    'SUSHIUSDT', 'UMAUSDT', 'BALUSDT', 'RENUSDT', 'KSMUSDT',
    'GRTUSDT', 'CHZUSDT', 'ENJUSDT', 'SANDUSDT', 'MANAUSDT',
    'AXSUSDT', 'GALAUSDT', 'APEUSDT', 'GMTUSDT', 'DYDXUSDT'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: currencyPairs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trading Signal App', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: TabBarView(
        controller: _tabController,
        children: currencyPairs.map((currencyPair) => CurrencyPairConfigTab(currencyPair: currencyPair)).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              // Navigate to config tab
            } else if (index == 1) {
              // Navigate to settings
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

class CurrencyPairConfigTab extends StatelessWidget {
  final String currencyPair;

  const CurrencyPairConfigTab({super.key, required this.currencyPair});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Configuration for $currencyPair'),
    );
  }
}
