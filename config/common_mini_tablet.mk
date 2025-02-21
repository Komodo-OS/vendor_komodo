# Inherit mobile mini common Lineage stuff
$(call inherit-product, vendor/komodo/config/common_mobile_mini.mk)

# Inherit tablet common Lineage stuff
$(call inherit-product, vendor/komodo/config/tablet.mk)

$(call inherit-product, vendor/komodo/config/telephony.mk)
