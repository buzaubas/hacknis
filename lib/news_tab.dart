import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import 'utils.dart';
import 'widgets.dart';

import 'dart:math';

import './flutter_neat_and_clean_calendar.dart';

class NewsTab extends StatelessWidget {
  static const title = 'Calendar';
  static const androidIcon = Icon(Icons.calendar_month);
  static const iosIcon = Icon(CupertinoIcons.calendar);

  const NewsTab({Key? key}) : super(key: key);

  // @override
  // _NewsTabState createState() => _NewsTabState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Calendar Demo',
      home: CalendarScreen(),
    );
  }
}

// class _NewsTabState extends State<NewsTab> {
//   static const _itemsLength = 20;

//   late final List<Color> colors;
//   late final List<String> titles;
//   late final List<String> contents;

//   @override
//   void initState() {
//     colors = getRandomColors(_itemsLength);
//     titles = List.generate(_itemsLength, (index) => generateRandomHeadline());
//     contents =
//         List.generate(_itemsLength, (index) => lorem(paragraphs: 1, words: 24));
//     super.initState();
//   }

//   Widget _listBuilder(BuildContext context, int index) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Card(
//         elevation: 1.5,
//         margin: const EdgeInsets.fromLTRB(6, 12, 6, 0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: InkWell(
//           // Make it splash on Android. It would happen automatically if this
//           // was a real card but this is just a demo. Skip the splash on iOS.
//           onTap: defaultTargetPlatform == TargetPlatform.iOS ? null : () {},
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: colors[index],
//                   child: Text(
//                     titles[index].substring(0, 1),
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const Padding(padding: EdgeInsets.only(left: 16)),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         titles[index],
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const Padding(padding: EdgeInsets.only(top: 8)),
//                       Text(
//                         contents[index],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ===========================================================================
//   // Non-shared code below because this tab uses different scaffolds.
//   // ===========================================================================

//   Widget _buildAndroid(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(NewsTab.title),
//       ),
//       body: ListView.builder(
//         itemCount: _itemsLength,
//         itemBuilder: _listBuilder,
//       ),
//     );
//   }

//   Widget _buildIos(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(),
//       child: ListView.builder(
//         itemCount: _itemsLength,
//         itemBuilder: _listBuilder,
//       ),
//     );
//   }

//   @override
//   Widget build(context) {
//     return PlatformWidget(
//       androidBuilder: _buildAndroid,
//       iosBuilder: _buildIos,
//     );
//   }
// }

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<NeatCleanCalendarEvent> _todaysEvents = [
    NeatCleanCalendarEvent('Event A',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        description: 'A special event',
        color: Colors.blue[700]),
  ];

  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent('MultiDay Event A',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 12, 0),
        color: Colors.orange,
        isMultiDay: true),
    NeatCleanCalendarEvent('Allday Event B',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 17, 0),
        color: Colors.pink,
        isAllDay: true),
    NeatCleanCalendarEvent('Normal Event D',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 17, 0),
        color: Colors.indigo),
  ];

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'],
          eventsList: _eventList,
          isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.pink,
          todayColor: Colors.blue,
          eventColor: null,
          locale: 'ru_RU',
          todayButtonText: 'Сегодня',
          allDayEventText: 'Встреча с Майрой',
          multiDayEndText: 'Конец',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
