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

# Run sqlite
sqlite
