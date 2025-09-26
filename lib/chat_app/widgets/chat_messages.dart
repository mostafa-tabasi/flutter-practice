import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/chat_app/widgets/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          return Center(child: Text('No message found.'));
        }

        final loadedMessage = chatSnapshots.data!.docs;

        return ListView.builder(
          padding: EdgeInsets.only(bottom: 40, left: 12, right: 12),
          reverse: true,
          itemCount: loadedMessage.length,
          itemBuilder: (ctx, index) {
            final chatMessages = loadedMessage[index].data();
            final nextChatMessage = index + 1 < loadedMessage.length
                ? loadedMessage[index + 1].data()
                : null;

            final currentMessageUserId = chatMessages['userId'];
            final nextMessageUserId = nextChatMessage != null
                ? nextChatMessage['userId']
                : null;
            final nextUserIsSame = nextMessageUserId == currentMessageUserId;

            if (nextUserIsSame) {
              return MessageBubble.next(
                message: chatMessages['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            } else {
              return MessageBubble.first(
                userImage:
                // null,
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
                username: chatMessages['username'],
                message: chatMessages['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            }
          },
        );
      },
    );
  }
}
