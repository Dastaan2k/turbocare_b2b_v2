import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            SizedBox(width: 12.5),
            CalendarTile(dayInt: 10, dayString: 'Mo',isSelected: true),
            CalendarTile(dayInt: 11, dayString: 'Tu'),
            CalendarTile(dayInt: 12, dayString: 'We'),
            CalendarTile(dayInt: 13, dayString: 'Th'),
            CalendarTile(dayInt: 14, dayString: 'Fr'),
            CalendarTile(dayInt: 15, dayString: 'Sa'),
            CalendarTile(dayInt: 16, dayString: 'Su'),
            SizedBox(width: 12.5),
          ],
        ),
      ),
    );
  }



}




class CalendarTile extends StatelessWidget {

  final bool isSelected;
  final String dayString;
  final int dayInt;

  const CalendarTile({this.isSelected = false, required this.dayString, required this.dayInt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
      decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6D18B7) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 0.75, offset: Offset(0.5,0.75))]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
        child: Column(
          children: [
            Text(dayString, style: const TextStyle(color: Color(0xffA7A7A7))),
            const SizedBox(height: 5),
            Text(dayInt.toString(), style: TextStyle(color: isSelected ? Color(0xffF1F2F3) : Color(0xff121212), fontWeight: FontWeight.w200)),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
