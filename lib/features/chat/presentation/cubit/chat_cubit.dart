import 'package:bloc/bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:save_up/features/chat/domain/usecases/retrive_chat_response.dart';
import 'package:save_up/features/home/presentation/cubit/add_transaction/add_transaction_cubit.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final RetriveChatResponse getChatResponse;
  final AddTransactionCubit addTransactionCubit;

  ChatUser currentUser = ChatUser(id: '0', firstName: 'User');
  ChatUser budgie = ChatUser(
    id: '1',
    firstName: 'Budgie',
  );

  ChatCubit({
    required this.getChatResponse,
    required this.addTransactionCubit,
  }) : super(
         ChatInitial(
           messages: [
             ChatMessage(
               user: ChatUser(id: '1', firstName: 'Budgie'),
               createdAt: DateTime.now(),
               text: 'Halo! Ada yang bisa saya bantu catat?',
             ),
           ],
         ),
       );

  Future<void> sendMessage(ChatMessage chatMessage) async {
    final currentMessages = (state as ChatInitial).messages;
    emit(ChatLoading(messages: [chatMessage, ...currentMessages]));

    try {
      final response = await getChatResponse(chatMessage.text);

      final isTransaction = response['isTransaction'] as bool;
      final replyMessage = response['replyMessage'] as String;

      if (isTransaction && response['transaction'] != null) {
        final transactionData = response['transaction'] as Map<String, dynamic>;
        addTransactionCubit.addTransaction(
          name: transactionData['name'],
          amount: (transactionData['amount'] as num).toDouble(),
          category: transactionData['category'],
          date: DateTime.now(),
          // Secara default, bot hanya mencatat pengeluaran kecuali kategori 'Uang Masuk'
          isPengeluaran: transactionData['category'] != 'Uang Masuk',
        );
      }

      final budgieMessage = ChatMessage(
        user: budgie,
        createdAt: DateTime.now(),
        text: replyMessage,
      );

      final updatedMessages = (state as ChatLoading).messages;
      emit(ChatInitial(messages: [budgieMessage, ...updatedMessages]));
    } catch (e) {
      final errorMessage = ChatMessage(
        user: budgie,
        createdAt: DateTime.now(),
        text: 'Maaf, terjadi kesalahan.',
      );
      final updatedMessages = (state as ChatLoading).messages;
      emit(ChatInitial(messages: [errorMessage, ...updatedMessages]));
    }
  }
}