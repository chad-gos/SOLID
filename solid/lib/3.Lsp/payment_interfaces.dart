abstract class PaymentProcessor {
  Future<PaymentResult> processPayment(double amount);
}

class PaymentResult {
  final bool success;
  final String message;
  final String transactionId;

  PaymentResult({
    required this.success,
    required this.message,
    required this.transactionId,
  });
}

enum PaymentStatus {
  processing,
  completed,
  failed,
}

abstract class PaymentEventListener {
  void onPaymentStatusChanged(PaymentStatus status, String message);
}