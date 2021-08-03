# SpaceVIm

## A Docker image SpaceVim with NeoVim

[![](http://dockeri.co/image/alastairhm/spacevim)](https://index.docker.io/u/alastairhm/spacevim/)


```bash
docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim
```

```bash
alias svim='docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim'
```

```bash
spv ()
{
  if [ $# -eq 1 ]
  then
    docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim workdir/$1
  else
    docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim
  fi
}
```
