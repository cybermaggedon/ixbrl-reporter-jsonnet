
# `ixbrl-reporter-jsonnet`

## Summary

This code is intended for use with `ixbrl-reporter`.

Using `ixbrl-reporter` requires a complex configuration file, or set of
configuration files.  An internal import/reference mechanism was introduced
to allow the configuration files to be modulariesd, but the mechanism is
still not ideal.

This repo implements JSONNET templates for construction of configuration
files for `ixbrl-reporter` which makes the matter more manageable.

Jsonnet (see jsonnet.org) is a programming language (invented by Google)
which extends JSON with programming constructs.  Jsonnet is specifically
designed to make it easy to build configuration files; it supports object
templating and extension.

## Discuss

There's a #ixbrl-reporter-jsonnet channel on our Discord server if you want
to discuss... https://discord.gg/3cAvPASS6p

## What's here?

These examples assume you have `jsonnet` and `ixbrl-reporter` installed.
You can install `ixbrl-reporter` using `pip3 install ixbrl-reporter`.
Use whatever comes with your OS to install `jsonnet`.

### UK micro-entity accounts for Companies House example

See the `example-accts` directory.

```
make -f Makefile.example-accts
```

Output in `example-accts.xhtml`.

### UK corporation tax example

See the `example-ct` directory.

```
make -f Makefile.example-ct
```

Output in `example-ct.xhtml`.

### ESEF

See the `example-esef` directory.

```
make -f Makefile.example-esef
```

This passes a taxonomy validation, I have no idea whether it would meet
regulatory compliance in various parts of Europe.

Output in `esef.xhtml` and `esef-fr.xhtml`.

## Warranty

This code comes with no warranty.  See the [LICENSE](LICENCE) file for
details.  It is possible that this code could be useful to you in meeting
regulatory reporting requirements for your business.  It is also possible
that the software could report misleading information which could land you
in a lot of trouble if used for regulatory compliance.  If you need
certainty, you should check with a qualified accountant.

## License

Copyright (c) Accounts Machine Limited, 2022
Licenced under the GPL version 3 licence, see the [LICENSE](LICENCE) file

