
# `ixbrl-reporter` for UK filing

Kindly contributed by @newbie in the Discord forum.

Good luck and please suggest edits to this doc.

## Warranty

This code and documentation comes with no warranty whatsoever.  See the
[LICENSE](../LICENSE) file for details.  The contributors to this document are
not accountants, and this is not accounting advice.

It is possible that this code could be useful to you in meeting regulatory
reporting requirements for your business.  It is also possible that the
software could report misleading information which could land you in a lot of
trouble.  Check everything, and if you don't know how to be compliant, ask a
professional.

## 1. install ixbrl-reporter and jsonnet

```
py -m pip install ixbrl-reporter
```

if already installed, upgrade it:

```
py -m pip install -U ixbrl-reporter
```

Install jsonnet from: https://github.com/google/go-jsonnet/releases or use your operating system installer to install it.

## 2. Prepare accounts and files:

First ensure we have the correct company accounts structure, as it is in gnucash. The account structure was done December 2023 here: https://github.com/cybermaggedon/ixbrl-reporter-jsonnet/tree/9daa5e1c467aad0d41d84cec72c466533f666942/real-world

We need to have the directory “real-world” under the ixbrl-reporter-jsonnet root directory.

We also need to copy the gnucash file with the accounts to use in sqlite3 format (save as… from gnucash, then copy the file).

We also need to edit the metadata.jsonnet and the metadata-ct.jsonnet files in real-world directory to match our company’s data (also edit the relevant dates for the desired reports – the rest of the data may be same as previous year but dates will need to be updated).

## 3. Companies House filing

### 3.1 Produce json file:

Use the below command to create the json file:

```
jsonnet -J . real-world/accts.jsonnet -o example-accts.json
```

This needs to run from within the `ixbrl-reporter-jsonnet` directory (start terminal/powershell there).


Note: previous instructions had the below command line

```
jsonnet -J . real-world/accts.jsonnet > example-accts.json
```

This resulted in the wrong encoding for the resulting file on Windows, which then needed changing to UTF-8 (this could be done in notepad, save as...)

### 3.2 Produce ixbrl file from the json file:

```
py -m ixbrl_reporter example-accts.json report ixbrl > report.xhtml
```

On Windows you need to use this to avoid creating UTF-16 text

```
py -m ixbrl_reporter example-accts.json report ixbrl | Out-File -Encoding default report.xhtml
```

### 3.3 Companies House accounts submission

The required code is here: https://github.com/cybermaggedon/companies-house-filing

1. Replace the `accts.html` file with the previously generated `report.xhtml` file (rename it `accts.html` and copy it in the `companies-house-filing-master` directory)
2. Edit the `config.json` file to match our details
3. Dates (`"date-signed"`, and `"date"`), need to be today's date; `"made-up-date"` set to the date your accounts were made up to.
4. Package reference is `4047`

- Company type should be `0` for a limited company
- Username and password are the Companies House presenter credentials

Once you put the details, there's a test call you can make:

```
python -m ch_filing -c config.json --get-company-data
```

This should output your company data. If that works, the authentication is working.

Then you can submit:

```
python -m ch_filing -c config.json --accounts accts.xhtml --submit
```

It gives you a filing ID in response, like:

```
Submission completed.
Submission ID is: S00003
```

Later you should check whether the filing completes:

```
python -m ch_filing -c config.json -G -i S00003
```

This should be done until we get a response like this:

```
S00003: ACCEPT
```

**Important:** A file called `state.json` gets created in the filing process, which you must not delete! It tracks transaction IDs and submission IDs, and these must be numbers which increment, and it's important to have the whole submission history. If you delete that file it starts from 1 again, which is bad. So it needs to be kept safe, and next submission to run from the same location.

## 4. Corporation tax filing

Similar to Companies House, first edit the `metadata-ct.json` file, then produce the json and ixbrl files:

### 4.1 Produce json file:

Use the below command to create the json file:

```
jsonnet -J . real-world/corptax.jsonnet -o example-ct.json
```

### 4.2 Produce ixbrl file from the json file

```
py -m ixbrl_reporter example-ct.json report ixbrl | Out-File -Encoding default report-ct.xhtml
```

