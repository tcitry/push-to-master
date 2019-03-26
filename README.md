# push-to-master

## what is it

It seems like "pull request" but actually is "git push -f origin dist-branch".

```
rm -rf .git
git init
git add .
git commit -m 'Auto Pushed From Action'
git push --force master:<dist branch>
```

## main.workflow example

```
workflow "push to master" {
  on = "push"
  resolves = ["push action"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea0749eed6beb495a8fa194c071847af60ea1"
  args = "branch <pushed branch>"
}

action "push action" {
  uses = "tcitry/push-to-master/@v1.0"
  needs = "Filters for GitHub Actions"
  secrets = ["GITHUB_TOKEN"]
  args = "<dist branch>"
}

```

**NOTE: If `dist branch` is empty will push to master!**

The action need your `GITHUB_TOKEN`, or you can custom a secrets ENV `TOKEN` to fill with your token.
