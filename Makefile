GO_EASY_ON_ME = 1
DEBUG = 0
FINALPACKAGE = 1

TARGET := iphone:clang:14.5:14.5
ARCHS = arm64

THEOS_PACKAGE_SCHEME = rootless
THEOS_DEVICE_IP = 192.168.0.108 -p 22

include $(THEOS)/makefiles/common.mk

TOOL_NAME = proxytool

proxytool_FILES = main.mm WiFiProxy.m

proxytool_FRAMEWORKS = Foundation SystemConfiguration

proxytool_LDFLAGS = -undefined dynamic_lookup

include $(THEOS_MAKE_PATH)/tool.mk

before-package::
	ldid -S./Ent.plist $(THEOS_STAGING_DIR)/usr/bin/$(TOOL_NAME);
