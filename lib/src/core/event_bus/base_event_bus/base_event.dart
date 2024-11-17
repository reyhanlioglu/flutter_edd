abstract class BaseEvent<Id> {
  final Id? id;
  final Id? senderId;
  final Id? receiverId;
  final Id? preconditionedEventId;

  BaseEvent({this.id, this.senderId, this.receiverId, this.preconditionedEventId});
}

extension BaseEventExtension on BaseEvent {}

abstract class BaseDataEvent<Data, Id> extends BaseEvent<Id> {
  final Data data;

  BaseDataEvent({required this.data, super.id, super.senderId, super.receiverId, super.preconditionedEventId});
}
