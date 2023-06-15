#!/bin/bash
set -euo pipefail
JENKINSFILE=${1:-Jenkinsfile}
curl -u "$JENKINS_USER:$JENKINS_TOKEN" -F "jenkinsfile=<$JENKINSFILE" "$JENKINS_URL/pipeline-model-converter/validate"
