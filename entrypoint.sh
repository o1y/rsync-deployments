#!/bin/sh

# Start the SSH agent
source agent-start "$GITHUB_ACTION"

# Add strict errors.
set -eu

# Variables.
SWITCHES="$INPUT_SWITCHES"
RSH="ssh -o StrictHostKeyChecking=no -p $INPUT_REMOTE_PORT $INPUT_RSH"
LOCAL_PATH="$GITHUB_WORKSPACE/$INPUT_PATH"
DSN="$INPUT_REMOTE_USER@$INPUT_REMOTE_HOST"
SSHPASS="sshpass -p $INPUT_REMOTE_PASSWORD"

# Deploy.
sh -c "sshpass -p $INPUT_REMOTE_PASSWORD rsync $SWITCHES -e '$RSH' $LOCAL_PATH $DSN:$INPUT_REMOTE_PATH"
