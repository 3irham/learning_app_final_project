import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app_final_project/constants/r.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);
  static const String route = '/chat_page';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController();
  late CollectionReference chat;
  QuerySnapshot? chatData;
  List<QueryDocumentSnapshot>? listChat;

  getDataFromFirebase() async {
    listChat = chatData?.docs;
    super.initState();
  }

  @override
  void initState() {
    super.initState();
    getDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    chat = FirebaseFirestore.instance
        .collection('room')
        .doc('kimia')
        .collection('chat');
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Diskusi Soal'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: listChat == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: listChat?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentChat = listChat?[index];
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentChat?['nama'],
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  color: Color(0xff5200FF),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: R.colors.primary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  currentChat?['content'],
                                ),
                              ),
                              Text(
                                'Waktu kirim',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: R.colors.greySubtitile,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: R.colors.primary,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              child: TextField(
                                controller: textController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: R.colors.primary,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '  Ketuk untuk menulis',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (textController.text.isEmpty) {
                        return;
                      }
                      print(textController.text);
                      final user = FirebaseAuth.instance.currentUser!;

                      final chatContent = {
                        'nama': user.displayName,
                        'uid': user.uid,
                        'content': textController.text,
                        'email': user.email,
                        'photo': user.photoURL,
                        'time': FieldValue.serverTimestamp(),
                      };
                      chat.add(chatContent).whenComplete(() {
                        getDataFromFirebase();
                      });
                    },
                    icon: Icon(
                      Icons.send,
                      color: R.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
