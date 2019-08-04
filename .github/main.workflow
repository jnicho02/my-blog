workflow "Build and deploy on push" {
  on = "push"
  resolves = ["bundle install"]
}

action "bundle install" {
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  args = "build -f Dockerfile -t ci-$GITHUB_SHA:latest ."
}
