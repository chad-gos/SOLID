import 'dart:async';
import 'dart:math';
import 'payment_interfaces.dart';

class CreditCardPayment implements PaymentProcessor {
  final PaymentEventListener? _listener;

  CreditCardPayment([this._listener]);

  @override
  Future<PaymentResult> processPayment(double amount) async {
    try {
      _notifyListener(PaymentStatus.processing, 'Validating credit card details...');
      await Future.delayed(Duration(milliseconds: 500));
      
      _notifyListener(PaymentStatus.processing, 'Charging the credit card...');
      await Future.delayed(Duration(milliseconds: 500));
      
      _notifyListener(PaymentStatus.completed, 'Credit card payment completed');
      
      return PaymentResult(
        success: true,
        message: 'Credit card payment processed successfully',
        transactionId: _generateTransactionId(),
      );
    } catch (e) {
      _notifyListener(PaymentStatus.failed, 'Credit card payment failed');
      return PaymentResult(
        success: false,
        message: 'Credit card payment failed: ${e.toString()}',
        transactionId: '',
      );
    }
  }

  void _notifyListener(PaymentStatus status, String message) {
    _listener?.onPaymentStatusChanged(status, message);
  }

  String _generateTransactionId() {
    return 'CC-${Random().nextInt(1000000)}';
  }
}

class PayPalPayment implements PaymentProcessor {
  final PaymentEventListener? _listener;

  PayPalPayment([this._listener]);

  @override
  Future<PaymentResult> processPayment(double amount) async {
    try {
      _notifyListener(PaymentStatus.processing, 'Redirecting to PayPal...');
      await Future.delayed(Duration(milliseconds: 500));
      
      _notifyListener(PaymentStatus.processing, 'Completing PayPal transaction...');
      await Future.delayed(Duration(milliseconds: 500));
      
      _notifyListener(PaymentStatus.completed, 'PayPal payment completed');
      
      return PaymentResult(
        success: true,
        message: 'PayPal payment processed successfully',
        transactionId: _generateTransactionId(),
      );
    } catch (e) {
      _notifyListener(PaymentStatus.failed, 'PayPal payment failed');
      return PaymentResult(
        success: false,
        message: 'PayPal payment failed: ${e.toString()}',
        transactionId: '',
      );
    }
  }

  void _notifyListener(PaymentStatus status, String message) {
    _listener?.onPaymentStatusChanged(status, message);
  }

  String _generateTransactionId() {
    return 'PP-${Random().nextInt(1000000)}';
  }
}

class InPersonPayment implements PaymentProcessor {
  @override
  Future<PaymentResult> processPayment(double amount) async {
    return PaymentResult(
      success: false,
      message: 'In-person payments must be processed at a physical location',
      transactionId: '',
    );
  }
}