
##############################################################
#
# AESDCHARDRIVER
#
##############################################################

AESDCHARDRIVER_VERSION = 'ec854f9e2d861be63ad291182c240a35c3a2ae99'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHARDRIVER_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-IyonaLynn.git'
AESDCHARDRIVER_SITE_METHOD = git
AESDCHARDRIVER_GIT_SUBMODULES = YES

AESDCHARDRIVER_MODULE_SUBDIRS = aesd-char-driver

define AESDCHARDRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
