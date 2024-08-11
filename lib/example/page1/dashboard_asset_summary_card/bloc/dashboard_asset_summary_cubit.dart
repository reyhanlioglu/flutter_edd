import 'package:equatable/equatable.dart';
import 'package:event_driven_design/core/event_bus/base_event_bus/base_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_bus.dart';
import 'package:event_driven_design/core/mixins/bloc_mixins.dart';
import 'package:event_driven_design/example/page1/dashboard_asset_summary_card/widget_events/widget_events.dart';
import 'package:event_driven_design/example/page1/dashboard_asset_summary_card/widget_events/widget_ids.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_asset_summary_state.dart';

class DashboardAssetSummaryCubit extends Cubit<DashboardAssetSummaryState> with EventBusListener {
  @override
  List<BaseEventBus> get eventBuses => [WidgetEventBus.instance];

  final WidgetId widgetId;

  DashboardAssetSummaryCubit({required this.widgetId}) : super(DashboardAssetSummaryState()) {
    listenDataEvent<WidgetEventBus, WidgetEventSetText, String>(
      senderId: WidgetId.dashboardAssetAppleStockCard.index,
      receiverId: widgetId.index,
      onEventReceived: (data) {
        print('${WidgetId.values.firstWhere((id) => id == widgetId)} received message: $data');
      },
    );
  }
}
