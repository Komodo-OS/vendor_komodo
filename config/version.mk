#
# Copyright (C) 2024 FortuneOS
# Copyright (C) 2025 KomodoOS
#
# SPDX-License-Identifier: Apache-2.0
#

KOMODO_BRAND := KomodoOS
KOMODO_BUILD_VERSION := Varanus
KOMODO_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

DEVICE_LIST := $(shell cat official_devices/devices.list)

ifneq (,$(findstring $(KOMODO_BUILD),$(DEVICE_LIST)))
    KOMODO_BUILD_TYPE := OFFICIAL
else
    KOMODO_BUILD_TYPE := UNOFFICIAL
endif
KOMODO_VERSION := $(KOMODO_BRAND)_$(KOMODO_BUILD)-$(KOMODO_BUILD_VERSION)-$(KOMODO_BUILD_DATE)-$(KOMODO_BUILD_TYPE)
# KomodoOS Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    org.komodo.build.version=$(KOMODO_BUILD_VERSION) \
    org.komodo.build.date=$(KOMODO_BUILD_DATE) \
    org.komodo.build.type=$(KOMODO_BUILD_TYPE) \
    org.komodo.version=$(KOMODO_VERSION)

