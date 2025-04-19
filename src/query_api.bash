# query_api: Query the Codestral API with a given prompt.
# Input:
#   The file contents
# Arguments:
#   $1: working filename
#   $2: task instruction
# Outputs:
#   Writes the AI's response to STDOUT.

query_api() {
    # Rate limit using /tmp
    local stamp_file="/tmp/query_api_last_call"
    local now
    now=$(date +%s)
    local last_call=0
    [[ -f "$stamp_file" ]] && read -r last_call <"$stamp_file"
    local elapsed=$((now - last_call))
    ((elapsed < 2)) && sleep $((2 - elapsed))
    echo "$now" >"$stamp_file"

    local filename="$1"
    local task="$2"

    local prompt
    prompt=$(
        cat <<EOF
You are Codestral, a cutting-edge AI model for code editing, completion, and correction.

Task: $task

You are working on the file: $filename

--- BEGIN FILE CONTENT ---
$(cat)
--- END FILE CONTENT ---

Now provide the output as per the task above.
EOF
    )

    local api_response
    api_response=$(curl --no-progress-meter --location "https://codestral.mistral.ai/v1/chat/completions" \
        --header 'Content-Type: application/json' \
        --header 'Accept: application/json' \
        --header "Authorization: Bearer $MISTRAL_API_KEY" \
        --data "$(jq -n --arg prompt "$prompt" '{
            model: "codestral-latest",
            messages: [
                {role: "user", content: $prompt}
            ]
        }')")

    local response
    response=$(echo "$api_response" | jq -r '.choices[0].message.content')

    if [[ -z "$response" ]] || [[ "$response" = null ]]; then
        echo "Error: No valid response from Codestral API" >&2
        jq <<<"$api_response" >&2
        exit 1
    fi

    echo "$response"
}
