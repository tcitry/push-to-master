# push-to-master

```
workflow "push to master" {
  on = "push"
  resolves = ["push action"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea0749eed6beb495a8fa194c071847af60ea1"
  args = "branch <your branch>"
}

action "push action" {
  uses = "tcitry/push-to-master/@master"
  needs = "Filters for GitHub Actions"
  secrets = ["GITHUB_TOKEN"]
}

```