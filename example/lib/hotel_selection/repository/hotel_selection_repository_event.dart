import 'package:flutter_edd/flutter_edd.dart';

class HotelSelectionRepositoryEventFetchHotelList extends BaseEvent<dynamic, dynamic> {}

class HotelSelectionRepositoryEventNotifyHotelListFetched
    extends BaseDataEvent<HotelSelectionRepositoryEventDataNotifyHotelListFetched, dynamic, dynamic> {
  HotelSelectionRepositoryEventNotifyHotelListFetched({required super.data});
}

class HotelSelectionRepositoryEventDataNotifyHotelListFetched {
  final List<Map<String, dynamic>> hotels;

  HotelSelectionRepositoryEventDataNotifyHotelListFetched({required this.hotels});
}
