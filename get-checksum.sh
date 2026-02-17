#!/bin/bash
# Usage: ./get-checksum.sh [version_or_url]
# If argument starts with http:// or https://, treat it as a URL (CI mode - quiet output)
# Otherwise treat it as a version string (interactive mode - verbose output)

INPUT=${1:-"2.5.0"}

if [[ "$INPUT" =~ ^https?:// ]]; then
    # CI mode: argument is a full URL
    URL="$INPUT"
    QUIET=true
else
    # Interactive mode: argument is a version
    VERSION="$INPUT"
    URL="https://github.com/clean-dev-dirs/clean-dev-dirs/archive/refs/tags/v${VERSION}.tar.gz"
    QUIET=false
fi

if [ "$QUIET" = false ]; then
    echo "Calculating SHA256 for version ${VERSION}..."
    echo "URL: ${URL}"
    echo ""
fi

# Download and calculate SHA256
SHA256=$(curl -sL "${URL}" | shasum -a 256 | awk '{print $1}')

if [ -z "$SHA256" ]; then
    echo "Error: Failed to calculate checksum. Please check:" >&2
    echo "1. The GitHub release exists" >&2
    echo "2. You have internet connection" >&2
    echo "3. The URL is correct" >&2
    exit 1
fi

if [ "$QUIET" = true ]; then
    # CI mode: output only the hash
    echo "${SHA256}"
else
    # Interactive mode: output formatted result
    echo "SHA256: ${SHA256}"
    echo ""
    echo "Update Formula/clean-dev-dirs.rb with:"
    echo "  url \"${URL}\""
    echo "  sha256 \"${SHA256}\""
    echo "  version \"${VERSION}\""
fi
