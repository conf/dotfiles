#!/bin/bash
# Swap § and ~ keys
# credits: https://ppolyzos.com/2020/10/09/swap-places-between-tilde-and-section-sign-%C2%A7-key-in-your-macbook-keyboard/

set -euo pipefail

# /tmp is cleared on reboot, so the marker means "already applied this boot".
# Can't check hidutil itself: --get keeps reporting the mapping after reboot
# even though the actual remap is gone.
MARKER="/tmp/.tilde-switch-applied"

if [[ -f "$MARKER" ]]; then
  echo 'Mapping already applied, skipping'
  exit 0
fi

echo 'Remapping § to `'
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}' >/dev/null
touch "$MARKER"
echo 'Done!'

# how to undo:
# hidutil property --set '{"UserKeyMapping":[]}'
# or
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000064}]}'
