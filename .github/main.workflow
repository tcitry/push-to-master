workflow "push to master" {
  on = "push"
  resolves = ["push action"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea0749eed6beb495a8fa194c071847af60ea1"
  args = "branch dev"
}

action "push action" {
  uses = "tcitry/push-to-master/@v1.0"
  needs = "Filters for GitHub Actions"
  secrets = ["GITHUB_TOKEN"]
  args = ""
}
