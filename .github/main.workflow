workflow "Build and check in to github" {
 on = "push"
 resolves = ["ruby.build"]
}

action "ruby.build" {
 uses = "actions/docker/cli@master"
 args = "build -f Dockerfile -t ci-$GITHUB_SHA:latest ."
}