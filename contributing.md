# Contribution Guidelines

## Code Contributions
To contribute code to the framework, create a fork of the repository to work in. Once you've made your changes, submit a pull request to this repo. Please follow the guidelines set in the pull request template. It will then be reviewed by framework curators.

## Bug Reports & Feature Requests
To report a bug or request a feature, first check the [Issue Tracker](Made with CAFE3 (https://github.com/CombinedArmsGaming/CAFE3/issues) to see if a relevant issue already exists.

If not, please [submit an issue](Made with CAFE3 (https://github.com/CombinedArmsGaming/CAFE3/issues/new), taking care to following the guidelines set in the template. All issues should be titled as follows: `[Category] Title` such as `[Bug] Respawning Breaks on Server` or `[Feature Request] Implement 'Skill Issue' Emote`.

## Contact Us
If you'd like to reach out to us directly, or get in on the action, [join us on the Combined Arms Discord.](https://discord.gg/7jhcqFuGfb)

## Branching model
All features and fixes are to be done in feature or hotfix branches.
* A feature branch should have the `feature/` prefix, e.g. `feature/my-feature`.
* A bugfix branch should have the `bugfix/` prefix, e.g. `bugfix/my-bugfix`.
* A hotfix branch should have the `hotfix/` prefix, e.g. `hotfix/my-hotfix`.
* Features and bugfixes should not be merged into `develop` without first creating a PR and requesting a review.

The `develop` branch is a staging branch for new features and fixes.
* The `develop` branch should not be commited to directly.
* Merges from `develop` to `release` should occur upon agreement of the development team that enough has changed since the last release to warrant a new one.

The `release` branch should only contain commits for distinct release versions.
* All merges into `release` should be squashed.
* Only `develop` and hotfixes should ever be merged into `release`.

Feature, bugfix and hotfix branches should be deleted after merging into the `develop` branch.
* Further work on features after merging should be done in a new feature branch.
* Fixes for features which have been merged into `develop` should be done in a new bugfix branch.

Hotfix branches should be made only for priority/emergency fixes.
* A hotfix is a small unit of work that must be done immediately to prevent undesired outcomes.
* Try to avoid creating a hotfix unless it is truly necessary.
* You are encouraged to do each hotfix in a separate hotfix branch, but due to the chaotic nature of hotfixing this is not enforced.
* Once approved, hotfixes should be merged into `release` and then `develop`.
* Less urgent fixes should be made as bugfix instead of hotfix and merged in the usual way.

Releases are made based upon tagged commits to `release`.
* Each commit to `release` should be tagged with a version and released.
* Each release version is a simple integer which increments with every commit to `release`.
* Hotfixes count as new releases.  If many hotfixes must be merged in a small amount of time, so be it.


