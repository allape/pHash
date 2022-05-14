# shellcheck disable=SC2154
git config --global http.proxy "$git_proxy"
git config --global https.proxy "$git_proxy"
git clone --depth 1 "https://github.com/allape/pHash.git"
git config --global --unset http.proxy
git config --global --unset https.proxy
