#!/bin/bash

echo "Creating the repokid cronjob..."
/bin/sed -i -e "s/REPOKID_CRONJOB_SPEC/$REPOKID_CRONJOB_SPEC/g" \
            -e "s/REPOKID_ACCOUNT/$REPOKID_ACCOUNT/g" \
            -e "s#ENV_AWS_CONTAINER_CREDENTIALS_RELATIVE_URI#$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI#g" \
            -e "s#ENV_AWS_CONTAINER_CREDENTIALS_FULL_URI#$AWS_CONTAINER_CREDENTIALS_FULL_URI#g" \
            -e "s#ENV_AWS_CONTAINER_AUTHORIZATION_TOKEN#$AWS_CONTAINER_AUTHORIZATION_TOKEN#g" \
            /etc/cron.d/repokid

echo "Generating config file from env vars and template..."
python config_from_env.py
echo "Starting cron daemon..."
cron -f
