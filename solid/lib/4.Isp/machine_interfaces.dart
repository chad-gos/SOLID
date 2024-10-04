abstract class Printer {
  Future<PrintResult> print(Document document);
}

abstract class Scanner {
  Future<ScanResult> scan();
}

abstract class Fax {
  Future<FaxResult> sendFax(Document document, String recipientNumber);
}

class Document {
  final String name;
  final String content;

  Document({required this.name, required this.content});
}

class PrintResult {
  final bool success;
  final String message;

  PrintResult({required this.success, required this.message});
}

class ScanResult {
  final bool success;
  final String message;
  final Document? scannedDocument;

  ScanResult({
    required this.success, 
    required this.message, 
    this.scannedDocument,
  });
}

class FaxResult {
  final bool success;
  final String message;
  final String? confirmationCode;

  FaxResult({
    required this.success, 
    required this.message, 
    this.confirmationCode,
  });
}