#!/bin/bash

set -x

# Set the repository URL
REPO_URL="https://github.com/TimAGX/ReactCICD.git"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: recipeacr/timagxreactcicd:$1|g" k8s/manifest/deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

git config --global user.email "ayomidetimothy28@gmail.com"
git config --global user.name "TimAGX"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo