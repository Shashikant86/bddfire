#!/bin/bash
RAKETASK=$1
rm -rf ${WORKSPACE}/target/
rm -rf ${WORKSPACE}/.yarddoc/
rm -rf ${WORKSPACE}/doc/
mkdir -p ${WORKSPACE}/target/
bundle install --path vendor/bundle --binstubs
bundle exec yard config load_plugins true
bundle exec yardoc 'example/**/*.rb' 'example/**/*.feature'
bundle exec rake yard
cd ${WORKSPACE}/features
bundle exec cuke_sniffer --out html ${WORKSPACE}/target/cuke_sniffer.html
bundle exec rubocop ${WORKSPACE}/features/ --require rubocop/formatter/checkstyle_formatter --format Rubocop::Formatter::CheckstyleFormatter --no-color --silent --rails --out ${WORKSPACE}/target/checkstyle.xml
cd ${WORKSPACE}
bundle exec rake "${RAKETASK}"
