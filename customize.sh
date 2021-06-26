#!/system/bin/sh
# Gorillaz Injector created by haxislancelot @ GitHub, If you're going to use some code from my module, give me the credits, I'll be grateful.
DEBUG=true

if [[ ! -e "/sdcard/Gorillaz-Injector" ]]; then
   rm -rf /sdcard/Gorillaz-Injector
fi

mkdir "/sdcard/Gorillaz-Injector"

log=/sdcard/Gorillaz-Injector/installation.log
echo "If this file is useless to you, you can delete it." >> $log

SKIPUNZIP=0
unzip -qjo "$ZIPFILE" 'common/git-banner.sh' -d "$TMPDIR" >&2
. "$TMPDIR"/git-banner.sh

sleep 4
ui_print ""
ui_print "- Gorillaz-Injector is a full featured Magisk module to enhance your device experience,"
ui_print "- Improve your gaming, ram and battery!"
sleep 2
ui_print ""
ui_print "- Module created with much love ♥️ by haxislancelot @ GitHub."
sleep 2
ui_print ""
ui_print "- Thank you for trusting my work, I thank you deeply."
sleep 2
ui_print ""
ui_print "- Thanks to all testers and supporters of the project!"
ui_print ""
sleep 2

set_permissions() {
  set_perm_recursive "$MODPATH"/system/bin 0 0 0777 0755
}

SKIPUNZIP=0
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d "$TMPDIR" >&2
. "$TMPDIR"/functions.sh

ui_print "- Installation completed successfully!"
echo "Installation completed successfully!" >> $log
