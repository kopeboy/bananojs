#!/bin/bash
RPCs=("https://rpc.nano.to" "https://" "ElementC" "ElementE")
rpc_i=0


while IFS= read -r address; do
  rpc=${RPCs[rpc_i]}

  curl -d '{"action": "account_info", "account": "$address"}' -H "Content-Type: application/json" "$rpc" >> checked_addresses.txt

  rpc_i+=1
  sleep 0.1
done < received_nano_addresses.txt
