// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR-Code"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Código gerado com sucesso. Tire print - somente do QRCode e a mensagem abaixo, imprima e cole na coleira do seu pet.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 30),
            QrImage(
              data: data,
              size: 250,
              gapless: true,
              errorCorrectionLevel: QrErrorCorrectLevel.Q,
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '(Mire a câmera do Celular)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
