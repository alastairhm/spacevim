# SpaceVIm

## A Docker image SpaceVim with NeoVim

[![](http://dockeri.co/image/alastairhm/spacevim)](https://index.docker.io/u/alastairhm/spacevim/)


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
    docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim workdir/$1
  else
    docker run --rm -ti -v $(pwd):/home/spacevim/workdir alastairhm/spacevim
  fi
}
```

Fish Function
```fish
function spv
    if test (count $argv) -gt 0
        echo "File $argv[1]"
        docker run --rm -ti -v (pwd):/home/spacevim/workdir alastairhm/spacevim $argv[1]
    else
        docker run --rm -ti -v (pwd):/home/spacevim/workdir alastairhm/spacevim
    end
end
```
