#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Toggle hide Desktop
# @raycast.mode silent
# @raycast.icon 👾
# @raycast.packageName Utils
# @raycast.description Hides or shows desktop icons.
# @raycast.author tomaspietravallo

if [[ "$(/usr/bin/defaults read com.apple.finder CreateDesktop 2>/dev/null || echo 1)" == 1 ]]; then
  /usr/bin/defaults write com.apple.finder CreateDesktop -bool false
else
  /usr/bin/defaults write com.apple.finder CreateDesktop -bool true
fi
/usr/bin/killall Finder
