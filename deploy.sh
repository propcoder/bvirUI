#! /bin/bash
sshpass -p \' rsync -avze ssh ./ machinekit@kagn-bvir.local:/home/machinekit/machinekit/configs/bvirUI
# ../machinekit-client