public class TransactionService {
    public void transfer(BankAccount fromAccount, BankAccount toAccount, double amount) {
        if (amount > 0 && fromAccount.getBalance() >= amount) {
            fromAccount.withdraw(amount);
            toAccount.deposit(amount);
            System.out.println("Transferred: " + amount + " from " + fromAccount.getAccountNumber() + " to " + toAccount.getAccountNumber());
        } else {
            System.out.println("Invalid transfer amount or insufficient funds.");
        }
    }
}