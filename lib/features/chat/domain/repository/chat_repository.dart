abstract interface class ChatRepository {
  Future<Map<String, dynamic>> getResponse(String prompt);
}