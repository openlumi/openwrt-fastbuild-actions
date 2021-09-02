#!/bin/bash

mv .config .config.diff
cp config_xiaomi_dgnwg05lm .config
cat .config.diff >> .config
