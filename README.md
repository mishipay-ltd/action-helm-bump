# action-helm-bump

A GitHub action to bump a helm charts appVersion for a microservice after release.
The version of the chart itself is bumped by 0.1.0 (minor).

# Usage

Add the following step to your workflow configuration:

```yaml
steps:
  - uses: mishipay-ltd/action-helm-bump@0.1.0
    with:
      token: ${{ secrets.READONLY_PAT }} # requires write access to charts repo
      chart-name: myChart # name of helm chart
      app-version: 1.2.3 # new appVersion of the service
```
