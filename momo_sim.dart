// Student: Mushabe Vincent
// Reg no: 27293
const String regNo = '27293';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Copy of momoFee from D2
int momoFee(int amount) {
  // by MV
  if (amount <= 0)
    return -1;
  else if (amount <= 1000)
    return 20;
  else if (amount <= 10000)
    return 100;
  else if (amount <= 150000)
    return 250;
  else
    return 1500;
}

// Part F - Function 1
String formatRwf(int amount) {
  // by MV
  bool isNegative = amount < 0;
  String digits = amount.abs().toString();
  String reversed = '';
  int i = digits.length - 1;
  int count = 0;

  while (i >= 0) {
    reversed += digits[i];
    count++;

    if (count % 3 == 0 && i > 0) {
      reversed += ',';
    }

    i--;
  }

  String formatted = reversed.split('').reversed.join();

  if (isNegative) {
    formatted = '-$formatted';
  }

  return '$formatted RWF';
}

bool isValidPin(String pin) {
  // by MV
  if (pin.length != 5) {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (pin[i].compareTo('0') < 0 || pin[i].compareTo('9') > 0) {
      return false;
    }
    i++;
  }

  if (pin == '12345') {
    return false;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }

  return true;
}

int sendMoney(int balance, int amount) {
  // by MV
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} '
    '(fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by MV
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime bought: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

void main() {
  // by MV
  print('Reg no: $regNo | D = $d | T = $t');

  // Test PINs
  print('PIN 12345: ${isValidPin('12345')}');
  print('PIN 77777: ${isValidPin('77777')}');
  print('PIN 4821: ${isValidPin('4821')}');
  print('PIN 48a21: ${isValidPin('48a21')}');
  print('PIN 48213: ${isValidPin('48213')}');

  // Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // Send money three times
  int amount = (d + 1) * 3000;

  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);

  // Buy airtime
  balance = buyAirtime(balance, 1000);

  // Test invalid amount
  balance = sendMoney(balance, 0);

  // Test insufficient balance
  balance = sendMoney(balance, 200000);

  // Final balance
  print('Final balance: ${formatRwf(balance)}');

  // Additional tests
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF
  print(isValidPin('48213')); // Expected: true
  print(isValidPin('00000')); // Expected: false
}
