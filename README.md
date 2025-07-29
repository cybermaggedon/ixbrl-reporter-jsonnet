
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

There's a contributed filing guide [here](docs/README.filing.md).

## Discuss

There's a #ixbrl-reporter-jsonnet channel on our Discord server if you want
to discuss... https://discord.gg/3cAvPASS6p

## What's here?

These examples assume you have `jsonnet` and `ixbrl-reporter` installed.
You can install `ixbrl-reporter` using `pip3 install ixbrl-reporter`.
Use whatever comes with your OS to install `jsonnet`.

### UK micro-entity accounts for Companies House filing example

This is for an FRS-105 / Unaudited micro-entity annual accounts report.
This is appropriate for filing with UK Companies House as an annual report.
The micro-entity report is kinda bare, an abridged balance sheet.  Companies
are still 'supposed' to product a non-abridger report for members, which
this would not meet.

FRS-102/FRS-105 does not include a great deal of detail for profit/loss
detailed expenses.  Those details wouldn't appear in the accounts anyway, so
you don't have to worry about the tags if you change how profit/loss is
calculated for this report.

This template has been used for real filing.

See the `example-accts` directory.

```
make -f Makefile.example-accts
```

Output in `example-accts.xhtml`.

### UK corporation tax example

This is a UK HMRC corptax statement with iXBRL.  This results in a single
document containing corporation tax 'computations' plus a DPL (detailed
profit and loss) statement.  For a corptax filing, that report would be
included in a CT electronic filing.  The annual company accounts filing
doesn't have enough detail and tagging to support the profit/loss reporting
that HMRC want, hence the DPL taxonomy allows describing a profit/loss with
the detail needed.

Because DPL with detailed tagging is needed by HMRC, if you add extra
computations to this configuration, it is really necessary to think about
whether they should be tagged when they appear in reports.

There are two main ways of changing computations which thinking about
tagging:
- Breaking down a computation.  Say, you might turn a single
  computation into multiple parts, e.g. income becomes various income
  lines which all add up to the whole income value.  Each of those parts
  needs to have dimensions to explain how they add up to the whole.
  This can be done by adding DetailedItem tags.
- Adding a new computation for which no tag exists.  This requires
  adding a tag and making sure something is picked which fits with the
  taxonomy.

The corptax filing is nowhere near as well defined as a CH annual filing.
Specifications are:
- The CT600 form plus guidance.  This form is not used if you file
  electronically, but the guidance explains what some boxes mean.
- The CT service specification which describes the CT filing process
  the 'Govtalk' header and the XML structure which makes up a CT filing.
- The CT (computations) and DPL (detailed profit/loss) taxonomies which
  describe the iXBRL which this report produces.  'Computations' means
  working out how much corptax to pay, which means taking profits,
  apply adjustments and rebates and splitting across financial years.
  DPL means describing company profits calcuations by explaining
  income and expenses in detail.  This report products CT and DPL in the
  same report, but it may be possible to file them separately.
  HMRC docs says that CT/DPL filing is required, but also not mandatory
  implying you can make a CT filing without this report.  At the end of
  the day, a corptax filing is about by being accountable to the
  administrators and explaining your workings, so you don't get audited.
  Makes sense to do a good job of the filing since it can be totally
  automated.

This template has been used for real filing.

See the `example-ct` directory.

```
make -f Makefile.example-ct
```

Output in `example-ct.xhtml`.

### ESEF

This is probably not particularly realistic, but hopefully an interesting
starting point for anyone that wants to generate one of these.

For a real ESEF statement, it is typical to extend the standard ESEF
taxonomy with extra concepts specific to the report, extra
computations or dimensions.  This example does not do that.

This passes a taxonomy validation, I have no idea whether it would meet
regulatory compliance in various parts of Europe.

See the `example-esef` directory.

```
make -f Makefile.example-esef
```

Output in `esef.xhtml` and `esef-fr.xhtml`.

### Test suite / examples

See the `test` directory.

```
sh test/run_all
```

Output in `test/output`.

## Warranty

This code comes with no warranty.  See the [LICENSE](LICENCE) file for
details.  It is possible that this code could be useful to you in meeting
regulatory reporting requirements for your business.  It is also possible
that the software could report misleading information which could land you
in a lot of trouble if used for regulatory compliance.  If you need
certainty, you should check with a qualified accountant and/or qualified
financial accounting engineer.

## License

Copyright (c) Accounts Machine Limited, 2022
Licenced under the GPL version 3 licence, see the [LICENSE](LICENCE) file

