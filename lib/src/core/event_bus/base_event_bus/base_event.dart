abstract class BaseEvent<Id> {
  final Id? senderId;
  final Id? receiverId;

  BaseEvent({this.senderId, this.receiverId});
}

extension BaseEventExtension on BaseEvent {}

abstract class BaseDataEvent<Data, Id> extends BaseEvent<Id> {
  final Data data;

  BaseDataEvent({required this.data, super.senderId, super.receiverId});
}
