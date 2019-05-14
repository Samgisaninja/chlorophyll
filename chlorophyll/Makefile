include $(THEOS)/makefiles/common.mk
ARCHS = armv7 armv7s arm64 arm64e
TARGET = iphone:clang:11.2:11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk

BUNDLE_NAME = Chlorophyll
Chlorophyll_FILES = CHLRootListController.m
Chlorophyll_INSTALL_PATH = /Library/PreferenceBundles
Chlorophyll_FRAMEWORKS = UIKit
Chlorophyll_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Chlorophyll.plist$(ECHO_END)
