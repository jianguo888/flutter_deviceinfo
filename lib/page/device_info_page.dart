import 'package:flutter/material.dart';
import 'package:flutter_app00/api/device_info_api.dart';
import 'package:flutter_app00/widget/info_widget.dart';
import '../main.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  Map<String, dynamic> deviceInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final deviceInfo = await DeviceInfoApi.getInfo();

    if (!mounted) return;
    setState(() => this.deviceInfo = deviceInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("deviceinfo"),
          centerTitle: true,
        ),
        body: InfoWidget(map: deviceInfo),
      );
}

class MyApp {}
