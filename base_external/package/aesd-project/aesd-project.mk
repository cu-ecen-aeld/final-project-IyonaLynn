##############################################################
#
# AESD_PROJECT
#
##############################################################

AESD_PROJECT_VERSION = 'e03fcb40debd003559f04b75e203e470dd25a41c'
AESD_PROJECT_SITE = git@github.com:IyonaLynn/Accelerometer_Character_Device_Driver.git
AESD_PROJECT_SITE_METHOD = git
AESD_PROJECT_GIT_SUBMODULES = YES

define AESD_PROJECT_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/driver all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/accl all
endef

define AESD_PROJECT_INSTALL_TARGET_CMDS
	# Install user-space app
	$(INSTALL) -m 0755 $(@D)/accl/i2c_read_app $(TARGET_DIR)/usr/bin
	
	# Install init script
	$(INSTALL) -m 0755 $(@D)/init.d/S95i2csetup $(TARGET_DIR)/etc/init.d
endef

$(eval $(generic-package))

