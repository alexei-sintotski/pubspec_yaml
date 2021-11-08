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
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
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
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithSingleAuthor);

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with single author', () {
        expect(pubspec.authors.length, 1);
      });
      test('produces an object with correct author name', () {
        expect(pubspec.authors.first, author);
      });
      test('produces an object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspec.toYamlString(), pubspecWithSingleAuthor);
      });
    });
  });

  group('given pubspec.yaml without author specification', () {
    final pubspec = PubspecYaml.loadFromYamlString(
      pubspecWithoutAuthorSpecification,
    );

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with empty list of authors', () {
        expect(pubspec.authors, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspec.toYamlString(), pubspecWithoutAuthorSpecification);
      });
    });
  });

  group('given pubspec.yaml with two authors specified', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithTwoAuthors);

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with two authors', () {
        expect(pubspec.authors.length, 2);
      });
      test('produces an object with correct author names', () {
        expect(pubspec.authors, [author, anotherAuthor]);
      });
      test('produces an object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspec.toYamlString(), pubspecWithTwoAuthors);
      });
    });
  });

  group('given pubspec.yaml with empty author specification', () {
    final pubspec = PubspecYaml.loadFromYamlString(
      pubspecWithEmptyAuthorSpecification,
    );

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with empty list of authors', () {
        expect(pubspec.authors, isEmpty);
      });
    });
  });

  group('given pubspec.yaml with empty authors specification', () {
    final pubspec = PubspecYaml.loadFromYamlString(
      pubspecWithEmptyAuthorsSpecification,
    );

    group('$PubspecYaml.loadFromYamlString)', () {
      test('produces an object with empty list of authors', () {
        expect(pubspec.authors, isEmpty);
      });
    });
  });
}

const author = 'Natalie Weizenbaum <nweiz@google.com>';
const pubspecWithSingleAuthor = '''
name: pubspec_yaml
author: '$author'
''';

const pubspecWithoutAuthorSpecification = '''
name: pubspec_yaml
''';

const anotherAuthor = 'Abigail Larsen';
const pubspecWithTwoAuthors = '''
name: pubspec_yaml
authors:
  - '$author'
  - $anotherAuthor
''';

const pubspecWithEmptyAuthorSpecification = '''
name: pubspec_yaml
author:
''';

const pubspecWithEmptyAuthorsSpecification = '''
name: pubspec_yaml
authors:
''';
