void checkBalance({required String name, required double balance}) =>
    print('👤 Client: $name | 💰 Available balance: $balance ₸');

double deposit({required double currentBalance, double? amount}) {
  double validAmount = amount ?? 0.0;
  
  if (validAmount <= 0) {
    print('❌ Error: Deposit amount must be greater than zero.');
    return currentBalance;
  }

  double updatedBalance = currentBalance + validAmount;
  print('✅ Successfully deposited: +$validAmount ₸. New balance: $updatedBalance ₸');
  return updatedBalance;
}

double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  int enteredPin = pinCode ?? 0000;
  const int correctPin = 1234;

  if (enteredPin != correctPin) {
    print('❌ Error ($name): Incorrect PIN code! Transaction declined.');
    return currentBalance;
  }

  double validAmount = amount ?? 0.0;

  if (validAmount <= 0) {
    print('❌ Error ($name): Withdrawal amount is invalid.');
    return currentBalance;
  }

  if (validAmount > currentBalance) {
    print('❌ Error ($name): Insufficient funds! Requested: $validAmount ₸, available: $currentBalance ₸');
    return currentBalance;
  }

  double updatedBalance = currentBalance - validAmount;
  print('✅ Successfully withdrawn: -$validAmount ₸. Remaining balance: $updatedBalance ₸');
  return updatedBalance;
}

void main() {
  String clientName = 'Bekzat';
  double myBalance = 50000.0;

  print('--- ATM TERMINAL STARTED ---');
  
  checkBalance(name: clientName, balance: myBalance);
  print('');

  myBalance = deposit(currentBalance: myBalance, amount: 15000.0);
  print('');

  myBalance = deposit(currentBalance: myBalance, amount: null);
  print('');

  myBalance = withdraw(
    name: clientName,
    currentBalance: myBalance,
    amount: 20000.0,
    pinCode: 1234,
  );
  print('');

  myBalance = withdraw(
    name: clientName,
    currentBalance: myBalance,
    amount: 5000.0,
    pinCode: 9999,
  );
  print('');

  checkBalance(name: clientName, balance: myBalance);
}