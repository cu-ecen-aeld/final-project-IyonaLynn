##############################################################
#
# AESD_PROJECT
#
##############################################################

AESD_PROJECT_VERSION         = '8f533aa1f3a9bcb1912eeef39dc6eb07407efd9a'
AESD_PROJECT_SITE            = git@github.com:IyonaLynn/Accelerometer_Character_Device_Driver.git
AESD_PROJECT_SITE_METHOD     = git
AESD_PROJECT_GIT_SUBMODULES  = YES
AESD_PROJECT_MODULE_SUBDIRS  = char_driver
# GUI related
AESD_PROJECT_ACCEL_GUI_CFLAGS = -Wall -Wextra -g \
    $(shell $(PKG_CONFIG_HOST_BINARY) --cflags gtk+-3.0)
AESD_PROJECT_ACCEL_GUI_LDFLAGS = \
    $(shell $(PKG_CONFIG_HOST_BINARY) --libs gtk+-3.0) -lgpiod -lm

define AESD_PROJECT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lsm9ds1_test all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test   all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
	    CFLAGS="$(TARGET_CFLAGS) $(AESD_PROJECT_ACCEL_GUI_CFLAGS)" \
	    LDFLAGS="$(TARGET_LDFLAGS) $(AESD_PROJECT_ACCEL_GUI_LDFLAGS)" \
	    -C $(@D)/accel_gui all
	    
	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
	    CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
	    -C $(@D)/demo_app all
endef

define AESD_PROJECT_BUILD_MODULE_CMDS
	# build the character-device kernel module
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/char_driver modules
endef
define AESD_PROJECT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/lsm9ds1_test/lsm9ds1_test  $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/gpio_test/gpio_test        $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/accel_gui/accel_gui        $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/demo_app/demo_app          $(TARGET_DIR)/usr/bin
endef

define AESD_PROJECT_INSTALL_TARGET_MODULE_CMDS
	# install the .ko into the modules tree
	install -D -m 0644 \
	    $(@D)/char_driver/char_driver.ko \
	    $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/kernel/drivers/aesdchar.ko
endef
$(eval $(kernel-module))
$(eval $(generic-package))

