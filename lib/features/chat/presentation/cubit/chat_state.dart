part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {
  final List<ChatMessage> messages;
  ChatInitial({required this.messages});
}

final class ChatLoading extends ChatState {
  final List<ChatMessage> messages;
  ChatLoading({required this.messages});
}
