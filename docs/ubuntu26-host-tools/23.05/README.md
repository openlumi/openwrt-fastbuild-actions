# Building OpenWrt 23.05 on Ubuntu 26.04 (GCC 15, uutils coreutils)

The builder image is based on Ubuntu 24.04, so these patches are **not needed
today**. They were required to build `lumi-23.05` on a plain Ubuntu 26.04 host
and are kept here for the day the builder image moves to 26.04.

| Patch | Why |
|-------|-----|
| `001_prereq_allow_uutils_install.patch` | 23.05 requires GNU `install`; Ubuntu 26.04 ships `uutils`. 24.10 already accepts it upstream. |
| `002_elfutils_no_werror.patch` | `elfutils` 0.189 fails with `-Werror=discarded-qualifiers` on the new libc/GCC. |

24.10 and 25.12 build on 26.04 without any of this.

To use them, copy the patches to `user/23.05.6/patches/` (they apply with
`patch -p0`, as done by `scripts/customize.sh`).
