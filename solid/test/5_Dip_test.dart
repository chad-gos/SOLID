import 'package:solid/5.Dip/notification_interfaces.dart';
import 'package:solid/5.Dip/notification_manager.dart';
import 'package:solid/5.Dip/notification_services.dart';
import 'package:test/test.dart';


class MockNotificationService implements NotificationService {
  final bool shouldSucceed;
  final List<NotificationMessage> sentMessages = [];

  MockNotificationService({this.shouldSucceed = true});

  @override
  Future<NotificationResult> send(NotificationMessage message) async {
    if (!shouldSucceed) {
      throw NotificationException('Mock service failure');
    }
    
    sentMessages.add(message);
    return NotificationResult(
      success: true,
      message: 'Mock notification sent',
      messageId: 'MOCK-123',
    );
  }
}

void main() {
  group('NotificationManager Tests', () {
    late NotificationManager manager;
    late MockNotificationService mockEmailService;
    late MockNotificationService mockSmsService;

    setUp(() {
      mockEmailService = MockNotificationService();
      mockSmsService = MockNotificationService();
      manager = NotificationManager({
        'email': mockEmailService,
        'sms': mockSmsService,
      });
    });

    test('should send email notification successfully', () async {
      final result = await manager.sendNotification(
        channel: 'email',
        to: 'test@example.com',
        subject: 'Test Email',
        content: 'Test Content',
      );

      expect(result.success, true);
      expect(mockEmailService.sentMessages.length, 1);
      expect(mockEmailService.sentMessages.first.to, 'test@example.com');
    });

    test('should send SMS notification successfully', () async {
      final result = await manager.sendNotification(
        channel: 'sms',
        to: '+1234567890',
        subject: 'Test SMS',
        content: 'Test Content',
      );

      expect(result.success, true);
      expect(mockSmsService.sentMessages.length, 1);
      expect(mockSmsService.sentMessages.first.to, '+1234567890');
    });

    test('should throw exception for unknown channel', () {
      expect(
        () => manager.sendNotification(
          channel: 'unknown',
          to: 'test@example.com',
          subject: 'Test',
          content: 'Test',
        ),
        throwsA(isA<NotificationException>()),
      );
    });

    test('should handle service failure', () async {
      final failingService = MockNotificationService(shouldSucceed: false);
      manager.registerService('failing', failingService);

      expect(
        () => manager.sendNotification(
          channel: 'failing',
          to: 'test@example.com',
          subject: 'Test',
          content: 'Test',
        ),
        throwsA(isA<NotificationException>()),
      );
    });
  });

  group('Real Services Integration Tests', () {
    test('EmailService basic functionality', () async {
      final emailService = EmailService(
        serverUrl: 'https://api.email.com',
        apiKey: 'test-key',
      );

      final result = await emailService.send(NotificationMessage(
        to: 'test@example.com',
        subject: 'Test Email',
        content: 'Test Content',
      ));

      expect(result.success, true);
      expect(result.messageId?.startsWith('EMAIL-'), true);
    });

    test('SmsService basic functionality', () async {
      final smsService = SmsService(
        providerId: 'test-provider',
        authToken: 'test-token',
      );

      final result = await smsService.send(NotificationMessage(
        to: '+1234567890',
        subject: 'Test SMS',
        content: 'Test Content',
      ));

      expect(result.success, true);
      expect(result.messageId?.startsWith('SMS-'), true);
    });
  });
}