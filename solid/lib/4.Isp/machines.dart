import 'machine_interfaces.dart';

class SimplePrinter implements Printer {
  @override
  Future<PrintResult> print(Document document) async {
    try {
      // Simulate printing process
      await Future.delayed(Duration(seconds: 1));
      return PrintResult(
        success: true,
        message: 'Successfully printed: ${document.name}',
      );
    } catch (e) {
      return PrintResult(
        success: false,
        message: 'Failed to print: ${e.toString()}',
      );
    }
  }
}

class ModernScanner implements Scanner {
  @override
  Future<ScanResult> scan() async {
    try {
      // Simulate scanning process
      await Future.delayed(Duration(seconds: 1));
      final scannedDocument = Document(
        name: 'Scanned_${DateTime.now().millisecondsSinceEpoch}',
        content: 'Scanned content',
      );
      return ScanResult(
        success: true,
        message: 'Document scanned successfully',
        scannedDocument: scannedDocument,
      );
    } catch (e) {
      return ScanResult(
        success: false,
        message: 'Failed to scan: ${e.toString()}',
        scannedDocument: null,
      );
    }
  }
}

class ModernFax implements Fax {
  @override
  Future<FaxResult> sendFax(Document document, String recipientNumber) async {
    try {
      // Simulate fax sending process
      await Future.delayed(Duration(seconds: 1));
      final confirmationCode = 'FAX${DateTime.now().millisecondsSinceEpoch}';
      return FaxResult(
        success: true,
        message: 'Fax sent successfully to $recipientNumber',
        confirmationCode: confirmationCode,
      );
    } catch (e) {
      return FaxResult(
        success: false,
        message: 'Failed to send fax: ${e.toString()}',
        confirmationCode: null,
      );
    }
  }
}

class AllInOnePrinter implements Printer, Scanner, Fax {
  final Printer _printer;
  final Scanner _scanner;
  final Fax _fax;

  AllInOnePrinter({
    Printer? printer,
    Scanner? scanner,
    Fax? fax,
  })  : _printer = printer ?? SimplePrinter(),
        _scanner = scanner ?? ModernScanner(),
        _fax = fax ?? ModernFax();

  @override
  Future<PrintResult> print(Document document) => _printer.print(document);

  @override
  Future<ScanResult> scan() => _scanner.scan();

  @override
  Future<FaxResult> sendFax(Document document, String recipientNumber) =>
      _fax.sendFax(document, recipientNumber);
}