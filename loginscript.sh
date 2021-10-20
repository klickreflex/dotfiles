# Remap Capslock to Backspace
# Run this on every login, from within the directory of this script run:
# 1. `chmod +x loginscript.sh`
# 2. `sudo defaults write com.apple.loginwindow LoginHook `pwd`/loginscript.sh`

hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000002A}]}'
