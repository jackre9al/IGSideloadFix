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

https://www.dropbox.com/scl/fi/yye5iqjnpgozcup8vbc6s/com.burbn.instagram-330.0.0-Decrypted.ipa?rlkey=wc4u0tkkamencs96bdjs7h6tc&st=6ubn6wtu&dl=0
Hackogram_IPA = path/to/the/decrypted/Instagram/ipa
Hackogram_INJECT_DYLIBS = Tweaks/Rocket.dylib

include $(THEOS_MAKE_PATH)/tweak.mk

after-package::
	@rm -rf .theos/_/Payload
	@open ./packages
