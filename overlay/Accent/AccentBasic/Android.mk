LOCAL_PATH := vendor/komodo/overlay/Accent/AccentBasic

include $(CLEAR_VARS)

LOCAL_MODULE := AccentBasic
LOCAL_REQUIRED_MODULES := \
	  amber \
	  black \
	  blue \
	  blueGrey \
	  brown \
	  cyan \
	  deepOrange \
	  deepPurple \
	  green \
	  indigo \
	  lightBlue \
	  lightGreen \
	  lime \
	  orange \
	  pink \
	  purple \
	  red \
	  teal \
	  white \
	  yellow

include $(BUILD_PHONY_PACKAGE)

include $(call first-makefiles-under,$(LOCAL_PATH))
