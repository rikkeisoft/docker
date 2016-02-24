#!/bin/bash
/root/go-cron -s "${GOCRON_SCHEDULE}" -p 3000 -- /bin/bash -c "/jobs/${CRONJOB_COMMAND}"
