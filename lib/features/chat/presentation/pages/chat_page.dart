import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';

import '../cubit/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        List<ChatMessage> messages = [];
        bool isLoading = false;

        if (state is ChatInitial) {
          messages = state.messages;
        } else if (state is ChatLoading) {
          messages = state.messages;
          isLoading = true;
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppPallete.primary,
            centerTitle: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppPallete.baseWhite,
                ),
              ),
            ),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppPallete.baseWhite,
                    shape: BoxShape.circle,
                  ),
                  width: 48,
                  child: SvgPicture.asset(
                    'assets/images/AI Profile Picture.svg',
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Budgie',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Pencatat Keuangan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: DashChat(
            currentUser: context.read<ChatCubit>().currentUser,
            onSend: (ChatMessage m) {
              context.read<ChatCubit>().sendMessage(m);
            },
            messages: messages,
            typingUsers: isLoading ? [context.read<ChatCubit>().budgie] : [],
            messageOptions: const MessageOptions(
              showTime: true,
              showOtherUsersName: false,
              showOtherUsersAvatar: true,
            ),
          ),
        );
      },
    );
  }
}
