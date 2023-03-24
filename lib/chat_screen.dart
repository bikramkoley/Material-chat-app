import 'package:flutter/material.dart';
import 'package:material_chat_app/chat_messeges.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => ChatScreenState();


}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessege> _messeges = <ChatMessege>[];


  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessege messege = new ChatMessege(text:text, );
    setState(() {
      _messeges.insert(0, messege);
    });
  }

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
                child: new TextField(
                  decoration: new InputDecoration.collapsed(hintText: "send a messege"),
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: ()=>_handleSubmitted(_textController.text),
              ),

            )

          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      new Column(
        children: <Widget>[
          new Flexible(child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _messeges[index] ,
            itemCount: _messeges.length,),
          ),
          new Divider(height: 1.0,),
          new Container(
            decoration:new BoxDecoration(
              color: Theme.of(context).cardColor,
            ) ,
            child: _textComposerWidget(),
          )

        ],
      );

  }
}
