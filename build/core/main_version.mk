# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
BUILD_NUMBER_KOMODO := $(shell date -u +%H%M)
KOMODO_DEVICE ?= $(TARGET_DEVICE)
ifneq ($(filter OFFICIAL,$(KOMODO_BUILD_TYPE)),)
BUILD_SIGNATURE_KEYS := release-keys
else
BUILD_SIGNATURE_KEYS := test-keys
endif
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(KOMODO_DEVICE)/$(KOMODO_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    persist.sys.recovery_update=true
endif

# Compress AOSP recovery, for our infra
ifeq ($(TARGET_USES_TAR_COMPRESSED_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.pixelexperience.tar_compressed_recovery=true
endif

# Custom security patch
KOMODO_SECURITY_PATCH := 2022-08-05

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.komodo.version=$(KOMODO_VERSION_PROP) \
    org.komodo.version.display=$(KOMODO_VERSION) \
    org.komodo.build_date=$(KOMODO_BUILD_DATE) \
    org.komodo.build_date_utc=$(KOMODO_BUILD_DATE_UTC) \
    org.komodo.build_type=$(KOMODO_BUILD_TYPE) \
    org.komodo.build_security_patch=$(KOMODO_SECURITY_PATCH)
