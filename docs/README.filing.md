
# `ixbrl-reporter` for UK filing

Kindly contributed by @newbie in the Discord forum.

Good luck and please suggest edits to this doc.

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

In the resulting json file in line 3 replace: 

```
"kind": "gnucash" 
```

with: 

```
"kind": "piecash"
```

Note: this may not be needed in the latest version of the software as it makes it piecash by default

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
3. All dates (`"made-up-date"`, `"date-signed"`, and `"date"`), need to be today's date
4. Package reference is `4047`

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

### 4.5 Edit the config.json file to match your details

- Company type should be `0` for a limited company
- Username and password are the Companies House presenter credentials

### 4.6 Test runs

Use `--output-ct` to generate the CT XML doc. It doesn't file anything but you know you have all the configuration set up right:

```
python -m ct600 --config config.json --accounts report.xhtml --computations report-ct.xhtml --form-values form-values.yaml --output-ct > output.xml
```

### 4.7 Test-in-Live submission

This tests the submission process with HMRC server. The same source files are used and a slightly modified config file (named `config-TIL-tvps.json`). The command is similar:

```
python -m ct600 --config config-TIL-tvps.json --accounts report.xhtml --computations report-ct.xhtml --form-values form-values.yaml --submit
```

**CRITICALLY:** The thing that makes it Test In Live is the `class` in the `config-TIL.json` having `-TIL` at the end. Don't get it wrong or you'll do a real filing.

- Username/password are your Government Gateway ID credentials (without the spaces)

The weird thing about a Test In Live filing is that if it works, you get a filing error reporting bad credentials. The way you know if it succeeds is you get an email from HMRC which says: "The submission for reference xxxxx was received on xxxxxxx was successful and would have been processed if sent under non-test conditions".

### 4.8 Live submission

If tests work and we are happy with everything, we can submit a live filing by changing `HMRC-CT-CT600-TIL` to `HMRC-CT-CT600` or deleting the class line at the `config.json` file (as `HMRC-CT-CT600` is the default one). Alternatively we can have a separate config file for live, named `config-live.json` and run that:

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
