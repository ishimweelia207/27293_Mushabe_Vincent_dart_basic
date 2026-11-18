// Student: Mushabe Vincent
// Reg no: 27293
const String regNo = '27293';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// QUESTION B2: COUNT VOWELS
int countVowels(String text) {
  // by MV
  int count = 0;
  int i = 0;

  while (i < text.length) {
    String letter = text[i].toLowerCase();

    if ('aeiou'.contains(letter)) {
      count++;
    }

    i++;
  }

  return count;
}

// QUESTION B3: GENERATE INITIALS
String initials(String fullName) {
  // by MV
  String cleaned = fullName.trim();

  if (cleaned.isEmpty) {
    return '';
  }

  List<String> names = cleaned.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;

  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

// QUESTION C5: DRAW TRIANGLE
void drawTriangle(int height) {
  // by MV
  if (height <= 0) {
    return;
  }

  int row = 1;

  while (row <= height) {
    int spaces = height - row;

    String spacePart = List.filled(spaces, ' ').join();
    String symbol = row.isEven ? '#' : '*';
    String symbolPart = List.filled(row, symbol).join();

    print(spacePart + symbolPart);

    row++;
  }
}

// QUESTION D2: MOMO FEE
int momoFee(int amount) {
  // by MV
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// QUESTION D2: MASK PHONE NUMBER
String maskPhone(String phone) {
  // by MV
  if (phone.length != 10) {
    return 'INVALID';
  }

  String result = phone.substring(0, 3);
  int i = 0;

  while (i < 5) {
    result += '*';
    i++;
  }

  result += phone.substring(8, 10);

  return result;
}

// MAIN PROGRAM
void main() {
  // by MV
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  print('Mushabe Vincent has ${countVowels('Mushabe Vincent')} vowels');

  // B3
  print(initials('Mushabe Vincent'));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  String phone = '0788123456';
  int totalFees = 0;
  int i = 1;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');

    totalFees += fee;
    i++;
  }

  print('Total fees: $totalFees RWF');
}
