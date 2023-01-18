################################################################################
#
# ti-sgx-km-443x
#
################################################################################

# This makefile was copied from buildroot 2022.08.3
# Modifications:
# - Rename to ti-sgx-km-443x
# - Update version to eda7780bfd5277e16913c9bc0b0e6892b4e79063
# - Enable DRM_LEGACY in kernel config using LINUX_CONFIG_FIXUPS
# - Change TI_SGX_KM_PLATFORM_NAME to ti443x

TI_SGX_KM_443X_VERSION = eda7780bfd5277e16913c9bc0b0e6892b4e79063
TI_SGX_KM_443X_SITE = http://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git
TI_SGX_KM_443X_SITE_METHOD = git
TI_SGX_KM_443X_LICENSE = GPL-2.0
TI_SGX_KM_443X_LICENSE_FILES = eurasia_km/GPL-COPYING

TI_SGX_KM_443X_DEPENDENCIES = linux

# CONFIG_DRM_LEGACY is required to build
define TI_SGX_KM_443X_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_DRM_LEGACY)
endef

TI_SGX_KM_443X_MAKE_OPTS = \
	$(LINUX_MAKE_FLAGS) \
	KERNELDIR=$(LINUX_DIR) \
	TARGET_PRODUCT=$(TI_SGX_KM_443X_PLATFORM_NAME)

TI_SGX_KM_443X_PLATFORM_NAME = ti443x

TI_SGX_KM_443X_SUBDIR = eurasia_km/eurasiacon/build/linux2/omap_linux

define TI_SGX_KM_443X_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_443X_MAKE_OPTS) \
		-C $(@D)/$(TI_SGX_KM_443X_SUBDIR)
endef

define TI_SGX_KM_443X_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_443X_MAKE_OPTS) \
		DISCIMAGE=$(TARGET_DIR) \
		kbuild_install -C $(@D)/$(TI_SGX_KM_443X_SUBDIR)
endef

$(eval $(generic-package))
