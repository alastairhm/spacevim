# SpaceVIm

## A Docker image SpaceVim with NeoVim

### About

[SpaceVim](https://spacevim.org/) running on [NeoVim](http://neovim.io/) inside an [Ubuntu](https://ubuntu.com/) Docker image.

[![Docker Hub](https://index.docker.io/u/alastairhm/spacevim/)
[Gitlab Package](https://github.com/users/alastairhm/packages/container/package/spacevim)


### Build Status

[![Deploy Docker](https://github.com/alastairhm/spacevim/actions/workflows/deploy.yml/badge.svg)](https://github.com/alastairhm/spacevim/actions/workflows/deploy.yml)

[![Docker Image CI](https://github.com/alastairhm/spacevim/actions/workflows/docker-image.yml/badge.svg)](https://github.com/alastairhm/spacevim/actions/workflows/docker-image.yml)

### Instructions

Run to edit current directory

```bash
docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim
```

Setup as an Alias

```bash
alias spv='docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim'
```

Functions to either edit the directory or just one file.   

Bash Function
```bash
spv ()
{
  if [ $# -eq 1 ]
  then
    docker run --rm -ti -v $(pwd):/home/spacevim/workdir ghcr.io/alastairhm/spacevim:latest workdir/$1
  else
    docker run --rm -ti -v $(pwd):/home/spacevim/workdir ghcr.io/alastairhm/spacevim:latest
  fi
}
```

Fish Function
```fish
function spv
    if test (count $argv) -gt 0
        echo "File $argv[1]"
        docker run --rm -ti -v (pwd):/home/spacevim/workdir ghcr.io/alastairhm/spacevim:latest $argv[1]
    else
        docker run --rm -ti -v (pwd):/home/spacevim/workdir ghcr.io/alastairhm/spacevim:latest
    end
end
```
