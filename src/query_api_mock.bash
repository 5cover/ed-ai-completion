# query_api: Query the Codestral API with a given prompt.
# Input:
#   The file contents
# Arguments:
#   $1: working filename
#   $2: task instruction
# Outputs:
#   Writes the fake AI response to STDOUT.
query_api() {
    echo "MOCK AI RESPONSE:"
    echo "WORKING FILENAME: $1"
    echo "TASK INSTRUCTION: $2"
    echo "FILE CONTENTS:"
    cat
}
