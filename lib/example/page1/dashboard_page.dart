import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_bus.dart';
import 'package:event_driven_design/example/page1/dashboard_asset_summary_card/dashboard_asset_summary_card.dart';
import 'package:event_driven_design/example/page1/dashboard_asset_summary_card/widget_events/widget_events.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    test();
  }

  void test() {
    Future.delayed(const Duration(seconds: 3), () {
      WidgetEventBus.instance.sendEvent(
        widgetEvent: WidgetEventTextSetText<String>(data: 'Hello World'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const <Widget>[
          AssetSummaryCard(
            assetName: 'Bitcoin',
            assetValue: 45000.00,
            assetType: 'Cryptocurrency',
          ),
          AssetSummaryCard(
            assetName: 'Ethereum',
            assetValue: 3000.00,
            assetType: 'Cryptocurrency',
          ),
          AssetSummaryCard(
            assetName: 'Apple Stock',
            assetValue: 150.00,
            assetType: 'Stock',
          ),
        ],
      ),
    );
  }
}
