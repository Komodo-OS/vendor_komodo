#
# Copyright (C) 2024 FortuneOS
# Copyright (C) 2025 KomodoOS
#
# SPDX-License-Identifier: Apache-2.0
#

KOMODO_BRAND := KomodoOS
KOMODO_BUILD_VERSION := Varanus
KOMODO_BASE_VERSION := 5.0

KOMODO_DATE_YEAR := $(shell date -u +%Y)
KOMODO_DATE_MONTH := $(shell date -u +%m)
KOMODO_DATE_DAY := $(shell date -u +%d)
KOMODO_DATE_HOUR := $(shell date -u +%H)
KOMODO_DATE_MINUTE := $(shell date -u +%M)
KOMODO_BUILD_DATE_UTC := $(shell date -d '$(KOMODO_DATE_YEAR)-$(KOMODO_DATE_MONTH)-$(KOMODO_DATE_DAY) $(KOMODO_DATE_HOUR):$(KOMODO_DATE_MINUTE) UTC' +%s)
KOMODO_BUILD_DATE := $(KOMODO_DATE_YEAR)$(KOMODO_DATE_MONTH)$(KOMODO_DATE_DAY)-$(KOMODO_DATE_HOUR)$(KOMODO_DATE_MINUTE)

ifeq ($(KOMODO_OFFICIAL), true)
    DEVICE_LIST := $(shell cat official_devices/devices.list)
    
    ifneq (,$(findstring $(KOMODO_BUILD),$(DEVICE_LIST)))
        KOMODO_BUILD_TYPE := OFFICIAL
    else
        KOMODO_BUILD_TYPE := UNOFFICIAL
    endif
else
    KOMODO_BUILD_TYPE := UNOFFICIAL
endif

KOMODO_VERSION := $(KOMODO_BRAND)-v$(KOMODO_BASE_VERSION)-$(KOMODO_BUILD)-$(KOMODO_BUILD_TYPE)-$(KOMODO_BUILD_VERSION)-$(KOMODO_BUILD_DATE)

ifeq ($(WITH_GAPPS), true)
    KOMODO_VERSION := $(KOMODO_BRAND)-v$(KOMODO_BASE_VERSION)-$(KOMODO_BUILD)-$(KOMODO_BUILD_TYPE)-$(KOMODO_BUILD_VERSION)-GAPPS-$(KOMODO_BUILD_DATE)
endif

# KomodoOS Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    org.komodo.version=$(KOMODO_BASE_VERSION) \
    org.komodo.version.name=$(KOMODO_BUILD_VERSION) \
    org.komodo.version.display=$(KOMODO_VERSION) \
    org.komodo.build_date=$(KOMODO_BUILD_DATE) \
    org.komodo.build_date_utc=$(KOMODO_BUILD_DATE_UTC) \
    org.komodo.build_type=$(KOMODO_BUILD_TYPE) \
    org.komodo.maintainer=$(KOMODO_MAINTAINER)
