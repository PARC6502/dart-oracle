import 'dart:io';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';
import 'dart:math';

extension RandomOracleItem on YamlList {
  /// Return a random item from a [YamlList]
  dynamic random() {
    return this[Random().nextInt(length)];
  }
}

/// Throws an exceptiom if a file doesn't have a YAML extension
void isYaml(File file) {
  String ext = extension(file.path);
  // Check if the file has a YAML extension
  if (!(ext == '.yml' || ext == '.yaml')) {
    throw FormatException("The provided file isn't a YAML file.");
  }
}

/// Throws an exception if an object isn't a YamlList
void isYamlList(Object obj) {
  // Check if the parsed YAML is a [YamlList] (if it's not, the file isn't formatted correctly)
  if (obj is! YamlList) {
    throw FormatException("The provided YAML file isn't formatted correctly");
  }
}
