workflow "Build and deploy on push" {
  on = "push"
  resolves = ["deploy"]
}

action "clone from git + build Middleman" {
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  args = "build -f Dockerfile -t ci-$GITHUB_SHA:latest ."
}

action "deploy" {
  uses = "maxheld83/ghpages@v0.2.1"
  secrets = ["GH_PAT"]
  env = {
    BUILD_DIR = "ghpages/"
  }
  needs = ["clone from git + build Middleman"]
}
