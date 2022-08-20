import 'dart:developer';
import 'dart:io';

import 'package:aspar_main/main_page/mygloves.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:aspar_main/local_functions/split_data.dart';
import 'package:aspar_main/veritabani/save_glove.dart';

import 'package:aspar_main/colors.dart';

class AddNewGlove extends StatefulWidget {
  const AddNewGlove({Key? key}) : super(key: key);

  @override
  State<AddNewGlove> createState() => _AddNewGloveState();
}

class _AddNewGloveState extends State<AddNewGlove> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    //String demoData = "Safeline ASP-EI 4 TR012C4S11037S 10/05/2022 40kV www.asparenerji .com";
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null) //result != null

                    Column(
                      children: [
                        Text(SplitData(result!.code)
                            .getSerialNumber!), //Text(SplitData(result!.code).getSerialNumber!)
                        Text(SplitData(result!.code).getGloveType!),
                        Text(SplitData(result!.code).getKiloVolt!),
                        Text(SplitData(result!.code).getProductionDate!),
                        OutlinedButton(
                          onPressed: () async {
                            debugPrint(
                                "SERİ NUMARASI ----- ${SplitData(result!.code).getSerialNumber!}");
                            SaveGlove(
                                    serialNumber: SplitData(result!.code)
                                        .getSerialNumber!, // TO-DO instance Olusturmayi Dene.
                                    productionDate: SplitData(result!.code)
                                        .getProductionDate!,
                                    classNumber:
                                        SplitData(result!.code).getGloveClass!,
                                    kiloVolt:
                                        SplitData(result!.code).getKiloVolt!,
                                    addDate: await SplitData(result!.code)
                                        .getTodayDate)
                                .saveGlovesToDatabase();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MyGloves()));
                          },
                          child: const Text("Eldiveni Kaydet"),
                          style: OutlinedButton.styleFrom(
                              primary: ProjectColors.darkBlue,
                              side: BorderSide(
                                  color: ProjectColors.lightBlue, width: 2),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        )
                      ],
                    ) // result!.code
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Lütfen Eldivenin Üzerindeki\nKarekodu Okutun',
                            style: TextStyle(
                                color: ProjectColors.darkBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.all(8),
                                child: OutlinedButton(
                                  onPressed: () async {
                                    await controller?.toggleFlash();
                                    setState(() {});
                                  },
                                  child: FutureBuilder(
                                    future: controller?.getFlashStatus(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == true) {
                                        return const Text('Flaşı Kapat');
                                      } else {
                                        return const Text("Flaşı Aç");
                                      }
                                    },
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      primary: ProjectColors.darkBlue,
                                      side: const BorderSide(
                                          color: ProjectColors.lightBlue,
                                          width: 2),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8),
                                child: OutlinedButton(
                                  onPressed: () async {
                                    await controller?.flipCamera();
                                    setState(() {});
                                  },
                                  child: FutureBuilder(
                                    future: controller?.getCameraInfo(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null) {
                                        debugPrint(result.toString());
                                        return const Text('Kamerayı Çevir');
                                      } else {
                                        debugPrint(result.toString());
                                        return const Text('loading');
                                      }
                                    },
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      primary: ProjectColors.darkBlue,
                                      side: const BorderSide(
                                          color: ProjectColors.lightBlue,
                                          width: 2),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: ProjectColors.darkBlue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
