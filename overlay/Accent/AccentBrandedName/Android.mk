LOCAL_PATH := vendor/komodo/overlay/Accent/AccentBrandedName

include $(CLEAR_VARS)

LOCAL_MODULE := AccentBrandedName
LOCAL_REQUIRED_MODULES := \
	AndroidOneGreen \
	AospaGreen \
	CocaColaRed \
	DiscordPurple \
	FacebookBlue \
	InstagramCerise \
	JollibeeCrimson \
	OneplusRed \
	PepsiBlue \
	PocophoneYellow \
	RazerGreen \
	SamsungBlue \
	SpotifyGreen \
	StarbucksGreen \
	TwitchPurple \
	TwitterBlue \
	XboxGreen \
	XiaomiOrange

include $(BUILD_PHONY_PACKAGE)

include $(call first-makefiles-under,$(LOCAL_PATH))
