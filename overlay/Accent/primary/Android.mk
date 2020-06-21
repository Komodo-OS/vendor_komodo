LOCAL_PATH := vendor/komodo/overlay/Accent/primary

include $(CLEAR_VARS)

LOCAL_MODULE := AccentPrimary
LOCAL_REQUIRED_MODULES := \
	Black \
	CharcoalBlack \
	Flame \
	Nature \
	Ocean

include $(BUILD_PHONY_PACKAGE)

include $(call first-makefiles-under,$(LOCAL_PATH))
