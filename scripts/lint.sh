#!/bin/bash

. scripts/common.sh

function lint_chart() {
  chart_name=$1
  chart_file=$2

  echo -e "==> ${GREEN}Linting $chart_name...${RS}"
  output=`helm lint $chart_file --debug 2> /dev/null`
  if [ $? -ne 0 ]; then
    echo -e "===> ${RED} Linting errors for chart $chart_name ${RS}"
    echo -e "$output" | grep "\\["
    exit 1
  fi
  echo -e "$output" | grep "\\["
}

# Jenkins's working dir is not pnda-helm-repo, so copy to tmp dir before linting
if [[ $JENKINS_HOME ]]; then
  rm -rf /tmp/cloud-pnda
  cp -R cloud-pnda /tmp/
  cd /tmp/cloud-pnda
fi

lint_chart cloud-pnda cloud-pnda

for chart in `ls -1 cloud-pnda/charts`; do
  lint_chart $chart cloud-pnda/charts/$chart
done

echo -e "==> ${GREEN} No linting errors${RS}"
