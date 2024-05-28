import 'package:flutter/material.dart';
import 'package:jasarumahku_new/features/activity/presentation/screens/activity_screen.dart';
import 'package:jasarumahku_new/features/authentication/presentation/screens/profile_screen.dart';
import 'package:jasarumahku_new/features/dashboard/presentation/screens/dashboard.dart';
import 'package:jasarumahku_new/features/message/presentation/screens/message_screen.dart';
import 'package:jasarumahku_new/features/wallet/presentation/screens/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> featuresList = const [
    DashboardScreen(),
    ActivityScreen(),
    WalletScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: featuresList,
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 24,
              ),
              label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note_outlined), label: 'Aktivitas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Dompet'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Pesan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Akun'),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Color(0xFF6E6E6E),
      ),
    );
  }
}
