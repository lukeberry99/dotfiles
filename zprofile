addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPath $HOME/.dev/scripts
addToPath $HOME/.dev/bin
addToPath /opt/homebrew/bin/go
addToPath $(go env GOPATH)/bin
