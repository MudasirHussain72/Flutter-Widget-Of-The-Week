import 'dart:async';

import "package:flutter/material.dart";

class StreamsBuilderScreen extends StatefulWidget {
  const StreamsBuilderScreen({super.key});

  @override
  State<StreamsBuilderScreen> createState() => _StreamsBuilderScreenState();
}

class _StreamsBuilderScreenState extends State<StreamsBuilderScreen> {
  List<String> list = [];
  StreamsSocket streamsSocket = StreamsSocket();
  TextEditingController messageController = TextEditingController();
  Stream<DateTime> genetrateNumber() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add("");
    streamsSocket.addResponse(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Builder"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: streamsSocket.getResponse,
              initialData: ["No Data"],
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      // child: CircularProgressIndicator(),
                      );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.connectionState == ConnectionState.active) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data![index].toString());
                      },
                    ),
                  );
                } else {
                  return const Text("something went wrong");
                }
              },
            ),
          ),
          Row(children: [
            Expanded(
              child: TextFormField(
                controller: messageController,
                decoration: const InputDecoration(hintText: "Enter message"),
              ),
            ),
            IconButton(
              onPressed: () {
                list.add(messageController.text.toString());
                streamsSocket.addResponse(list);
                messageController.clear();
              },
              icon: const Icon(Icons.send),
            ),
          ]),
        ],
      ),
    );
  }
}

class StreamsSocket {
  final _stream = StreamController<List<String>>.broadcast();
  void Function(List<String>) get addResponse => _stream.sink.add;
  Stream<List<String>> get getResponse => _stream.stream.asBroadcastStream();
}
