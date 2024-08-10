import 'package:equatable/equatable.dart';
import 'package:event_driven_design/core/mixins/cubit_mixins.dart';
import 'package:event_driven_design/example/page1/dashboard_asset_summary_card/widget_events/widget_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_asset_summary_state.dart';

class DashboardAssetSummaryCubit extends Cubit<DashboardAssetSummaryState> with WidgetEventListener {
  DashboardAssetSummaryCubit() : super(DashboardAssetSummaryState()) {
    listenDataEvent<WidgetEventTextSetText, WidgetEventTextSetTextData>(
      onEventReceived: (event) {
        print('TEST: Data is ${event.text}');
      },
    );
  }
}
