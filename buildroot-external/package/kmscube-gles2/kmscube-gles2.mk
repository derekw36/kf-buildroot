################################################################################
#
# kmscube-gles2
#
################################################################################

KMSCUBE_GLES2_VERSION = 0be1681d09e77330e02b8d4708e47a04585f4b16
KMSCUBE_GLES2_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_GLES2_VERSION)
KMSCUBE_GLES2_LICENSE = MIT
KMSCUBE_GLES2_LICENSE_FILES = COPYING
KMSCUBE_GLES2_DEPENDENCIES = host-pkgconf libdrm libegl libgbm libgles

$(eval $(meson-package))
