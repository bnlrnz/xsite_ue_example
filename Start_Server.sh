#!/bin/sh
UE4_TRUE_SCRIPT_NAME=$(echo \"$0\" | xargs readlink -f)
UE4_PROJECT_ROOT=$(dirname "$UE4_TRUE_SCRIPT_NAME")
chmod +x "$UE4_PROJECT_ROOT/xsite_ue_example/Binaries/Linux/xsite_ue_example"
"$UE4_PROJECT_ROOT/xsite_ue_example/Binaries/Linux/xsite_ue_example" xsite_ue_example NewMap?listen -game -lanplay
