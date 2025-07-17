import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_app/size_config.dart';
import 'package:responsive_app/widgets.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive App',
      builder: (context, child) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig.init(context);
            return child!;
          },
        );
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Profile Card Test',
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
      ),
      body: SafeArea(
        child: Center(child: isPortrait ? PortraitLayout() : LandscapeLayout()),
      ),
    );
  }
}
