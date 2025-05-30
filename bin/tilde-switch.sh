#!/bin/bash
# Swap § and ~ keys 
# credits: https://ppolyzos.com/2020/10/09/swap-places-between-tilde-and-section-sign-%C2%A7-key-in-your-macbook-keyboard/

set -euo pipefail

USER_KEY_MAPPING="$(hidutil property --get UserKeyMapping)"

# check if the command returns "(<eol>)"
if [[ "$USER_KEY_MAPPING" == $'(null)' || "$USER_KEY_MAPPING" == "$(printf "(\n)")" ]]; then
  echo 'Remapping § to `'
  # no existing mapping found, we need to remap the keys
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}' > /dev/null
  echo 'Done!'
fi

# how to undo:
# hidutil property --set '{"UserKeyMapping":[]}'
# or
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000064}]}'
