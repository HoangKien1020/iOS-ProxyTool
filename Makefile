TARGET := iphone:clang:15.5:11.0
ARCHS = arm64 arm64e

ADDITIONAL_OBJCFLAGS = -fobjc-arc

THEOS_DEVICE_IP = 192.168.0.103 -p 22

include $(THEOS)/makefiles/common.mk

TOOL_NAME = proxytool

proxytool_FILES = main.mm WiFiProxy.m

proxytool_FRAMEWORKS = Foundation SystemConfiguration

proxytool_LDFLAGS = -undefined dynamic_lookup

include $(THEOS_MAKE_PATH)/tool.mk

before-package::
	ldid -S./Ent.plist $(THEOS_STAGING_DIR)/usr/bin/$(TOOL_NAME);
