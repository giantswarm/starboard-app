# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Added `seccomp` to the `PodSecurityPolicy` when `CISKubeBenchReports` are disabled.

## [0.8.0] - 2022-08-01

### Changed

- Build with `app-build-suite` instead of `architect`.
- Set more restrictive `securityContext`s to comply with `restricted` PSS standards.
- Apply a PriorityLevelConfig and FlowSchema for starboard's API requests.

## [0.7.1] - 2022-04-22

### Changed

- Move crds subtree out of upstream chart.
- Use crd-install pre-install job.
- Move specs subtree out of upstream chart.
- Use spec-install post-install job.

## [0.7.0] - 2022-04-12

### Changed

- Update to upstream version 0.10.3 with `starboard-operator` version 0.15.3.
- Add `specs` folder as a new subtree.

## [0.6.0] - 2022-03-23

### Changed

- Update to upstream version 0.9.1 with `starboard-operator` version 0.14.1.
- Move resource limit overrides to the App instead of modifying the upstream chart.
- Override Trivy version to use newer v0.24.0.

## [0.5.2] - 2022-02-08

### Added

- Increase `trivy` scan Job memory limits to 1G.

## [0.5.1] - 2022-01-28

### Fixed

- Match `appVersion` to the `starboard-operator` app version.

## [0.5.0] - 2022-01-25

### Changed

- Update to upstream version 0.14.0 (chart version 0.9.0).
- Automatically delete `VulnerabilityReports` after 7 days to trigger re-scan.
- Only scan the current revision of a ReplicaSet.

### Removed

- Remove unused `envSecret` values from `values.yaml`.

## [0.4.0] - 2021-12-10

### Changed

- Update to upstream version 0.8.1 with `starboard-operator` version 0.13.1.
- Use `trivy` version 0.21.0. App now requires Trivy 0.20.0 or above.

## [0.3.2] - 2021-11-10

### Changed

- Reduce Starboard operator batch sizes and increase wait durations.

## [0.3.1] - 2021-11-02

### Changed

- Push starboard-app to AWS, Azure, and VMWare collections.

## [0.3.0] - 2021-11-02

### Changed

- Use in-cluster Trivy by default.
- Scan all namespaces by default.
- Add PodSecurityPolicy.
- Add NetworkPolicy (for operator only).
- Add expanded PSP for enabling CIS benchmarks.

## [0.2.1] - 2021-10-18

### Changed

- Repeat metadata changes done in v0.2.0 in a different place

## [0.2.0] - 2021-10-15

### Changed

- Change dependency to use subtree
- Use giantswarm retagged images
- Add icon
- Add "aqua" to the chart description

## [0.1.1] - 2021-09-08

## [0.1.0] - 2021-09-08

[Unreleased]: https://github.com/giantswarm/starboard-app/compare/v0.8.0...HEAD
[0.8.0]: https://github.com/giantswarm/starboard-app/compare/v0.7.1...v0.8.0
[0.7.1]: https://github.com/giantswarm/starboard-app/compare/v0.7.0...v0.7.1
[0.7.0]: https://github.com/giantswarm/starboard-app/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/giantswarm/starboard-app/compare/v0.5.2...v0.6.0
[0.5.2]: https://github.com/giantswarm/starboard-app/compare/v0.5.1...v0.5.2
[0.5.1]: https://github.com/giantswarm/starboard-app/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/giantswarm/starboard-app/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/giantswarm/starboard-app/compare/v0.3.2...v0.4.0
[0.3.2]: https://github.com/giantswarm/starboard-app/compare/v0.3.1...v0.3.2
[0.3.1]: https://github.com/giantswarm/starboard-app/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/giantswarm/starboard-app/compare/v0.2.1...v0.3.0
[0.2.1]: https://github.com/giantswarm/starboard-app/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/giantswarm/starboard-app/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/giantswarm/starboard-app/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/starboard-app/releases/tag/v0.1.0
