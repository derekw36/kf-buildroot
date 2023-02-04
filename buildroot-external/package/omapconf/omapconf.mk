################################################################################
#
# omapconf
#
################################################################################

OMAPCONF_VERSION = 1.75
OMAPCONF_SITE = $(call github,omapconf,omapconf,v$(OMAPCONF_VERSION))
OMAPCONF_LICENSE = BSD-3-Clause, GPL-2.0
OMAPCONF_LICENSE_FILES = LICENSE

define OMAPCONF_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) \
		STATIC_BUILD=
endef

define OMAPCONF_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr/bin install
endef

$(eval $(generic-package))
