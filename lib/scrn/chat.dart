import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final List<String> members = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank'
  ]; // List of chat members

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/images/backarrow.svg',
                          height: 15,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 15, 0, 30),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          color: Color(0xFF15B987),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                      child: const Text(
                        'Chats',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Chat Tiles
              Expanded(
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Text(
                          members[index][0], // Display the first letter of the name
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(members[index]),
                      subtitle: const Text('Last message...'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Navigate to the ChatScreen when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              memberName: members[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Chat Screen to display individual chat
class ChatScreen extends StatelessWidget {
  final String memberName;

  const ChatScreen({super.key, required this.memberName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(memberName),
      ),
      body: Center(
        child: Text('Chat with $memberName'),
      ),
    );
  }
}
