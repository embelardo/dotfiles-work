#!/bin/bash

# Go to a place
alias cdeb='cd /home/admin/ebelardo'
alias logautoroute='cd /var/log/PACS/AutoRoute'
alias logimageserver='cd /var/log/PACS/image_server'

alias loglds='cd /var/log/PACS/LocalDicomService'
alias rslds='pidCheck LocalDicomService.pid; kill_LocalDicomService.sh && run_LocalDicomService.sh; sleep 2 && pidCheck LocalDicomService.pid'

restart() {
    PROCESS="$1"
    pidCheck "$PROCESS".pid
    kill_"$1".sh; run_"$1".sh
    sleep 3
    pidCheck "$PROCESS".pid
}
