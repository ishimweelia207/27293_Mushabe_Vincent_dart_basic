// Student: Mushabe Vincent
// Reg no: 27293
const String regNo = '27293';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  // by MV
  print('Reg no: $regNo | D = $d | T = $t');
}
