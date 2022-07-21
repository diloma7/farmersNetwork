import 'package:farmers_network/viewmodels/MessageViewModel.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatState();
  }
}

class _ChatState extends State<Chat> {
  bool isLoading = false;
  final ScrollController listScrollController = new ScrollController();

  final messageController = TextEditingController();
  var MessageData = MessageViewModel();
  @override
  Widget build(BuildContext context) {
    Widget senderWidget(dynamic message) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                message['created_at'],
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
              ),
            ),
          )
        ],
      );
    }

//build chat item
    Widget buildItem(dynamic message) {
      // {"id":15,"chat_room_id":16,"user_id":11,"message":"Hello","created_at":"2020-12-02 06:45:55","deleted_at":null,"updated_at":"2020-12-02 06:45:55"}

      return message['user'] == 1
          ? Container(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFF79A544),
                            border: Border.all(
                              color: Color(0xFF79A544),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Icon(
                          Icons.person,
                          size: 20,
                          color: Colors.white,
                        )),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            child: Text(
                              message['created_at'],
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ))
                  ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: new BorderRadius.only(
                              topRight: const Radius.circular(20.0),
                              bottomLeft: const Radius.circular(20.0),
                              bottomRight: const Radius.circular(20.0),
                            )),
                        child: Text(
                          message['message'],
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * .85,
                        margin: EdgeInsets.only(bottom: 10.0, right: 5.0),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      message['created_at'],
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    )
                  ]),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF4b7344),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          bottomLeft: const Radius.circular(20.0),
                          bottomRight: const Radius.circular(20.0),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              message['message'],
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )),
                        //senderWidget(message)
                      ],
                    ),
                    padding: EdgeInsets.all(4.0),
                    width: MediaQuery.of(context).size.width * .75,
                    margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                  )
                ],
              )));
    }

    Widget buildInput() {
      return Container(
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        // padding: EdgeInsets.only(left: 6, right: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          // borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                child: TextField(
                  onSubmitted: (value) {
                    // onSendMessage(textEditingController.text, 0);
                  },
                  style: TextStyle(fontSize: 10.0),
                  controller: messageController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type message...',
                    // hintStyle: TextStyle(color: greyColor),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attach_file_sharp,
                color: Colors.grey[400],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey[400],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
        width: double.infinity,
        height: 40.0,
      );
    }

    Widget buildListMessage() {
      return Flexible(
          child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) => buildItem(MessageData.messages[index]),
        itemCount: MessageData.messages.length,
        reverse: true,
        controller: listScrollController,
      ));
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Messages',
            style: TextStyle(fontSize: 10, color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white),
        ),
        backgroundColor: Color(0xFF4b7344),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.keyboard_control),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: Color(0xFF4b7344)),
                  child: Text(
                    'Online',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )),

              // List of messages
              MessageData.messages != null ? buildListMessage() : Container(),
              // Input content
              buildInput(),
            ],
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Offer"),
      content: Text("Accept offer to get Products/Services you requested"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
