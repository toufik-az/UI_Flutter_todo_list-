import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset('assets/logo.png', height: 40),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TableCalendar(
            daysOfWeekHeight: 40,
            rowHeight: 60,
            focusedDay: focusedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            calendarFormat: CalendarFormat.month,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
            ),
            selectedDayPredicate: (day) => isSameDay(day, selectedDay),
            onDaySelected: (day, focus) {
              setState(() {
                selectedDay = day;
                focusedDay = focus;
              });
            },
          ),
          const SizedBox(height: 20),
          taskItem('fix the bugs', '6/10/2025', 'urgent', const Color.fromARGB(255, 255, 17, 0)),
          taskItem('test app', '08/10/2025', 'important', Colors.orange),
          taskItem('setup play page', '10/10/2025', 'moderate', const Color.fromARGB(255, 255, 230, 0)),
          taskItem('app to portfolio', '12/10/2025', 'nice to have', Colors.green),
          taskItem('learn figma', '', 'exploration', const Color.fromARGB(255, 46, 52, 180)),
        ],
      ),
    );
  }

  Widget taskItem(String title, String date, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              if (date.isNotEmpty) Text('due date: $date'),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(label),
          )
        ],
      ),
    );
  }
}