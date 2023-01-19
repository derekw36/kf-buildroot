################################################################################
#
# kmscube-gles2
#
################################################################################

KMSCUBE_GLES2_VERSION = 345111481d654b38a72b5c3629151dc74f7a82bc
KMSCUBE_GLES2_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_GLES2_VERSION)
KMSCUBE_GLES2_LICENSE = MIT
KMSCUBE_GLES2_LICENSE_FILES = COPYING
KMSCUBE_GLES2_DEPENDENCIES = host-pkgconf libdrm libegl libgbm libgles

$(eval $(meson-package))
