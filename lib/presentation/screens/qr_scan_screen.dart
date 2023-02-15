import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('images/headsetAndMic.svg'),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderRadius: 25,
                  borderLength: 50,
                  borderWidth: 14,
                  cutOutSize: 210,
                  overlayColor: Colors.black26),
              onQRViewCreated: (viewController) {
                viewController.resumeCamera();
                controller = viewController;
                controller?.scannedDataStream.listen((event) {
                  debugPrint(event.code);
                });
              }),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(13),
                    primary: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(27))),
                  ),
                  onPressed: () {
                    controller?.pauseCamera();
                    Navigator.pushNamed(context, '/terminalSelected',
                        arguments: {'cameraController': controller});
                  },
                  child: const Text('Не сканирует QR-код?'),
                )),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: IconButton(
                      padding: const EdgeInsets.all(10),
                      highlightColor: Colors.black,
                      color: Colors.black,
                      splashColor: Colors.black,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'images/flashlight.svg',
                        height: 22,
                        width: 8.41,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
