#!/system/bin/sh
# Niko Tweaks created by haxislancelot @ GitHub, If you're going to use some code from my module, give me the credits, I'll be grateful.

# Wait Boot Complete
wait_boot_complete() {
until [[ "$(getprop sys.boot_completed)" -eq 1 ]] || [[ "$(getprop dev.bootcomplete)" -eq 1 ]]; do
       sleep 2
done
}

wait_boot_complete

# Time Extra
sleep 20

# Configure sqlite3
sqlite() {
if [[ "$(find /system -name "sqlite3" -type f)" ]]; then
for i in $(find /d* -iname "*.db"); do
sqlite3 "$i" 'VACUUM;'
resVac=$?
if [[ $resVac == "0" ]]; then 
   resVac="SUCCESS"
else
   resVac="FAILED(ERRCODE)-$resVac"
fi
sqlite3 "$i" 'REINDEX;'
resIndex=$?
if [[ $resIndex == "0" ]]; then 
   resIndex="SUCCESS"
else
   resVac="FAILED(ERRCODE)-$resIndex"
fi
sqlite3 "$i" 'ANALYZE;'
    resAnlz=$?
    if [[ $resAnlz == "0" ]]; then 
       resAnlz="SUCCESS"
    else
       resVac="FAILED(ERRCODE)-$resAnlz"
    fi
  done
fi
}

# Zip align
zipalign() {
for DIR in /system/app/* /system/priv-app/* /system/product/app/* /system/product/overlay/* /data/app/* /system/product/priv-app/* /vendor/app/* /vendor/overlay/* /system_ext/app/* /system_ext/priv-app/* /product/app/* /product/priv-app/* /system/system_ext/app/* /system/system_ext/priv-app/*; do
   cd $DIR
   for APK in *.apk; do
      zipalign -c 4 "$APK"
      zipalign -f 4 "$APK" "/cache/$APK"
        cp -af -p "/cache/$APK" "$APK"
        rm -f "/cache/$APK"
    done
done
}

# Run zip align
zipalign

# Run sqlite
sqlite

# To check if service.sh was executed correctly
setprop service.sh Executed 
