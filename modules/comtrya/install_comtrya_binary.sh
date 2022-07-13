#!/usr/bin/env sh
## Kindly inspired by Arkade by Alex Ellis
## https://github.com/alexellis/arkade

export VERIFY_CHECKSUM=0
export ALIAS_NAME="comtrya"
export OWNER=comtrya
export REPO=comtrya
export SUCCESS_CMD="$REPO --help"
export BINLOCATION="/usr/local/bin"

mkdir -p ~/.local/bin
version=$(curl -sI https://github.com/$OWNER/$REPO/releases/latest | grep -i "location:" | awk -F"/" '{ printf "%s", $NF }' | tr -d '\r')
if [ ! $version ]; then
    echo "Failed while attempting to install $REPO. Please manually install:"
    echo ""
    echo "1. Open your web browser and go to https://github.com/$OWNER/$REPO/releases"
    echo "2. Download the latest release for your platform. Call it '$REPO'."
    echo "3. chmod +x ./$REPO"
    echo "4. mv ./$REPO $BINLOCATION"
    if [ -n "$ALIAS_NAME" ]; then
        echo "5. ln -sf $BINLOCATION/$REPO /usr/local/bin/$ALIAS_NAME"
    fi
    exit 1
fi

hasCli() {

    hasCurl=$(which curl)
    if [ "$?" = "1" ]; then
        echo "You need curl to use this script."
        exit 1
    fi
}

checkHash(){

    sha_cmd="sha256sum"

    if [ ! -x "$(command -v $sha_cmd)" ]; then
    sha_cmd="shasum -a 256"
    fi

    if [ -x "$(command -v $sha_cmd)" ]; then

    targetFileDir=${targetFile%/*}

    (cd "$targetFileDir" && curl -sSL $url.sha256|$sha_cmd -c >/dev/null)

        if [ "$?" != "0" ]; then
            rm "$targetFile"
            echo "Binary checksum didn't match. Exiting"
            exit 1
        fi
    fi
}

getPackage() {
    uname=$(uname -s)
    userid=$(id -u)

    suffix=""

    case $uname in

    "MINGW"*)
        suffix="x86_64-pc-windows-msvc.exe"
        BINLOCATION="$HOME/bin"
        mkdir -p $BINLOCATION
        ;;

    "Darwin")
        arch=$(uname -m)
        echo $arch
        case $arch in
        *)
        # We rely on Rosetta atm
        suffix="-x86_64-apple-darwin"
        ;;
        esac
    ;;

    "Linux")
        arch=$(uname -m)
        echo $arch
        case $arch in
        "x86_64")
        suffix="-x86_64-unknown-linux-gnu"
        ;;

        "aarch64")
        suffix="-aarch64-unknown-linux-gnu"
        ;;
        esac
    ;;
    esac

    targetFile="/tmp/$REPO$suffix"

    if [ "$userid" != "0" ]; then
        targetFile="$(pwd)/$REPO$suffix"
    fi

    if [ -e "$targetFile" ]; then
        rm "$targetFile"
    fi

    url=https://github.com/$OWNER/$REPO/releases/download/$version/$REPO$suffix
    echo "Downloading package $url as $targetFile"

    curl -sSL $url --output "$targetFile"

    if [ "$?" = "0" ]; then

        if [ "$VERIFY_CHECKSUM" = "1" ]; then
            checkHash
        fi

    chmod +x "$targetFile"

    echo "Download complete."
    cp $REPO$suffix ~/.local/bin/$REPO

    rm $targetFile
    fi
}

hasCli
getPackage
