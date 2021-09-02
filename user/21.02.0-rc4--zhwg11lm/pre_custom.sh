#!/bin/bash

mv .config .config.diff
cp config_aqara_zhwg11lm .config
cat .config.diff >> .config
