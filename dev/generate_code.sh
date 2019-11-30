#!/bin/bash -ex

find . -name '*.g.dart' | xargs rm -f
pub run build_runner build "$@"
dev/format_dart_code.sh
find . -name '*.g.dart' | xargs -I % sh -c 'cat dev/ignored_lint_warning_for_generated_code.txt >> %'
