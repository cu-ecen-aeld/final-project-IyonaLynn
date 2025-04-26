##############################################################
#
# AESD_PROJECT
#
##############################################################

AESD_PROJECT_VERSION = '6326559ac1b4a1001b30aa877bfbd593e56b517e'
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

