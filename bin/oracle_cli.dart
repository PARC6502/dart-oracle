import 'package:oracle_cli/oracle.dart' as oracle_cli;

void main(List<String> arguments) {
  print('Location: ${oracle_cli.getLocation()},');
  print('Virtue: ${oracle_cli.getVirtue()},');
}
