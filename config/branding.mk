KOMODO_VARIANT ?= TOXICOFERA
KOMODO_BASE_VERSION := 5.0
KOMODO_CODENAME := Tamara
KOMODO_PLATFORM_VERSION := 13

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
PRODUCT_SYSTEM_DEFAULT_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# System version
KOMODO_BUILD_DATE := $(shell date -u +%Y%m%d)

# Komodo security patch
KOMODO_SECURITY_PATCH := 2022-08-05

# Date version
KOMODO_DATE_YEAR := $(shell date -u +%Y)
KOMODO_DATE_MONTH := $(shell date -u +%m)
KOMODO_DATE_DAY := $(shell date -u +%d)
KOMODO_DATE_HOUR := $(shell date -u +%H)
KOMODO_DATE_MINUTE := $(shell date -u +%M)
KOMODO_BUILD_DATE_UTC := $(shell date -d '$(KOMODO_DATE_YEAR)-$(KOMODO_DATE_MONTH)-$(KOMODO_DATE_DAY) $(KOMODO_DATE_HOUR):$(KOMODO_DATE_MINUTE) UTC' +%s)
KOMODO_BUILD_DATE := $(KOMODO_DATE_YEAR)$(KOMODO_DATE_MONTH)$(KOMODO_DATE_DAY)-$(KOMODO_DATE_HOUR)$(KOMODO_DATE_MINUTE)

# Official Build
ifeq ($(KOMODO_BUILD_TYPE), OFFICIAL)
    KOMODO_BUILD_TYPE := OFFICIAL
else
    KOMODO_BUILD_TYPE := UNOFFICIAL
endif

# Gapps
ifeq ($(WITH_GAPPS), true)
     KOMODO_VARIANT := GAPPS
     $(call inherit-product, vendor/gapps/config.mk)
endif

KOMODO_VERSION := KomodoOS$(KOMODO_BUILD_VERSION)-$(KOMODO_BASE_VERSION)-$(KOMODO_CODENAME)-$(KOMODO_BUILD_TYPE)-$(KOMODO_BUILD)-$(KOMODO_VARIANT)-$(KOMODO_BUILD_DATE)
KOMODO_VERSION_PROP := thirteen

# Versioning props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES  += \
    org.komodo.version=$(KOMODO_BASE_VERSION) \
    org.komodo.version.name=$(KOMODO_CODENAME) \
    org.komodo.version.display=$(KOMODO_VERSION) \
    org.komodo.build_date=$(KOMODO_BUILD_DATE) \
    org.komodo.build_date_utc=$(KOMODO_BUILD_DATE_UTC) \
    org.komodo.build_type=$(KOMODO_BUILD_TYPE) \
    org.komodo.build_security_patch=$(KOMODO_SECURITY_PATCH)
    ro.komodo.maintainer=$(Komodo_MAINTAINER)

# Display Versioning
KOMODO_DISPLAY_VERSION := $(PRODUCT_BRAND)-v$(KOMODO_BASE_VERSION)-$(KOMODO_CODENAME)-$(KOMODO_BUILD_TYPE)
