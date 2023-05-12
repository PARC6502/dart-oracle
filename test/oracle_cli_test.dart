import 'package:oracle_cli/oracle.dart';
import 'package:test/test.dart';

void main() {
  test('getLocation() returns a string', () {
    expect(getLocation(), isA<String>());
  });
}
