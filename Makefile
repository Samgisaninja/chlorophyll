include $(THEOS)/makefiles/common.mk

TWEAK_NAME = chlorophyll
chlorophyll_FILES = Tweak.xm
SHARED_CFLAGS = -fobjc-arc
ARCHS = armv7 armv7s arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
