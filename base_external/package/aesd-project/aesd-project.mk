##############################################################
#
# AESD_PROJECT
#
##############################################################

AESD_PROJECT_VERSION = 'bb4875f30ae9050aa586c173955177038b38954d'
AESD_PROJECT_SITE = git@github.com:IyonaLynn/Accelerometer_Character_Device_Driver.git
AESD_PROJECT_SITE_METHOD = git
AESD_PROJECT_GIT_SUBMODULES = YES

define AESD_PROJECT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/accl all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio all
endef

define AESD_PROJECT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/accl/i2c_read_app $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))

