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
  group('given pubspec.yaml with single author specified', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithSingleAuthor);

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with single author', () {
        expect(pubspecYaml.authors.length, 1);
      });
      test('produces an object with correct author name', () {
        expect(pubspecYaml.authors.first, author);
      });
      test('produces an object without custom fields', () {
        expect(pubspecYaml.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithSingleAuthor);
      });
    });
  });

  group('given pubspec.yaml without author specification', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithoutAuthorSpecification);

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with empty list of authors', () {
        expect(pubspecYaml.authors, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithoutAuthorSpecification);
      });
    });
  });

  group('given pubspec.yaml with two authors specified', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithTwoAuthors);

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with two authors', () {
        expect(pubspecYaml.authors.length, 2);
      });
      test('produces an object with correct author names', () {
        expect(pubspecYaml.authors, [author, anotherAuthor]);
      });
      test('produces an object without custom fields', () {
        expect(pubspecYaml.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithTwoAuthors);
      });
    });
  });

  group('given pubspec.yaml with empty author specification', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithEmptyAuthorSpecification);

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with empty list of authors', () {
        expect(pubspecYaml.authors, isEmpty);
      });
    });
  });

  group('given pubspec.yaml with empty authors specification', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithEmptyAuthorsSpecification);

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with empty list of authors', () {
        expect(pubspecYaml.authors, isEmpty);
      });
    });
  });
}

const author = 'Natalie Weizenbaum <nweiz@google.com>';
const pubspecYamlWithSingleAuthor = '''
name: pubspec_yaml
author: "$author"
''';

const pubspecYamlWithoutAuthorSpecification = '''
name: pubspec_yaml
''';

const anotherAuthor = 'Abigail Larsen';
const pubspecYamlWithTwoAuthors = '''
name: pubspec_yaml
authors:
  - "$author"
  - $anotherAuthor
''';

const pubspecYamlWithEmptyAuthorSpecification = '''
name: pubspec_yaml
author:
''';

const pubspecYamlWithEmptyAuthorsSpecification = '''
name: pubspec_yaml
authors:
''';
