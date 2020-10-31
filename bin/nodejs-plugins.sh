#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v nodejs >/dev/null 2>&1 || {
  fail "Installing Nodejs first!"
}

info 'Installing Gulp ...'

command -v gulp >/dev/null 2>&1 || {
  sudo npm i -g npm
  sudo npm i -g exec
  sudo npm i -g gulp
}

info 'Installing Gulp plugins ...'

npm i gulp-autoprefixer
npm i gulp-concat
npm i gulp-cssmin
npm i gulp-jshint
npm i gulp-minify-css
npm i gulp-rename
npm i gulp-replace
npm i gulp-uglify
npm i gulp-util

npm link gulp
