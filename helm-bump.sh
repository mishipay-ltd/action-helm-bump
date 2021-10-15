#!/bin/bash

set -eu

install_pybump () {
    if [ -n "${PYBUMP_VERSION:-}" ]; then
        pybump="pybump==$PYBUMP_VERSION"
    else
        pybump="pybump"
    fi
    pip install "$pybump"
}

bump_chart_version() {
    chart="${CHARTS_DIR%%/}/${CHART_NAME%%/}/Chart.yaml"
    pybump set --file "$chart" --app-version --set-version "$APP_VERSION" > /dev/null
    # prints new version to stdout
    pybump bump --file "$chart" --level minor
}

main() {
    install_pybump
    bump_chart_version
}

main
