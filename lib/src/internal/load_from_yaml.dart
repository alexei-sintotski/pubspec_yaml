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

import 'dart:convert';

import 'package:plain_optional/plain_optional.dart';
import 'package:yaml/yaml.dart';

import '../pubspec_yaml.dart';
import 'tokens.dart';

// ignore_for_file: avoid_as
// ignore_for_file: avoid_annotating_with_dynamic

PubspecYaml loadFromYaml(String content) {
  final jsonMap = json.decode(json.encode(loadYaml(content))) as Map<String, dynamic>;
  return PubspecYaml(
    name: jsonMap[Tokens.name] as String,
    version: Optional(jsonMap[Tokens.version] as String),
    description: Optional(jsonMap[Tokens.description] as String),
    authors: [
      if (jsonMap[Tokens.author] != null) jsonMap[Tokens.author] as String,
      if (jsonMap[Tokens.authors] != null)
        ...(jsonMap[Tokens.authors] as List<dynamic>).map((dynamic author) => author as String)
    ],
    homepage: Optional(jsonMap[Tokens.homepage] as String),
    customFields: Map<String, dynamic>.fromEntries(jsonMap.entries.where((entry) => !_knownTokens.contains(entry.key))),
  );
}

const _knownTokens = [
  Tokens.name,
  Tokens.version,
  Tokens.description,
  Tokens.author,
  Tokens.authors,
  Tokens.homepage,
];
