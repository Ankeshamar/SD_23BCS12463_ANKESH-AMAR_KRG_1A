public class Main{
    public static void main(String[] args) {
        AccountRepository accountRepo = new AccountRepository();
        TransactionService transactionService = new TransactionService();
        StatementPrinter statementPrinter = new StatementPrinter();

        BankAccount account1 = new BankAccount("123456", 1000.0);
        BankAccount account2 = new BankAccount("654321", 500.0);

        accountRepo.addAccount(account1);
        accountRepo.addAccount(account2);

        statementPrinter.printStatement(account1);
        statementPrinter.printStatement(account2);

        transactionService.transfer(account1, account2, 200.0);

        statementPrinter.printStatement(account1);
        statementPrinter.printStatement(account2);
    }
}