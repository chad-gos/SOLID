import 'package:solid/4.Isp/machine_interfaces.dart';
import 'package:solid/4.Isp/machines.dart';
import 'package:test/test.dart';


void main() {
  group('SimplePrinter Tests', () {
    late SimplePrinter printer;
    late Document testDocument;

    setUp(() {
      printer = SimplePrinter();
      testDocument = Document(
        name: 'Test Document',
        content: 'Test Content',
      );
    });

    test('should print document successfully', () async {
      final result = await printer.print(testDocument);
      
      expect(result.success, true);
      expect(result.message.contains('Successfully printed'), true);
      expect(result.message.contains(testDocument.name), true);
    });
  });

  group('ModernScanner Tests', () {
    late ModernScanner scanner;

    setUp(() {
      scanner = ModernScanner();
    });

    test('should scan document successfully', () async {
      final result = await scanner.scan();
      
      expect(result.success, true);
      expect(result.message.contains('successfully'), true);
      expect(result.scannedDocument, isNotNull);
      expect(result.scannedDocument!.name.startsWith('Scanned_'), true);
    });
  });

  group('ModernFax Tests', () {
    late ModernFax fax;
    late Document testDocument;

    setUp(() {
      fax = ModernFax();
      testDocument = Document(
        name: 'Test Fax',
        content: 'Test Content',
      );
    });

    test('should send fax successfully', () async {
      final recipientNumber = '1234567890';
      final result = await fax.sendFax(testDocument, recipientNumber);
      
      expect(result.success, true);
      expect(result.message.contains('successfully'), true);
      expect(result.message.contains(recipientNumber), true);
      expect(result.confirmationCode, isNotNull);
      expect(result.confirmationCode!.startsWith('FAX'), true);
    });
  });

  group('AllInOnePrinter Tests', () {
    late AllInOnePrinter multifunction;
    late Document testDocument;

    setUp(() {
      multifunction = AllInOnePrinter();
      testDocument = Document(
        name: 'Test All-in-One',
        content: 'Test Content',
      );
    });

    test('should print document successfully', () async {
      final result = await multifunction.print(testDocument);
      
      expect(result.success, true);
      expect(result.message.contains('Successfully'), true);
    });

    test('should scan document successfully', () async {
      final result = await multifunction.scan();
      
      expect(result.success, true);
      expect(result.scannedDocument, isNotNull);
    });

    test('should send fax successfully', () async {
      final result = await multifunction.sendFax(testDocument, '1234567890');
      
      expect(result.success, true);
      expect(result.confirmationCode, isNotNull);
    });
  });
}