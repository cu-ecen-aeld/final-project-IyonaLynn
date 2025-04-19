##############################################################
#
# AESD_PROJECT
#
##############################################################

AESD_PROJECT_VERSION = 'cb8c4b963facc740097a6873061564d5dbd0a062'
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
endef

$(eval $(generic-package))

