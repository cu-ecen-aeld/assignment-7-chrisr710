
##############################################################
#
# misc modules 
#
##############################################################

#https://buildroot.org/downloads/manual/manual.html#adding-packages
SCULL_VERSION = '1'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
#TOPDIR MEANS THE DIR CALLED buildroot, so ../dirname would be a dir in the same dir as buildroot
MISC_MODULES_SITE = $(TOPDIR)/../src/libfoo'
MISC_MODULES_SITE_METHOD = local


define MISC_MODULES_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define MISC_MODULES_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))

