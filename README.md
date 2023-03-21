[![CircleCI](https://circleci.com/gh/giantswarm/Starboard-app-app.svg?style=shield)](https://circleci.com/gh/giantswarm/Starboard-app)

# Starboard App

## Following the [discontinuation of Starboard](https://github.com/aquasecurity/starboard/discussions/1173), this App has been deprecated in favor of [Trivy Operator](https://github.com/giantswarm/trivy-operator-app). Please update any active installations of `starboard-app` to the newer `trivy-operator-app`.

Giant Swarm offers an app for Aqua Security's [Starboard][starboard], which can be installed in workload clusters. It is part of our [managed security solution][managed-security], but can also be installed independently.

Starboard is an in-cluster component which runs vulnerability scans of running workloads using [Trivy][trivy-aqua], Kubernetes CIS benchmark reports using [kube-bench][kube-bench], and configuration audits using [Polaris][polaris]. The results of these scans are saved in the cluster in the form of Kubernetes custom resources named `VulnerabilityReport`, `CISKubeBenchReport`, and `ConfigAuditReport`, respectively. It can also be configured to run more intrusive vulnerability scans using [kube-hunter][kube-hunter].

Results of each scan type can be retrieved from the cluster, for example using `kubectl`:

```shell
$ kubectl get vulnerabilityreports
NAMESPACE   NAME    REPOSITORY   TAG   SCANNER   AGE
...
```

You can also export the data from these reports to Prometheus to use in alerts and Grafana dashboards using our [`starboard-exporter`][starboard-exporter].

This repository contains our packaging and Giant Swarm-specific configuration of the upstream charts.

## Installing

There are several ways to install this app onto a workload cluster.

- [Using our web interface][app-ui]
- By creating an [App resource][app-crd] in the management cluster as explained in [Getting started with App Platform][app-getting-started].

### Scanning Backend

To perform vulnerability scans and produce `VulnerabilityReport` CRs, Starboard needs a vulnerability scanner.

We recommend first installing our [Trivy app][trivy-app] in your cluster to serve as the vulnerability scanner for Starboard, or using another existing Trivy instance.

Alternatively, you can configure Starboard to use Standalone mode, which creates an instance of the Trivy scanner per-scan. This is very inefficient and can lead to throttling by the backing vulnerability database. To do so, set `trivy.mode` to `Standalone` in `values.yaml`.

In either case, please note that the Trivy version set by `trivy.imageRef` must be the same version as your Trivy backend (even if the actual image is not the same), as Starboard uses that value internally to determine the API format to use for Trivy.

## Maintenance

### Updating from Upstream

This repository contains two git subtrees tracking the [upstream charts][upstream-copy] for Starboard:

- the local `helm/starboard-app/charts/starboard-operator` path tracks the `deploy/helm` path upstream
- the local `helm/starboard-app/charts/starboard-operator/crds` path tracks the `deploy/crd` path upstream

To update the subtrees with new upstream changes:

```shell
# Add the remote if you haven't already
git remote add upstream https://github.com/giantswarm/starboard-upstream

git checkout upstream/main 
git subtree split -P deploy/helm -b temp-split-helm

# Next two steps only if you don't already have a branch for review
git checkout main
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

[app-config]: https://docs.giantswarm.io/app-platform/app-configuration/
[app-crd]: https://docs.giantswarm.io/ui-api/management-api/crd/apps.application.giantswarm.io/
[app-getting-started]: https://docs.giantswarm.io/app-platform/getting-started/
[app-ui]: https://docs.giantswarm.io/ui-api/web/app-platform/#installing-an-app
[kube-bench]: https://github.com/aquasecurity/kube-bench
[kube-hunter]: https://github.com/aquasecurity/kube-hunter
[managed-security]: https://docs.giantswarm.io/app-platform/apps/security/
[polaris]: https://github.com/FairwindsOps/polaris
[starboard]: https://github.com/aquasecurity/starboard
[starboard-exporter]: https://github.com/giantswarm/starboard-exporter
[trivy-app]: https://github.com/giantswarm/trivy-app/
[trivy-aqua]: https://github.com/aquasecurity/trivy
[upstream-copy]: https://github.com/giantswarm/starboard-upstream
