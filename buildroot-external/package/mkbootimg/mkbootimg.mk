################################################################################
#
# mkbootimg
#
################################################################################

MKBOOTIMG_VERSION = 2022.11.09
MKBOOTIMG_SITE = $(call github,osm0sis,mkbootimg,$(MKBOOTIMG_VERSION))
MKBOOTIMG_LICENSE = Apache-2.0
MKBOOTIMG_LICENSE_FILES = NOTICE

define HOST_MKBOOTIMG_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)
endef

define HOST_MKBOOTIMG_INSTALL_CMDS
	$(INSTALL) -D -m 755 $(@D)/mkbootimg $(HOST_DIR)/bin/mkbootimg
	$(INSTALL) -D -m 755 $(@D)/unpackbootimg $(HOST_DIR)/bin/unpackbootimg
endef

$(eval $(host-generic-package))
