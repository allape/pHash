# shellcheck disable=SC2154
docker build --progress plain -t allape/phash:latest \
 --build-arg HTTP_PROXY="$http_proxy" \
 --build-arg GIT_PROXY="$git_proxy" \
 .
