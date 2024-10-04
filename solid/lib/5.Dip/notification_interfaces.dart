abstract class NotificationService {
  Future<NotificationResult> send(NotificationMessage message);
}

class NotificationMessage {
  final String to;
  final String subject;
  final String content;
  final Map<String, dynamic>? metadata;

  NotificationMessage({
    required this.to,
    required this.subject,
    required this.content,
    this.metadata,
  });
}

class NotificationResult {
  final bool success;
  final String message;
  final String? messageId;
  final DateTime timestamp;

  NotificationResult({
    required this.success,
    required this.message,
    this.messageId,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class NotificationException implements Exception {
  final String message;
  final String? code;

  NotificationException(this.message, [this.code]);

  @override
  String toString() => 'NotificationException: $message${code != null ? ' (Code: $code)' : ''}';
}