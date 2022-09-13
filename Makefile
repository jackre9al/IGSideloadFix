export TROLLSTORE ?= 0

MODULES = jailed
include $(THEOS)/makefiles/common.mk
ARCHS = arm64
CODESIGN_IPA = 0
FINALPACKAGE = 1

TWEAK_NAME = Hackogram
DISPLAY_NAME = Instagram

Hackogram_FILES = Init.x

ifeq ($(TROLLSTORE),1)
BUNDLE_ID = com.burbn.instagram
Hackogram_CFLAGS += -D TROLLSTORE=1
else
BUNDLE_ID = com.burbn.instagram
Hackogram_FILES += SideloadedFixes.x
endif

# add your paths here
Hackogram_IPA = path/to/the/decrypted/Instagram/ipa
Hackogram_INJECT_DYLIBS = Tweaks/Rocket.dylib

include $(THEOS_MAKE_PATH)/tweak.mk

after-package::
	@rm -rf .theos/_/Payload
	@open ./packages