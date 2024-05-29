import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jasarumahku_new/features/activity/presentation/screens/history_screen.dart';
import 'package:jasarumahku_new/features/activity/presentation/screens/ongoing_screen.dart';
import 'package:jasarumahku_new/features/activity/presentation/screens/schedule_screen.dart';
import 'package:jasarumahku_new/features/activity/presentation/screens/tab_item.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Aktivitas',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    height: 28,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFEDEDED),
                    ),
                    child: TabBar(
                        indicatorPadding: EdgeInsets.only(right: 10),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            color: Color(0xFFFF0000),
                            borderRadius: BorderRadius.circular(22)),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          TabItem(title: 'Riwayat'),
                          TabItem(title: 'Sedang Berlangsung'),
                          TabItem(title: 'Dijadwalkan'),
                        ]),
                  ),
                )),
          ),
          body: TabBarView(children: [
            HistoryScreen(),
            OngoingScreen(),
            ScheduleScreen(),
          ]),
        ));
  }
}
