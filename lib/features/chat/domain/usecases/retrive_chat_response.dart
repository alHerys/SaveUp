import 'package:save_up/features/chat/domain/repository/chat_repository.dart';

class RetriveChatResponse {
  final ChatRepository repository;
  RetriveChatResponse({required this.repository});

  Future<Map<String, dynamic>> call(String prompt) async {
    return await repository.getResponse(prompt);
  }
}