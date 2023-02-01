################################################################################
#
# qt-kiosk-browser
#
################################################################################

QT_KIOSK_BROWSER_VERSION = 9ebcb0956179d5f671abc5f713aef81da12d852a
QT_KIOSK_BROWSER_SITE = https://github.com/OSSystems/qt-kiosk-browser.git
QT_KIOSK_BROWSER_SITE_METHOD = git
QT_KIOSK_BROWSER_DEPENDENCIES = qt5webengine
QT_KIOSK_BROWSER_LICENSE = GPL-3.0
QT_KIOSK_BROWSER_LICENSE_FILES = LICENSE

QT_KIOSK_BROWSER_CONF_OPTS = PREFIX=/usr

define QT_KIOSK_BROWSER_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		INSTALL_ROOT=$(TARGET_DIR) \
		install_target
endef

define QT_KIOSK_BROWSER_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 $(BR2_EXTERNAL_OTTER_PATH)/package/qt-kiosk-browser/qt-kiosk-browser@.service \
		$(TARGET_DIR)/usr/lib/systemd/system/qt-kiosk-browser@.service
endef

define QT_KIOSK_BROWSER_INSTALL_CONF_FILES
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_OTTER_PATH)/package/qt-kiosk-browser/example.json \
		$(TARGET_DIR)/etc/qt-kiosk-browser/example.json
endef

QT_KIOSK_BROWSER_POST_INSTALL_TARGET_HOOKS += QT_KIOSK_BROWSER_INSTALL_CONF_FILES

$(eval $(qmake-package))
