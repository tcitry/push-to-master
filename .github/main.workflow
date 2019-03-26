workflow "push to master" {
  on = "push"
  resolves = ["push action"]
}

action "push action" {
  uses = "tcitry/push-to-master/@dev"
  secrets = ["GITHUB_TOKEN"]
}
