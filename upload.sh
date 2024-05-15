RESPONSE=$(curl -s -X POST -H "Authorization: Bearer $REPLICATE_API_TOKEN" https://dreambooth-api-experimental.replicate.com/v1/upload/data.jsonl)

curl -X PUT -H "Content-Type: application/jsonl" --upload-file data.jsonl "$(jq -r ".upload_url" <<< "$RESPONSE")"

SERVING_URL=$(jq -r ".serving_url" <<< $RESPONSE)
echo $SERVING_URL