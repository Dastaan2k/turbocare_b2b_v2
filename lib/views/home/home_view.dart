import 'dart:math';

import 'package:flutter/material.dart';
import 'package:turbocare_b2b_v2/views/home/widgets/bottom_nav_bar.dart';
import 'package:turbocare_b2b_v2/views/home/widgets/calendar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool floatVisible = false;

  double calendarPosition = 0;

  GlobalKey calendarWidgetKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      if (calendarPosition == 0) {
        var x = (calendarWidgetKey.currentContext!.findRenderObject()) as RenderBox;
        calendarPosition = x.globalToLocal(const Offset(0, 100 + 20)).dy * -1;
        print('Distance : $calendarPosition');
      }

       _scrollController.addListener(() {

        if (_scrollController.offset > calendarPosition && !floatVisible) {
          print('HI : ${Random.secure().nextDouble()}');
          setState(() {floatVisible = true;});
        }
        if (_scrollController.offset <= calendarPosition && floatVisible) {
          print('BI ${Random.secure().nextDouble()}');
          setState(() {floatVisible = false;});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF6D18B7),
        title: const Text("Hello World", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20))
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            controller: _scrollController,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '3',
                          style:
                          Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 30,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: Colors.orangeAccent.withOpacity(0.2), shape: BoxShape.circle),
                    ),
                    SizedBox(height: 5),
                    Text('PENDING', style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ))
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CalendarWidget(key: calendarWidgetKey),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(50, (index) => Text(index.toString()))
              )
            ],
          ),
          floatVisible ? Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CalendarWidget(),
            ),
          ) : const SizedBox(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ },
        backgroundColor: Color(0xFF6D18B7),
        child: Icon(Icons.add, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color:Colors.white,
        elevation: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add),
                    Text('Ongoing')
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add),
                    Text('Pending')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
