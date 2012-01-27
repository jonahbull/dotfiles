#portable
source $HOME/.bash/aliases
source $HOME/.bash/config
source $HOME/.bash/completions
source $HOME/.bash/functions

#OS-specific
os=$(uname)
case "${os}" in
    Darwin)
        source $HOME/.bash/osx
        ;;
    Linux)
        source $HOME/.bash/linux
        ;;
    *)
    ;;
esac