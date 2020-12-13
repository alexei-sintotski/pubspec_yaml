#!/bin/bash -ex

dart example/main.dart
dartanalyzer --fatal-hints .
pub run test
pub run dependency_validator
dev/format_dart_code.sh --set-exit-if-changed
dev/generate_code.sh
pub publish --dry-run
