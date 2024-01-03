import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CSVParser {
  Future<List<dynamic>> parseCSV(Uint8List? bytes) async {
    if(bytes == null || bytes.isEmpty) {
      return Future(() => List.empty());
    }

    var lines = String.fromCharCodes(bytes).split('\r\n').where((element) => element.isNotEmpty);

    var result = [];

    for(var line in lines) {
      var lineData = line.split(';');
      result.add(lineData);
    }

    return Future(() => result);
  }

}

class CSVUploader extends StatelessWidget {
  final String buttonText;
  final Function(List<dynamic>) onDataLoaded;

  CSVUploader({required this.buttonText, required this.onDataLoaded});

  Future<void> _uploadCSV(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {

      List<dynamic> csvData = await CSVParser().parseCSV(result.files.single.bytes);
      onDataLoaded(csvData);
    } else {
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _uploadCSV(context),
      child: Text(buttonText),
    );
  }
}