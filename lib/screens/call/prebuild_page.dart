import 'package:flutter/material.dart';
import 'package:medical_project/utils/params.dart';
import 'package:medical_project/utils/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class PrebuiltCallPage extends StatefulWidget {
  final caller;
  PrebuiltCallPage({Key? key, this.caller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PrebuiltCallPageState();
}

class PrebuiltCallPageState extends State<PrebuiltCallPage> {
  var id;
  @override
  void initState() {
    print("ICI" + widget.caller['id']);
    // TODO: implement initState
    super.initState();
    getUniqueUserId().then((value) {
      setState(() {
        id = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return id == null
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          )
        : SafeArea(
            child: ZegoUIKitPrebuiltCall(
              appID: appID,
              appSign: appSign,
              userID: id,
              userName: "$id test user",
              callID: widget.caller['id'],
              config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                ..onOnlySelfInRoom = (context) {
                  Navigator.of(context).pop();
                },
            ),
          );
  }
}
