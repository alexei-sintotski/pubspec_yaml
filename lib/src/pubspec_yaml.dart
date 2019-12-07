/*
 * MIT License
 *
 * Copyright (c) 2019 Alexei Sintotski
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

import 'package:collection/collection.dart';
import 'package:functional_data/functional_data.dart' hide Optional;
import 'package:meta/meta.dart';
import 'package:plain_optional/plain_optional.dart';

import 'internal/load_from_yaml.dart';
import 'internal/yaml_formatter.dart';

part 'pubspec_yaml.g.dart';

// ignore_for_file: annotate_overrides

/// PubspecYaml is a data type representing data stored in pubspec.yaml files.
/// See https://dart.dev/tools/pub/pubspec for details
/// It provides the following facilities:
/// - Parser from pubspec.yaml YAML string
/// - Formatter to pubspec.yaml YAML string
/// - https://pub.dev/packages/functional_data is used to provide data type facilities
@immutable
@FunctionalData()
class PubspecYaml extends $PubspecYaml {
  const PubspecYaml({
    @required this.name,
    this.version = const Optional.none(),
    this.description = const Optional.none(),
    this.authors = const [],
    this.customFields = const <String, dynamic>{},
  });

  factory PubspecYaml.loadFromYamlString(String content) {
    assert(content != null, 'content must not be null');
    assert(content.trim().isNotEmpty, 'content must not be empty');
    return loadFromYaml(content);
  }

  /// Package name (https://dart.dev/tools/pub/pubspec#name)
  final String name;

  /// Package version (https://dart.dev/tools/pub/pubspec#version)
  final Optional<String> version;

  /// Package description (https://dart.dev/tools/pub/pubspec#description)
  final Optional<String> description;

  /// Package authors (https://dart.dev/tools/pub/pubspec)
  @CustomEquality(DeepCollectionEquality())
  final List<String> authors;

  /// JSON representation of other pubspec.yaml fields
  @CustomEquality(DeepCollectionEquality())
  final Map<String, dynamic> customFields;

  String toYamlString() => formatToYaml(this);
}
