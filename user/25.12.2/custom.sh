#!/bin/bash

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds update node
./scripts/feeds install -a -p node

sed -i -e 's/PKG_VERSION:=.*/PKG_VERSION:=0.2.5/' -e 's/PKG_HASH:=.*/PKG_HASH:=skip/' feeds/packages/lang/python/python-ble2mqtt/Makefile
cat <<EOF> feeds/node/node/patches/v24.x/100-fix-old-uv.patch
--- a/src/env.h
+++ b/src/env.h
@@ -52,6 +52,11 @@
 #include "v8-profiler.h"
 #include "v8.h"

+#if (UV_VERSION_MAJOR == 1 && UV_VERSION_MINOR < 50)
+#define uv_thread_setname(arg) (UV_ENOTSUP)
+#define uv_getrusage_thread(rusage) (UV_ENOTSUP)
+#endif
+
 #if HAVE_OPENSSL
 #include <openssl/evp.h>
 #endif

--- a/src/env-inl.h
+++ b/src/env-inl.h
@@ -22,6 +22,12 @@
 #ifndef SRC_ENV_INL_H_
 #define SRC_ENV_INL_H_

+#if (UV_VERSION_MAJOR == 1 && UV_VERSION_MINOR < 50)
+#define UV_TCP_REUSEPORT 2
+#define UV_UDP_REUSEPORT 2
+#define UV_TTY_MODE_RAW_VT 3
+#endif
+
 #if defined(NODE_WANT_INTERNALS) && NODE_WANT_INTERNALS

 #include "aliased_buffer-inl.h"
EOF

make defconfig
echo "=============================================="
