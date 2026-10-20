#!/usr/bin/env bash
set -euo pipefail
: "${PROJECT_ID:?Set PROJECT_ID}" "${REGION:?Set REGION}" "${REPOSITORY:?Set REPOSITORY}" "${IMAGE_TAG:?Set IMAGE_TAG}"
REGISTRY="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}"
gcloud auth configure-docker "${REGION}-docker.pkg.dev" --quiet
# Run from repository root; review Dockerfiles and build contexts against actual source.
docker build -f docker/frontend.Dockerfile -t "$REGISTRY/frontend:$IMAGE_TAG" ./frontend
# Backend layout may vary: update contexts to actual helloService/profileService locations.
docker build -f docker/service.Dockerfile -t "$REGISTRY/hello:$IMAGE_TAG" ./backend/helloService
docker build -f docker/service.Dockerfile -t "$REGISTRY/profile:$IMAGE_TAG" ./backend/profileService
for image in frontend hello profile; do docker push "$REGISTRY/$image:$IMAGE_TAG"; done
