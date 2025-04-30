##############################################################
#
# AESD_PROJECT
#
##############################################################

AESD_PROJECT_VERSION         = 'a3c9b283ef26e4782b15481c799bf6872982aaa8'
AESD_PROJECT_SITE            = git@github.com:IyonaLynn/Accelerometer_Character_Device_Driver.git
AESD_PROJECT_SITE_METHOD     = git
AESD_PROJECT_GIT_SUBMODULES  = YES
AESD_PROJECT_MODULE_SUBDIRS  = char_driver

define AESD_PROJECT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lsm9ds1_test all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test   all
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

