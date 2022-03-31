// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:widget_mask/widget_mask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home2(),
    );
  }
}

class Home2 extends StatefulWidget {
  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: ApproachMaskWidget(
                  maskShapeWidget:
                      Image.asset('assets/Rectangle.png', fit: BoxFit.cover),
                  child: ApproachResizableImageWidget(
                    child: Image.asset(
                      'assets/test2.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ApproachMaskWidget(
                        maskShapeWidget: Image.asset('assets/Rectangle2.png',
                            fit: BoxFit.cover),
                        child: ApproachResizableImageWidget(
                          child: Image.asset(
                            'assets/oi00000.jpg',
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Expanded(
                    child: ApproachMaskWidget(
                        maskShapeWidget: Image.asset('assets/Rectangle3.png',
                            fit: BoxFit.cover),
                        child: ApproachResizableImageWidget(
                          child: Image.asset(
                            'assets/oi00001.jpg',
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ApproachResizableImageWidget extends StatefulWidget {
  final Image child;

  const ApproachResizableImageWidget({required this.child});

  @override
  State<ApproachResizableImageWidget> createState() =>
      _ApproachResizableImageWidgetState();
}

class _ApproachResizableImageWidgetState
    extends State<ApproachResizableImageWidget> {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 1,
      maxScale: 8,
      child: widget.child,
    );
  }
}

class ApproachMaskWidget extends StatelessWidget {
  final Widget maskShapeWidget;
  final Widget child;

  const ApproachMaskWidget(
      {required this.maskShapeWidget, required this.child});

  @override
  Widget build(BuildContext context) {
    return WidgetMask(
      mask: child,
      child: maskShapeWidget,
      blendMode: BlendMode.srcIn,
      childSaveLayer: true,
    );
  }
}
