export EDITOR='nvim'

# let's teach less some colors
export LESS='-FRXi'
# and uncompress files
export LESSOPEN="|$(which lesspipe.sh) %s" LESS_ADVANCED_PREPROCESSOR=1

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
