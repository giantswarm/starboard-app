[![CircleCI](https://circleci.com/gh/giantswarm/Starboard-app-app.svg?style=shield)](https://circleci.com/gh/giantswarm/Starboard-app)

# Starboard-app chart

Giant Swarm offers a [Starboard](https://github.com/aquasecurity/starboard) app which can be installed in workload clusters.
Here we define the starboard-app chart with its templates and default configuration.

**What is this app?**
**Why did we add it?**
**Who can use it?**

## Installing

There are 3 ways to install this app onto a workload cluster.

1. [Using our web interface](https://docs.giantswarm.io/ui-api/web/app-platform/#installing-an-app)
2. [Using our API](https://docs.giantswarm.io/api/#operation/createClusterAppV5)
3. Directly creating the [App custom resource](https://docs.giantswarm.io/ui-api/management-api/crd/apps.application.giantswarm.io/) on the management cluster.

See our [full reference page on how to configure applications](https://docs.giantswarm.io/app-platform/app-configuration/) for more details.

## Updating from Upstream

This repository contains two git subtrees tracking the [upstream charts](https://github.com/giantswarm/starboard-upstream) for Starboard:

- the local `helm/starboard-app/charts/starboard-operator` path tracks the `deploy/helm` path upstream
- the local `helm/starboard-app/charts/starboard-operator/crds` path tracks the `deploy/crd` path upstream

To update the subtrees with new upstream changes:

```
# Add the remote if you haven't already
git remote add upstream https://github.com/giantswarm/starboard-upstream

git checkout upstream/main 
git subtree split -P deploy/helm -b temp-split-helm

# Next two steps only if you don't already have a branch for review
git checkout master
git checkout -b update

# Update the subtree
git subtree merge --squash -P helm/starboard-app/charts/starboard-operator temp-split-helm

# Commit and push your changes

# VERY IMPORTANT: When merging a PR including a subtree, do not squash the commits!
# Squashing will destroy the tracking information for the subtree. If that happens, see scripts/subtree-update.sh.
```

## Credit

* https://aquasecurity.github.io/helm-charts/ 
* https://github.com/aquasecurity/starboard
