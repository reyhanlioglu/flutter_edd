import 'package:example/dashboard/widgets/search_hotel_card/search_hotel_card.dart';
import 'package:example/widget_events/event_ids.dart';
import 'package:example/widget_events/widget_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetEventBus.instance.sendEvent(WidgetEventDisplayPage(id: EventId.displayPageDashboard));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Booking Dashboard'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SearchHotelCard(),
          ],
        ),
      ),
    );
  }
}
