## For maintainers

### Build and publish package

1. Change `version` argument in `setup.py:setup`
2. Git tag and push it to Github repository. (e.g. `git tag 0.1.0 && git push origin 0.1.0`)
3. mojimoji is automatically built and published to pypi by github actions

See .github/workflows/*yml for the configuration of CI.
