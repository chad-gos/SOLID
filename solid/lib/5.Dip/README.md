Below is a code that violates Dependency Inversion Principle. Please refactor and write test case that covers 100% of the code below.
+ Add a service to send notifications via SMS to send it and can replace service send email

```
class EmailService {
    sendEmail(message: string): void {
        console.log(`Sending email with message: ${message}`);
    }
}

class SendNotification {
    private emailService: EmailService;

    constructor() {
        this.emailService = new EmailService();
    }

    sendNotification(message: string): void {
        this.emailService.sendEmail(message);
    }
}

const notification = new SendNotification();
notification.sendNotification("Hello, this is a notification!");
```