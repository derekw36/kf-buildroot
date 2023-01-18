################################################################################
#
# ti-sgx-um-443x
#
################################################################################

# This makefile was copied from buildroot 2022.08.3
# Modifications:
# - Rename to ti-sgx-um-443x
# - Update version to 742cf38aba13e1ba1a910cf1f036a1a212c263b6
# - Change TI_SGX_UM_TARGET to ti443x
# - Remove INIT_SYSV definition since the module is probed with device tree
# - Install udev rules

TI_SGX_UM_443X_VERSION = 742cf38aba13e1ba1a910cf1f036a1a212c263b6
TI_SGX_UM_443X_SITE = http://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
TI_SGX_UM_443X_SITE_METHOD = git
TI_SGX_UM_443X_LICENSE = TI TSPA License
TI_SGX_UM_443X_LICENSE_FILES = TI-Linux-Graphics-DDK-UM-Manifest.doc
TI_SGX_UM_443X_INSTALL_STAGING = YES
TI_SGX_UM_443X_PROVIDES = libegl libgbm libgles powervr
TI_SGX_UM_443X_TARGET = ti443x

# ti-sgx-um-443x is a egl/gles provider only if libdrm is installed
TI_SGX_UM_443X_DEPENDENCIES = libdrm wayland

define TI_SGX_UM_443X_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) \
		TARGET_PRODUCT=$(TI_SGX_UM_443X_TARGET) install
endef

define TI_SGX_UM_443X_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) \
		TARGET_PRODUCT=$(TI_SGX_UM_443X_TARGET) install
endef

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
define TI_SGX_UM_443X_INSTALL_UDEV_RULES
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_OTTER_PATH)/package/ti-sgx-um-443x/80-pvrsrv.rules \
		$(TARGET_DIR)/etc/udev/rules.d/80-pvrsrv.rules
endef

TI_SGX_UM_443X_POST_INSTALL_TARGET_HOOKS += TI_SGX_UM_443X_INSTALL_UDEV_RULES
endif

$(eval $(generic-package))