**Note:** The software splits the accounting (calendar) year into two tax years, FY1 (until 31/3) and FY2 (from 1/4 to 31/12), as sometimes government changes corp tax rules and the new rules always start in a new FY starting 1st April. The software does that by pro-rating the profits to the two FY. If that's not correct, perhaps manual adjustment is needed.

### 4.3 Install github.com/cybermaggedon/ct600 package:

Download zip file from github and install it from command line:

```
pip3 install path/to/ct600-master.zip
```

Also download the zip file to modify the config files in it.

Run the program to process the `report-ct.xhtml` file:

```
py -m ct600 --computations path/to/report-ct.xhtml --output-form-values > form-values.yaml
```

### 4.4 Edit the yaml file to match the intended filing of the CT600 form

For fields that need to be ticked put `true`, for unticked, leave blank.

Put dates in ISO format, for example: `2024-05-10`

In 2023 return, these needed to be added manually:

- **Box 326:** enter 1, or whatever is the right number for you if you are
  shareholder for more than 1 company.
- **Box 329:** Set to True for a small company.
- **Box 618:** Set to True
- **Box 620:** input the total amount of (tax exempt) dividends received
- **Box 650:** delete the True (unless making a claim for R&D etc)
- **Boxes 920-935:** Bank account details
- **Box 960:** delete the lines below
- **Boxes 975-985:** enter my details

After editing, save with UTF-8 encoding:

1. At bottom of Visual Studio Code window click on the encoding which by default is UTF-16 LE
2. Then click "save with encoding"
3. Then select UTF-8

