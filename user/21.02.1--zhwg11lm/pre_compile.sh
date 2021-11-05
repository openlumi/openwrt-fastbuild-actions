mv ${OPENWRT_CUR_DIR}/.config ${OPENWRT_CUR_DIR}/.config.config_aqara_zhwg11lm

cp config_xiaomi_dgnwg05lm ${OPENWRT_CUR_DIR}/.config
cat ${BUILDER_PROFILE_DIR}/.config.diff >> .config

cd "${OPENWRT_CUR_DIR}"
echo "Compiling xiaomi_dgnwg05lm..."
make -j$(($(nproc) + 1)) V=sc

echo "Config aqara_zhwg11lm..."
rm .config
mv .config.config_aqara_zhwg11lm .config
