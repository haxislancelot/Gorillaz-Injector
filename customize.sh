#!/system/bin/sh
# Niko Tweaks created by haxislancelot @ GitHub, If you're going to use some code from my module, give me the credits, I'll be grateful.
DEBUG=true

if [[ ! -e "/sdcard/Niko Logs" ]]; then
   rm -rf /sdcard/Niko Logs
fi

mkdir "/sdcard/Niko Logs"

log=/sdcard/Niko Logs/installation.log
echo "If this file is useless to you, you can delete it." >> $log

sleep 4
ui_print "╭━╮╱╭╮╭━━╮╭╮╭━╮╭━━━╮"
ui_print "┃┃╰╮┃┃╰┫┣╯┃┃┃╭╯┃╭━╮┃"
ui_print "┃╭╮╰╯┃╱┃┃╱┃╰╯╯╱┃┃╱┃┃"
ui_print "┃┃╰╮┃┃╱┃┃╱┃╭╮┃╱┃┃╱┃┃"
ui_print "┃┃╱┃┃┃╭┫┣╮┃┃┃╰╮┃╰━╯┃"
ui_print "╰╯╱╰━╯╰━━╯╰╯╰━╯╰━━━╯"
ui_print "╭━━━━╮╭╮╭╮╭╮╭━━━╮╭━━━╮╭╮╭━╮╭━━━╮"
ui_print "┃╭╮╭╮┃┃┃┃┃┃┃┃╭━━╯┃╭━╮┃┃┃┃╭╯┃╭━╮┃"
ui_print "╰╯┃┃╰╯┃┃┃┃┃┃┃╰━━╮┃┃╱┃┃┃╰╯╯╱┃╰━━╮"
ui_print "╱╱┃┃╱╱┃╰╯╰╯┃┃╭━━╯┃╰━╯┃┃╭╮┃╱╰━━╮┃"
ui_print "╱╱┃┃╱╱╰╮╭╮╭╯┃╰━━╮┃╭━╮┃┃┃┃╰╮┃╰━╯┃"
ui_print "╱╱╰╯╱╱╱╰╯╰╯╱╰━━━╯╰╯╱╰╯╰╯╰━╯╰━━━╯"
ui_print ""
ui_print "- Niko Tweaks is a full featured Magisk module to enhance your device experience,"
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
