import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MarkPresence extends StatefulWidget {
  const MarkPresence({super.key});

  @override
  State<MarkPresence> createState() => _MarkPresenceState();
}

class _MarkPresenceState extends State<MarkPresence> {
  String qrData = 'A sample QR code';
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(
                    labelText: 'Enter your text',
                    hintText: 'Type here',
                    // prefixIcon: Icon(Icons.text_fields),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      qrData = textFieldController.text;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50.0)),
                  child: const Text('Generate QR Code'),
                ),
                const SizedBox(height: 26.0),
                QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
