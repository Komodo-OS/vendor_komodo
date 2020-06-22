 
# Copyright (C) 2020 Komodo-OS-Rom
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := vendor/komodo/overlay

include $(CLEAR_VARS)

LOCAL_MODULE := KomodoOverlays
LOCAL_REQUIRED_MODULES := \
    KomodoCalendar \
    KomodoCamera2 \
    KomodoDeskClock \
    KomodoDeviceSettings \
    KomodoDialer \
    KomodoDocumentsUI \
    KomodoGallery2 \
    KomodoKeyguard \
    KomodoMessaging \
    KomodoOverlayStub \
    KomodoSettings \
    KomodoSettingsProvider \
    KomodoSystemUI \
    KomodoTelephony \
    KomodoThemePicker \
    NoCutOutOverlay

include $(BUILD_PHONY_PACKAGE)

include $(call first-makefiles-under,$(LOCAL_PATH))
