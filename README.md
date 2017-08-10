# sessionm-ewc-page-generator
[![Built with Spacemacs](https://cdn.rawgit.com/syl20bnr/spacemacs/442d025779da2f62fc86c2082703697714db6514/assets/spacemacs-badge.svg)](http://spacemacs.org)
[![Build Status](https://travis-ci.org/sessionm/sessionm-ewc-page-generator.svg?branch=master)](https://travis-ci.org/sessionm/sessionm-ewc-page-generator)

This is a Ruby script to help you generate a base LoyaltyJS experience.

# Requirements

- Ruby 2.4.1

# Usage

```shell
$ ./bin/generate -h
```

# Options

```
    -a, --apiKey API_KEY             API Key

    -b, --baseUrl BASE_URL           Base URL

    -t, --anonToken ANON_TOKEN       Anonymous User Token

    -l, --loginUrl LOGIN_URL         Login URL

    -i, --clientId CLIENT_ID         Client ID

    -c, --callbackUrl CALLBACK_URL   Callback URL
```
# Output

Goes into the `./build` directory. You can then host it anywhere you want!

It will make the directory if it is missing, so feel free to blow it away for any reason.
