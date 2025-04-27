##############################################################
#
# AESD_PROJECT
#
##############################################################

AESD_PROJECT_VERSION = '7e7a38a34747902a53e01ba9d7896b65ea11aa6c'
AESD_PROJECT_SITE = git@github.com:IyonaLynn/Accelerometer_Character_Device_Driver.git
AESD_PROJECT_SITE_METHOD = git
AESD_PROJECT_GIT_SUBMODULES = YES

define AESD_PROJECT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lsm9ds1_test all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio_test all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/accel_gui all
endef

define AESD_PROJECT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/lsm9ds1_test/lsm9ds1_test $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/gpio_test/gpio_test $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/accel_gui/accel_gui $(TARGET_DIR)/usr/bin	
endef

$(eval $(generic-package))

