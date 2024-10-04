import 'dart:async';
import 'notification_interfaces.dart';

class EmailService implements NotificationService {
  final String serverUrl;
  final String apiKey;

  EmailService({
    required this.serverUrl,
    required this.apiKey,
  });

  @override
  Future<NotificationResult> send(NotificationMessage message) async {
    try {
      // Simulate sending email
      await Future.delayed(Duration(milliseconds: 500));
      
      final messageId = 'EMAIL-${DateTime.now().millisecondsSinceEpoch}';
      
      return NotificationResult(
        success: true,
        message: 'Email sent successfully to ${message.to}',
        messageId: messageId,
      );
    } catch (e) {
      throw NotificationException('Failed to send email: ${e.toString()}');
    }
  }
}

class SmsService implements NotificationService {
  final String providerId;
  final String authToken;

  SmsService({
    required this.providerId,
    required this.authToken,
  });

  @override
  Future<NotificationResult> send(NotificationMessage message) async {
    try {
      // Simulate sending SMS
      await Future.delayed(Duration(milliseconds: 300));
      
      final messageId = 'SMS-${DateTime.now().millisecondsSinceEpoch}';
      
      return NotificationResult(
        success: true,
        message: 'SMS sent successfully to ${message.to}',
        messageId: messageId,
      );
    } catch (e) {
      throw NotificationException('Failed to send SMS: ${e.toString()}');
    }
  }
}