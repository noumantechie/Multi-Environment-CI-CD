# Manual or scripted release process
VERSION=$1

# Update Chart.yaml
yq eval ".version = \"$VERSION\"" -i helm/Chart.yaml
yq eval ".appVersion = \"$VERSION\"" -i helm/Chart.yaml

# Commit the change
git add helm/Chart.yaml
git commit -m "chore: bump chart version to $VERSION"

# Tag the commit
git tag "$VERSION"

# Push both commit and tag
git push origin main "$VERSION"
