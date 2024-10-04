import 'payment_interfaces.dart';

class PaymentHandler {
  Future<PaymentResult> handlePayment(PaymentProcessor processor, double amount) async {
    if (amount <= 0) {
      return PaymentResult(
        success: false,
        message: 'Invalid payment amount',
        transactionId: '',
      );
    }
    
    return await processor.processPayment(amount);
  }
}