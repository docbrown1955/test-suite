#!/bin/bash

RESET="\033[0m"
ERRORFONT="\033[1m\033[31m"
SUCCESSFONT="\033[1m\033[32m"
BOLDBLUEFONT="\033[1;34m"

message()
{
    echo -e "$@"
}

success()
{
    message "${SUCCESSFONT}$@${RESET}"
}

error()
{
    message "${ERRORFONT}$@${RESET}"
}

emphasis()
{
    message "${BOLDBLUEFONT}$@${RESET}"
}

if [ $# -lt 2 ]
then
    error "This program needs 2 argument: the executable and time limit (in sec)"
    exit 1
fi

executable=$1
maxTime=$2

emphasis "Launching $executable"

startTime=$SECONDS
if ! $executable
then
    error "Program $executable did not finished successfully."
    exit 1
else
    success "Program $executable ended successfully"
fi
let elapsed="$SECONDS - $startTime"
message "Elapsed time :" $elapsed "s"
if [ $maxTime -ne -1 ] && [ $maxTime -lt $elapsed ]
then
    error "Reached timeout of" $maxTime "s."
fi

sleep 1
