mv .config .config.config_aqara_zhwg11lm

cp config_xiaomi_dgnwg05lm .config
cat ${BUILDER_PROFILE_DIR}/.config.diff >> .config

echo "Compiling xiaomi_dgnwg05lm..."
make -j$(($(nproc) + 1)) V=sc

echo "Config aqara_zhwg11lm..."
rm .config
mv .config.config_aqara_zhwg11lm .config
