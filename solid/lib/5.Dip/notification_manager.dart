import 'notification_interfaces.dart';

class NotificationManager {
  final Map<String, NotificationService> _services;
  
  NotificationManager(Map<String, NotificationService> services) : _services = services;

  void registerService(String channel, NotificationService service) {
    _services[channel] = service;
  }

  Future<NotificationResult> sendNotification({
    required String channel,
    required String to,
    required String subject,
    required String content,
    Map<String, dynamic>? metadata,
  }) async {
    final service = _services[channel];
    if (service == null) {
      throw NotificationException('Notification channel "$channel" not found');
    }

    final message = NotificationMessage(
      to: to,
      subject: subject,
      content: content,
      metadata: metadata,
    );

    try {
      return await service.send(message);
    } catch (e) {
      if (e is NotificationException) {
        rethrow;
      }
      throw NotificationException('Failed to send notification: ${e.toString()}');
    }
  }

  bool hasChannel(String channel) => _services.containsKey(channel);
}