import 'package:equatable/equatable.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_type.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_sender_id.dart';
import 'package:event_driven_design/core/mixins/cubit_mixins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_asset_summary_state.dart';

class DashboardAssetSummaryCubit extends Cubit<DashboardAssetSummaryState> with WidgetEventListener {
  DashboardAssetSummaryCubit() : super(DashboardAssetSummaryState()) {
    listenEvent(eventType: WidgetEventType.textSetText, onEventReceived: (event) {
      event.data;
    });
  }
}
