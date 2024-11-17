import 'package:example/widget_events/widget_ids.dart';
import 'package:flutter/material.dart';

import 'dashboard_asset_summary_card/dashboard_asset_summary_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
            widgetId: WidgetId.dashboardAssetBitcoinCard,
          ),
        ],
      ),
    );
  }
}
