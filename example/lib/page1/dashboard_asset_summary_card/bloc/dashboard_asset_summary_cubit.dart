import 'package:equatable/equatable.dart';
import 'package:example/widget_events/widget_events.dart';
import 'package:example/widget_events/widget_ids.dart';
import 'package:flutter_edd/flutter_edd.dart';

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