**Optional:** We can install and run the [ct600-fill tool](https://github.com/cybermaggedon/ct600-fill) to convert the yaml file values to a printable CT600 PDF, which makes it easier to check for errors:

Start terminal in `ct600-fill-master` directory and run:

```
python scripts\ct600-fill --input "C:\path\to\ixbrl-reporter-jsonnet-master\form-values.yaml" --output output.pdf
```
### 4.5 Edit the config-til.json file to match your details
`"username"` is Government Gateway user ID which looks like a 12 character identity
`"password"` is the password associated with the username

### 4.6 Test runs

Use `--output-ct` to generate the CT XML doc. It doesn't file anything but you know you have all the configuration set up right:

```
python -m ct600 --config config-til.json --accounts report.xhtml --computations report-ct.xhtml --form-values form-values.yaml --output-ct > output.xml
```

### 4.7 Test-in-Live submission

This tests the submission process with HMRC server. The same source files are used and a slightly modified config file (named `config-til.json`). The command is similar:

```
python -m ct600 --config config-til.json --accounts report.xhtml --computations report-ct.xhtml --form-values form-values.yaml --submit
```

**CRITICALLY:** The thing that makes it Test In Live is the `class` in the `config-til.json` having `-TIL` at the end. Don't get it wrong or you'll do a real filing.

- Username/password are your Government Gateway ID credentials (without the spaces)

The weird thing about a Test In Live filing is that if it works, you get a filing error reporting bad credentials. The way you know if it succeeds is you get an email from HMRC which says: "The submission for reference xxxxx was received on xxxxxxx was successful and would have been processed if sent under non-test conditions".

### 4.8 Live submission

If tests work and we are happy with everything, we can submit a live filing by changing `HMRC-CT-CT600-TIL` to `HMRC-CT-CT600` or deleting the class line at the `config-til.json` file (as `HMRC-CT-CT600` is the default one). Alternatively we can have a separate config file for live, named `config-live.json` and run that:

```
python -m ct600 --config config-live.json --accounts report.xhtml --computations report-ct.xhtml --form-values form-values.yaml --submit
``` 

```
IRmark is HASPODIWwD2ScIlaldcvBMo=
Correlation ID is 12301294
Poll...
- Message
FCF9BC
HMRC has received the HMRC-CT-CT600 document ref: 927 : DHAPM18 at 15.12 on 08/06/2024. The associated IRmark was WDTEBGK. We strongly recommend that you keep this receipt electronically, and we ad vise that you also keep your submission electronically for your records. They are evidence of the information that you submitted to HMRC.
- Message
Thank you for your submission
Submission was successful. Delete request...
Completed.
```

## 5. Corporation Tax rates and marginal relief (FY2023 onwards)

Since 1 April 2023 there are two Corporation Tax rates: the 19% small
profits rate (augmented profits up to £50,000) and the 25% main rate
(from £250,000), with marginal relief tapering the charge between the
two limits.  The limits are divided by one plus the number of
associated companies, and prorated by days/365 for accounting periods
shorter than 12 months.

### 5.1 Setting the tax rate

Recent library versions read the rate from the CT metadata; the same
value drives both the tax computation and the box 340/390 rate facts,
so they cannot disagree:

```jsonnet
"tax": {
    "fy1": {
        "name": "FY1",
        "year": "2025",
        "start": "2025-04-06",
        "end": "2026-03-31",
        "rate": 25
    },
    ...
}
```

### 5.2 Claiming marginal relief

Marginal relief is:

    MR = 3/200 x (U' - A) x N/A

where U' is the (prorated) upper limit, N the taxable total profits
(CT600 box 315) and A the augmented profits (N plus exempt
distributions received, CT600 box 620).

Worked example: 360-day accounting period, taxable profits £60,000,
no exempt distributions, no associated companies:

    U'  = 250,000 x 360/365            = 246,575.34
    MR  = 3/200 x (246,575.34 - 60,000) =   2,798.63
    tax = 60,000 x 25% - 2,798.63       =  12,201.37

The library's default marginal relief computation is zero.  To claim
relief, override it in your computations file with a constant:

```jsonnet
accts.library.computation(
    "marginal-rate-relief-for-ring-fence-trades-payable",
    "Marginal relief"
)
    .in_year()
    .segment("business-type", "company")
+ {
    kind: "constant",
    values: { "2026-03-31": 2798.63 },
},
```

Notes:

- The computation id must be exactly
  `marginal-rate-relief-for-ring-fence-trades-payable` -- it is the
  taxonomy tag key.  CT600 box 435 was relabelled from "Marginal
  relief for ring fence trades" to plain "Marginal relief" from April
  2023; the XML element and taxonomy concept keep the legacy name and
  now carry standard marginal relief.
- The value must be POSITIVE.  Tax liabilities are negative in the
  internal sign convention (the taxonomy reverses their display
  sign), so a positive relief summed into
  `corporation-tax-chargeable-payable` reduces the liability.  If
  your tax gets BIGGER, you have the sign backwards.
- A `constant` computation needs a `values` entry for every period
  the report evaluates.  A report with a previous-period comparative
  needs a key for that period end too (typically 0).
- The constant is year-specific: recompute it every filing.
- On the CT600 side: tick box 329 (chargeable at the small profits
  rate OR entitled to marginal relief), and note that ticking 329
  makes box 326 (number of associated companies) mandatory -- enter 0
  if there are none.

## 6. Non-trade income: bank interest and CT600 box 170

Bank interest is a non-trading loan relationship credit (CT600 box
170), not trade income, but it sits inside profit-per-accounts.  To
report it correctly, deduct it from the trade computation and add it
back as non-trade income:

```jsonnet
// Deduct from trading profit.  This concept lives in the trade
// hypercubes and needs the full trade dimensional signature (see
// section 7).
accts.library.line(
    "adjustments-non-trading-loan-relationship-credits-per-accounts",
    "Less: non-trading loan relationship credits (bank interest)"
)
    .in_year()
    .reverse_sign()
    .segment("business-name", "metadata.business.company-name")
    .segment("business-type", "trade")
    .segment("loss-reform", "post-loss-reform")
    .segment("territory", "uk"),

// Report as box 170 income.
accts.library.line(
    "profits-and-gains-from-non-trading-loan-relationships",
    "Non-trading loan relationship profits (bank interest)"
)
    .in_year()
    .segment("business-type", "company"),
```

with the mapping additions:

```jsonnet
line_inputs +: {
    "adjustments-non-trading-loan-relationship-credits-per-accounts": [
        "Income:Interest",
    ],
    "profits-and-gains-from-non-trading-loan-relationships": [
        "Income:Interest",
    ],
},
compound_inputs +: {
    "ct-trading-profits-raw": [
        // ...existing members...,
        "adjustments-non-trading-loan-relationship-credits-per-accounts",
    ],
    "profits-before-other-deductions-and-reliefs": [
        "ct-net-trading-profits",
        "profits-and-gains-from-non-trading-loan-relationships",
    ],
},
```

The FY1/FY2 rows of the CT600 (boxes 335/385) apportion box 315 --
the total profits chargeable -- so recent library versions point the
FY apportionment at `total-profits-chargeable-to-corporation-tax`.
If yours apportions `ct-net-trading-profits`, box 335 will not
reconcile to box 315 once box 170 income exists.

Fill box 170 in the form values by hand (`ct600
--output-form-values` does not seed it from older computations).

## 7. iXBRL dimensions on adjustment facts

The `ct-comp:Adjustments...PerAccounts` concepts are bound to the
trade hypercubes and are only dimensionally valid with the full trade
signature:

```jsonnet
.segment("business-name", "metadata.business.company-name")
.segment("business-type", "trade")
.segment("loss-reform", "post-loss-reform")
.segment("territory", "uk")
```

Tagging one with `business-type: company` instead produces an HMRC
rejection like:

    xbrldie:PrimaryItemDimensionallyInvalidError: The item
    '...AdjustmentsNon-tradingLoanRelationshipCreditsPerAccounts' is
    not dimensionally valid.  The hypercube '...UKTradeHypercube'
    requires dimension '...BusinessNameDimension' but it is not
    reported. [...]

The error lists each candidate hypercube's missing dimension; the fix
is the full signature above, not chasing the dimensions one at a
time.  Income-summary concepts (`NetTradingProfits`,
`ProfitsAndGainsFromNon-tradingLoanRelationships`, ...) take
`business-type: company`.  Note the business name is a TYPED
dimension member in the output XML (`xbrldi:typedMember`), which
explicit-member regex checks will miss.

## 8. Testing against HMRC before you file

Three lanes, in increasing realism:

1. **Local emulator** (`corptax-test-service`, in the ct600 package):
   full GovTalk submit/poll/delete protocol offline.  Create a
   `received/` directory in its working directory first -- it saves
   the decoded submission there.
2. **HMRC vendor test service (TPVS)**: the real ChRIS validation
   engine -- schema, business rules AND XBRL dimensional checks --
   against the test transaction engine at
   `https://test-transaction-engine.tax.service.gov.uk/submission`
   with `GatewayTest` set to `"1"`, the normal `HMRC-CT-CT600` class,
   and SDST-issued test credentials and test UTR.  The test UTR must
   go in BOTH form-values box 3 AND `metadata.tax.utr` (rule 1607
   cross-checks the CT600 against the attached computations).
   Validation failures come back as a generic GovTalk 3001 error
   wrapping a detailed `ErrorResponse` in the Body -- read the raw
   XML for the actual rule numbers.
3. **Test-In-Live** (section 4.7): the LIVE engine with the
   `HMRC-CT-CT600-TIL` class and your real Government Gateway
   credentials.  SDST test credentials here fail immediately with
   error 1046 and no correlation ID.  A successful TIL run either
   returns an inline receipt marked "THIS IS A TESTNOTE: NO
   SUBMISSION HAS BEEN MADE", or errors after a correlation ID was
   issued with the confirmation arriving by email -- both shapes
   occur.

## 9. HMRC validation errors seen in the wild (ChRIS)

| Error | Meaning | Fix |
|---|---|---|
| 9240: "If the associated companies section is present then either Box 326 or Boxes 327 and 328 must be completed" | Ticking box 329 creates the AssociatedCompanies XML section, making box 326 mandatory | Set box 326 to `0` (zero associated companies) |
| `'' is not a valid value for 'gYear'` (Computations) | A single-FY period emitted an empty FinancialYear2CoveredByTheReturn fact | Recent library versions omit FY2 facts when `metadata.tax.fy2.year` is empty |
| `xbrldie:PrimaryItemDimensionallyInvalidError` | An adjustment fact is missing trade hypercube dimensions | Full trade signature -- see section 7 |
| 3314: "Inconsistent duplicate fact values (ct-comp:TotalProfitsChargeableToCorporationTax)" | Box 315 fact carries pence while the FY1+FY2 total (same concept) is rounded | Recent library versions round the total down to whole pounds |
| 1607: "The UTR on the Computation must match the UTR on the CT600..." | Envelope/form UTR differs from the computations TaxReference fact (common when using the SDST test UTR in only one place) | Same UTR in form-values box 3 and `metadata.tax.utr`; same period end in both documents |
