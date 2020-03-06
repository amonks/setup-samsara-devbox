function run-license-check
  cd ~/co
  # clone firmware
  cd backend
  
  cp -r ../firmware/samsara/go/src/firmware.samsaradev.io/apps/license-crawler ./go/src/samsaradev.io/license-crawler
  go run samsaradev.io/license-crawler

  # echo "RUNNING LICENSE CHECK"
  # cd ~/co/license-check
  # and yarn build
  # and ./build/main.js --corrections --overrides="$HOME/license-overrides.txt" "$HOME/license-config.js" > ~/licenses.csv
  # and echo "DONE"
  # or echo "BUSTED"
end
