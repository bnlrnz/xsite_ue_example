#!/bin/sh
UE4_TRUE_SCRIPT_NAME=$(echo \"$0\" | xargs readlink -f)
UE4_PROJECT_ROOT=$(dirname "$UE4_TRUE_SCRIPT_NAME")
chmod +x "$UE4_PROJECT_ROOT/xsite_ue_example/Binaries/Linux/xsite_ue_example"
DISPLAY=:0.0 "$UE4_PROJECT_ROOT/xsite_ue_example/Binaries/Linux/xsite_ue_example" xsite_ue_example 139.20.18.74 -game
