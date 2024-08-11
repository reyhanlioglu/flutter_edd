import 'package:equatable/equatable.dart';
import 'package:event_driven_design/core/event_bus/base_event_bus/base_event.dart';
import 'package:event_driven_design/core/event_bus/base_event_bus/base_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_bus.dart';
import 'package:event_driven_design/core/mixins/bloc_mixins.dart';
import 'package:event_driven_design/example/page1/dashboard_asset_summary_card/widget_events/widget_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_asset_summary_state.dart';

class DashboardAssetSummaryCubit extends Cubit<DashboardAssetSummaryState> with EventBusListener {
  @override
  List<BaseEventBus<BaseEvent>> get eventBuses => [WidgetEventBus.instance];

  DashboardAssetSummaryCubit() : super(DashboardAssetSummaryState()) {
    listenDataEvent<WidgetEventBus, WidgetEventSetText, String>(
      onEventReceived: (data) {
        print('TEST: Data is ${data}');
      },
    );
  }
}
