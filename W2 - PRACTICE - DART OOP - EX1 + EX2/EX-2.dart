class BankAccount {
  final String accountName;
  final int accountID;
  //final DateTime dateOfBirth;
  double _balance;

  BankAccount(this.accountID, this.accountName, this._balance);

  double get balance => _balance;

  double getBalance() {
    return _balance;
  }

  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception ('Insufficient balance');
    }
    if (_balance - amount > 0) {
      _balance -= amount;
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }

    @override
  String toString() {
    return 'Account ID: $accountID, Account Name: $accountName, Balance: $_balance';
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountID, String accountName) {
    for (var account in _accounts) {
      if (account.accountID == accountID) {
        throw Exception ('Account ID already exists');
      }     
    }
    var newAccount = BankAccount(accountID, accountName, 0);
    _accounts.add(newAccount);
    return newAccount;
  }

  BankAccount? getAccount(int accountID) {
    for (var account in _accounts) {
      if (account.accountID == accountID) {
        return account;
      }
    }
    return null;
  }

  @override
  String toString() {
    return 'Bank Name: $name, Accounts: $_accounts';
  }
}

void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }

  Bank myBank2 = Bank(name: "ABA Bank");
  BankAccount kmernAccount = myBank2.createAccount(69, 'Kmern');
  kmernAccount.credit(69);
  print (myBank);
  print (myBank2);
}
