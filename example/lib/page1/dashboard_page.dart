import 'package:flutter/material.dart';

import 'dashboard_asset_summary_card/dashboard_asset_summary_card.dart';
import 'dashboard_asset_summary_card/widget_events/widget_ids.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
          AssetSummaryCard(
            assetName: 'Ethereum',
            assetValue: 3000.00,
            assetType: 'Cryptocurrency',
            widgetId: WidgetId.dashboardAssetEthereumCard,
          ),
          AssetSummaryCard(
            assetName: 'Apple Stock',
            assetValue: 150.00,
            assetType: 'Stock',
            widgetId: WidgetId.dashboardAssetAppleStockCard,
          ),
        ],
      ),
    );
  }
}
