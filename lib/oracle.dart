/// A library with all sorts of RPG-related oracles
library oracle;

import 'package:yaml/yaml.dart';
import 'dart:io';

import 'package:oracle_cli/src/utils.dart';

// export 'src/confirm.dart';

const Map<String, Map<String,dynamic>> oracles = {
  "location": {
    "label": "Location Oracle",
    "function": getLocation,
    "path": "lib/src/locations.yaml"
  },
  "virtues": {
    "label": "Virtues Oracle",
    "function": getVirtue,
    "path": "lib/src/virtues.yaml"
  }
};

YamlList getYamlList(String oracleName) {
  File file = File(oracles[oracleName]["path"]);
  isYaml(file);
  var yaml = loadYaml(file.readAsStringSync());
  isYamlList(yaml);
  return yaml;
}

/// Get a random location (from the locations.yaml folder by default)
///
/// Optional named [category] parameter will return a random location from that category if it exists
/// (not yet implemented)
String getLocation({String? category}) {
  /// The file that contains the locations
  // File locationsFile = File(oracles["location"]["path"]);

  /// The locations as a dart object (YamlList)
  YamlList locationsYaml = getYamlList("location");
  return locationsYaml.random()['name'];
}

String getVirtue() {
  // File virtuesFile = File(oracles["virtues"]["path"]);
  YamlList virtuesYaml = getYamlList("virtues");
  return virtuesYaml.random();
}
