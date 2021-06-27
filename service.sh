#!/system/bin/sh

# Configure sqlite3
sqlite_opt() {
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

# Run sqlite3
sqlite_opt
