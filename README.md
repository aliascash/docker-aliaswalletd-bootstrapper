# Alias Bootstrapper

Helper image to bootstrap blockchain data into Docker volume for usage with [Alias Docker image](https://github.com/aliascash/docker-aliaswalletd)

## Licensing

- SPDX-FileCopyrightText: © 2021 Alias Developers
- SPDX-License-Identifier: MIT

# How to use

Create Docker volume to store the data on for further usage. After that start the bootstrap process:
```
docker volume create alias-data
docker run \
    --name bootstrapper \
    --rm \
    -it \
    -v alias-data:/alias \
    aliascash/docker-aliaswalletd-bootstrapper:latest
```

After that the extracted Alias blockchain will be located on the Docker volume `alias-data`.

## Bootstrapping for TESTNET

To bootstrap for TESTNET, just add the following parameter to the above described call:

```
    -e TESTNET=true \
```

# Social
- Visit our website [Alias](https://alias.cash/) (ALIAS)
- Please join us on our [Discord](https://discord.gg/ckkrb8m) server
- Read the latest [News](https://alias.cash/news/)
- Visit our thread at [BitcoinTalk](https://bitcointalk.org/index.php?topic=2103301.0)

