#!/bin/bash
# ===========================================================================
#
# SPDX-FileCopyrightText: © 2021 Alias Developers
# SPDX-License-Identifier: MIT
#
# Created: 2021-06-14 HLXEasy
#
# This script downloads and extracts the ALIAS bootstrap archive onto
# /alias/.aliaswallet/
#
# ===========================================================================
set +x

if [[ ${TESTNET} = true ]] ; then
    echo "Bootstrapping TESTNET"
    testnetFolder="/testnet"
    bootstrapArchive="BootstrapChainTestnet.zip"
else
    echo "Bootstrapping MAINNET"
    bootstrapArchive="BootstrapChain.zip"
fi

echo "Creating directories"
mkdir -p /alias/.aliaswallet${testnetFolder}
cd /alias/

if [[ -e ${bootstrapArchive} ]] ; then
    echo "Using existing ${bootstrapArchive}"
else
    echo "Downloading bootstrap archive"
    wget \
        --no-verbose \
        --show-progress \
        --progress=dot:giga \
        https://download.alias.cash/files/bootstrap/${bootstrapArchive}
fi

cd .aliaswallet${testnetFolder}

if [[ -e .aliaswallet${testnetFolder}/blk0001.dat ]] ; then
    echo "Cleanup existing blockchain data"
    rm -rf .aliaswallet${testnetFolder}/blk0001.dat
    rm -rf .aliaswallet${testnetFolder}/txleveldb
fi

echo "Extracting bootstrap archive..."
unzip /alias/${bootstrapArchive}

echo "All done"
