endpoints=(sizes regions images ssh_keys)
for i in "${endpoints[@]}"; do
  url=`printf "https://api.digitalocean.com/v1/%s/?client_id=%s&api_key=%s" $i $DO_CLIENT_ID $DO_API_KEY`
  echo $url
  curl $url | python -mjson.tool
done
