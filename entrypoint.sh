#! /bin/bash

set -e

if [ -z "$SERVICE_ACCOUNT" ]; then
  echo "Environment variable 'SERVICE_ACCOUNT' not found. Add Service Account JSON file as text"
  exit 1
fi

status=0
app=$1
test=$2
device-id=$3
os-version-id=$4
orientation=$5
type=$7
locale=$6
num-flaky-test-attempts=$8
timeout=$9

echo "$SERVICE_ACCOUNT" > $service_account_file
project_id=$(cat $service_account_file | jq -r ".project_id")

gcloud auth activate-service-account --key-file=$service_account_file
gcloud config set project $project_id

if gcloud firebase test android run --app=$app --test=$test --type=$type --device=model=$device-id,version=$os-version-id,locale=$locale,orientation=$orientation --num-flaky-test-attempts=$num-flaky-test-attempts --timeout=$timeout
then
    echo "Test execution successfully finished"
else
    status=$?
    echo "Test execution exited with non-zero exit code: " $status
fi

rm $service_account_file

exit $status