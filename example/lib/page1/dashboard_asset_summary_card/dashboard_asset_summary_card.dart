import 'package:example/widget_events/widget_events.dart';
import 'package:example/widget_events/widget_ids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

import 'bloc/dashboard_asset_summary_cubit.dart';

class AssetSummaryCard extends StatefulWidget {
  final String assetName;
  final double assetValue;
  final String assetType;
  final WidgetId widgetId;

  const AssetSummaryCard({
    super.key,
    required this.assetName,
    required this.assetValue,
    required this.assetType,
    required this.widgetId,
  });

  @override
  State<AssetSummaryCard> createState() => _AssetSummaryCardState();
}

class _AssetSummaryCardState extends State<AssetSummaryCard> {
  DashboardAssetSummaryCubit _getCubit(BuildContext context) => context.read<DashboardAssetSummaryCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void test(BuildContext context) async {
    print('TEST: Sending event');
    _getCubit(context).sendEvent<WidgetEventBus>(WidgetEventNavigateToAccountDetails());
    await Future.delayed(const Duration(seconds: 3));
    _getCubit(context).sendEvent<WidgetEventBus>(WidgetEventCompleteLogin());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardAssetSummaryCubit(widgetId: widget.widgetId),
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
                    widget.assetName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Value: \$${widget.assetValue.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Type: ${widget.assetType}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      test(context);
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
