import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

import 'bloc/dashboard_asset_summary_cubit.dart';
import 'widget_events/widget_events.dart';
import 'widget_events/widget_ids.dart';

class AssetSummaryCard extends StatelessWidget {
  final String assetName;
  final double assetValue;
  final String assetType;
  final WidgetId widgetId;

  const AssetSummaryCard({
    Key? key,
    required this.assetName,
    required this.assetValue,
    required this.assetType,
    required this.widgetId,
  }) : super(key: key);

  DashboardAssetSummaryCubit _getCubit(BuildContext context) => context.read<DashboardAssetSummaryCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardAssetSummaryCubit(widgetId: widgetId),
      child: BlocBuilder<DashboardAssetSummaryCubit, DashboardAssetSummaryState>(
        builder: (context, state) {
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    assetName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Value: \$${assetValue.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Type: $assetType',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _getCubit(context).sendEvent<WidgetEventBus>(
                        WidgetEventSetText(
                          data: 'Hello from $assetName',
                          senderId: widgetId.index,
                          receiverId: WidgetId.dashboardAssetBitcoinCard.index,
                        ),
                      );
                    },
                    child: const Text('Send Event'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
