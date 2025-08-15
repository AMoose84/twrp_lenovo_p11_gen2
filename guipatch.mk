# GUI fix?
$(shell sed -i 's/.*name="mid_transparent" val.*/<variable name="mid_transparent"  value="#00000040" \/>/g' $(TOP)/bootable/recovery/gui/theme/portrait_hdpi/ui.xml)
$(shell sed -i 's/.*name="semi_transparent" val.*/<variable name="semi_transparent"  value="#000000B0" \/>/g' $(TOP)/bootable/recovery/gui/theme/portrait_hdpi/ui.xml)
$(shell sed -i 's/.*<template name="sort_options_new">$$/<template name="sort_options_new"><background color="%semi_transparent%" \/>/g' $(TOP)/bootable/recovery/gui/theme/portrait_hdpi/ui.xml)
