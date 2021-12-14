#!/usr/bin/env bash

# NOTE: This is not the preferred way to update the subtree (see the README).
# However, if the subtrees get destroyed (e.g. by squashing) this can be used to destroy and re-create the subtree.

#git references.
upstream_version=main
local_version=update_subtree_branch

git remote add -f upstream https://github.com/giantswarm/starboard-upstream.git

set -xe

update_subtree (){
    remote_dir=$1
    local_dir=$2


    git fetch upstream $upstream_version  # fetch the most recent state from "upstream copy/main"
    git checkout upstream/$upstream_version  # it's OK to be in detached head, we won't change anything
    git subtree split -P $remote_dir -b temp-split-branch
    git checkout $local_version

    git subtree add --squash -P $local_dir temp-split-branch 
    git push --set-upstream origin $local_version
    git branch -D temp-split-branch


}


git checkout remotes/origin/master
git checkout -B $local_version

git rm -r helm/starboard-app/charts/starboard-operator
git commit -m "Cleanup old subtree"

# "deploy/helm" helm/starboard-app/charts/starboard-operator/crds 
update_subtree deploy/helm helm/starboard-app/charts/starboard-operator

# deploy/crds -> helm/starboard-app/charts/starboard-operator/
update_subtree deploy/crd helm/starboard-app/charts/starboard-operator/crds
