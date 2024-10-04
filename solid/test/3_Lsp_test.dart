import 'package:solid/3.Lsp/payment_handler.dart';
import 'package:solid/3.Lsp/payment_interfaces.dart';
import 'package:solid/3.Lsp/payment_processors.dart';
import 'package:test/test.dart';


class MockPaymentListener implements PaymentEventListener {
  final List<String> messages = [];
  final List<PaymentStatus> statuses = [];

  @override
  void onPaymentStatusChanged(PaymentStatus status, String message) {
    messages.add(message);
    statuses.add(status);
  }
}

void main() {
  late PaymentHandler paymentHandler;
  late MockPaymentListener listener;

  setUp(() {
    paymentHandler = PaymentHandler();
    listener = MockPaymentListener();
  });

  group('Credit Card Payment Tests', () {
    test('should process credit card payment successfully', () async {
      final processor = CreditCardPayment(listener);
      final result = await paymentHandler.handlePayment(processor, 100);
      
      expect(result.success, true);
      expect(result.message.contains('successfully'), true);
      expect(result.transactionId.startsWith('CC-'), true);
      
      expect(listener.messages.length, 3);
      expect(listener.statuses.contains(PaymentStatus.completed), true);
    });

    test('should fail for negative amount', () async {
      final processor = CreditCardPayment(listener);
      final result = await paymentHandler.handlePayment(processor, -100);
      
      expect(result.success, false);
      expect(result.message, 'Invalid payment amount');
    });
  });

  group('PayPal Payment Tests', () {
    test('should process PayPal payment successfully', () async {
      final processor = PayPalPayment(listener);
      final result = await paymentHandler.handlePayment(processor, 200);
      
      expect(result.success, true);
      expect(result.message.contains('successfully'), true);
      expect(result.transactionId.startsWith('PP-'), true);
      
      expect(listener.messages.length, 3);
      expect(listener.statuses.contains(PaymentStatus.completed), true);
    });
  });

  group('In-Person Payment Tests', () {
    test('should not process in-person payment online', () async {
      final processor = InPersonPayment();
      final result = await paymentHandler.handlePayment(processor, 50);
      
      expect(result.success, false);
      expect(result.message.contains('physical location'), true);
      expect(result.transactionId, '');
    });
  });
}