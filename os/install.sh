if [ "$(uname)" == "Darwin" ]; then
  defaults write NSGlobalDomain KeyRepeat -int 1

  # Custom keyboard shortcuts
  # @: CMD
  # $: Shift
  # ~: Alt
  # ^: Ctrl
  TAB_KEY_SYMBOL="\\U21e5" # Note the backslash-escaped backslash.
  COMMAND_KEY_SYMBOL="@"
  SHIFT_KEY_SYMBOL="$"
  ENTER_KEY_SYMBOL="\\U21a9"
  defaults write com.apple.finder NSUserKeyEquivalents "{ 'Show Package Contents' = '${COMMAND_KEY_SYMBOL}${SHIFT_KEY_SYMBOL}O'; }"

  defaults write -g NSUserKeyEquivalents "{ 'Paste and Match Style' = '${COMMAND_KEY_SYMBOL}V'; }"
  defaults write -g NSUserKeyEquivalents "{ 'Zoom' = '${COMMAND_KEY_SYMBOL}${SHIFT_KEY_SYMBOL}M'; }"

  defaults write com.apple.Mail NSUserKeyEquivalents "{ 'Send' = '${COMMEND_KEY_SYMBOL}${ENTER_KEY_SYMBOL}'; }"
fi
