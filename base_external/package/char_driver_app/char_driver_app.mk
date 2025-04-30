CHAR_DRIVER_APP_VERSION        = cf97d647fc060a540bec263c749e7dcd73d11fcf
CHAR_DRIVER_APP_SITE           = git@github.com:IyonaLynn/Accelerometer_Character_Device_Driver.git
CHAR_DRIVER_APP_SITE_METHOD    = git
CHAR_DRIVER_APP_GIT_SUBMODULES = YES
CHAR_DRIVER_APP_MODULE_SUBDIRS = lsm9ds1_test gpio_test demo_app

define CHAR_DRIVER_APP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lsm9ds1_test all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test   all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
	  CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
	  -C $(@D)/demo_app all
endef

define CHAR_DRIVER_APP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 \
	  $(@D)/lsm9ds1_test/lsm9ds1_test \
	  $(TARGET_DIR)/usr/bin/lsm9ds1_test
	$(INSTALL) -D -m 0755 \
	  $(@D)/gpio_test/gpio_test \
	  $(TARGET_DIR)/usr/bin/gpio_test
	$(INSTALL) -D -m 0755 \
	  $(@D)/demo_app/demo_app \
	  $(TARGET_DIR)/usr/bin/demo_app
endef

$(eval $(generic-package))

