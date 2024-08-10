// Write a flutter widget for asset summary card?
import 'package:event_driven_design/example/page1/dashboard_asset_summary_card/bloc/dashboard_asset_summary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetSummaryCard extends StatelessWidget {
  final String assetName;
  final double assetValue;
  final String assetType;

  const AssetSummaryCard({
    Key? key,
    required this.assetName,
    required this.assetValue,
    required this.assetType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardAssetSummaryCubit(),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
