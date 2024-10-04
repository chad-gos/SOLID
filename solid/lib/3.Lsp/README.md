Below is a code that violates Liskov Substitution Principle. Please refactor and write a test case that covers 100% of the code below.

```
class PaymentProcessor {
    processPayment(amount: number): void {
        console.log(`Processing payment of $${amount}`);
    }
}
class CreditCardPayment extends PaymentProcessor {
    processPayment(amount: number): void {
        console.log(`Processing credit card payment of $${amount}`);
        console.log("Validating credit card details...");
        console.log("Charging the credit card...");
    }
}

class PayPalPayment extends PaymentProcessor {
    processPayment(amount: number): void {
        console.log(`Processing PayPal payment of $${amount}`);
        console.log("Redirecting to PayPal...");
        console.log("Completing PayPal transaction...");
    }
}
class CashPayment extends PaymentProcessor {
    processPayment(amount: number): void {
        console.log(`Processing cash payment of $${amount}`);
        throw new Error("Cannot process cash payment online!");
    }
}

function handlePayment(paymentProcessor: PaymentProcessor, amount: number): void {
    paymentProcessor.processPayment(amount);
}

const creditCardPayment = new CreditCardPayment();
handlePayment(creditCardPayment, 100); // Output: Processed payment successfully

const payPalPayment = new PayPalPayment();
handlePayment(payPalPayment, 200); // Output: Processed payment successfully

const cashPayment = new CashPayment();
handlePayment(cashPayment, 50); // Output: Error: Cannot process cash payment online!
```