public class StatementPrinter {

    public void printStatement(BankAccount account) {
        System.out.println("----- Account Statement -----");
        System.out.println("Account Number: " + account.getAccountNumber());
        System.out.println("Current Balance: " + account.getBalance());
        System.out.println("-----------------------------");
    }
}