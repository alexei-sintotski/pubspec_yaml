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
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with executables spec', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithExecutables);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with two executables entries', () {
        expect(pubspecYaml.executables.length, 2);
      });
      test('produces object containing correct executable names', () {
        expect(pubspecYaml.executables.keys, [executableWithCustomScriptName, executableWithoutCustomScriptName]);
      });
      test('fills no custom script name for executable without custom script name', () {
        expect(pubspecYaml.executables[executableWithoutCustomScriptName].hasValue, isFalse);
      });
      test('fills correct custom script name for executable with the specified custom script name', () {
        expect(pubspecYaml.executables[executableWithCustomScriptName].valueOr(() => ''), customScriptName);
      });
      test('produces object without custom fields', () {
        expect(pubspecYaml.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces output identical to the original string', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithExecutables);
      });
    });
  });
}

const executableWithCustomScriptName = 'polymer-new-element';
const customScriptName = 'new_element';
const executableWithoutCustomScriptName = 'useful-script';
const pubspecYamlWithExecutables = '''
name: pubspec_yaml

executables:
  $executableWithCustomScriptName: $customScriptName
  $executableWithoutCustomScriptName:
''';
