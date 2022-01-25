# SpaceVIm

## A Docker image SpaceVim with NeoVim

[![](http://dockeri.co/image/alastairhm/spacevim)](https://index.docker.io/u/alastairhm/spacevim/)

[![Deploy Docker](https://github.com/alastairhm/spacevim/actions/workflows/deploy.yml/badge.svg)](https://github.com/alastairhm/spacevim/actions/workflows/deploy.yml)

[![Docker Image CI](https://github.com/alastairhm/spacevim/actions/workflows/docker-image.yml/badge.svg)](https://github.com/alastairhm/spacevim/actions/workflows/docker-image.yml)


```bash
docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim
```

Alias
```bash
alias spv='docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim'
```

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
