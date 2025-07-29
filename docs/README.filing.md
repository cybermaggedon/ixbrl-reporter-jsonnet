
# `ixbrl-reporter` for UK filing

Kindly contributed by @newbie in the Discord forums.

**1\. install ixbrl-reporter and jsonnet:**

py -m pip install ixbrl-reporter

if already installed, upgrade it:

py -m pip install -U ixbrl-reporter

install jsonnet from: <https://github.com/google/go-jsonnet/releases>

**2\. Prepare accounts and files:**

First ensure we have the correct company accounts structure, as it is in gnucash. The account structure was done December 2023 here: <https://github.com/cybermaggedon/ixbrl-reporter-jsonnet/tree/9daa5e1c467aad0d41d84cec72c466533f666942/real-world>

We need to have the directory “real-world” under the ixbrl-reporter-jsonnet root directory.

We also need to copy the gnucash file with the accounts to use in sqlite3 format (save as… from gnucash, then copy the file).

We also need to edit the metadata.jsonnet file in real-world to match our company’s data (also edit the relevant dates for the desired reports – the rest of the data may be same as previous year but dates will need to be updated).

**3\. Produce json file:**

Then, use the below command to create the json file:

**jsonnet -J . real-world/accts.jsonnet -o example-accts.json**

This needs to run from within the ixbrl-reporter-jsonnet directory (start terminal/powershell there).

In the resulting json file in line 3 replace:

_"kind": "gnucash"_

with:

_"kind": "piecash"_

_\[_**_Note_**_: this may not be needed in the latest version of the software as it makes it piecash by default\]_

_\[_**_Note_**_: previous instructions had the below command line:_

_jsonnet -J . real-world/accts.jsonnet > example-accts.json_

_This resulted in the wrong encoding for the resulting file, which then needed changing to UTF-8 (this could be done in notepad, save as...)\]_

**4\. Produce ixbrl file from the json file:**

**py -m ixbrl_reporter example-accts.json report ixbrl > report.xhtml**

**py -m ixbrl_reporter example-accts.json report ixbrl | Out-File -Encoding default report.xhtml**

_\[old command with incorrect encoding: py -m ixbrl_reporter example-accts.json report ixbrl > report.xhtml\]_

**5\. Same for corporation tax (json file and ixbrl file):**

**jsonnet -J . real-world/corptax.jsonnet -o example-ct.json**

**py -m ixbrl_reporter example-ct.json report ixbrl | Out-File -Encoding default report-ct.xhtml**

_\[old command with incorrect encoding: py -m ixbrl_reporter example-ct.json report ixbrl > report-ct.xhtml\]_

**6\. install github.com/cybermaggedon/ct600 package:**

Download zip file from github and install it from command line: pip3 install path/to/ct600-master.zip

Also download the zip file to modify the config files in it.

Run the program to process the report-ct.xhtml file:

py -m ct600 --computations path/to/report-ct.xhtml" --output-form-values > form-values.yaml

**7\. Edit the yaml file to match the intended filing of the CT600 form**

For fields that need to be ticked put 'true', for unticked, leave blank

Put dates in ISO format, for example: 2024-05-10

Optionally we can install and run the <https://github.com/cybermaggedon/ct600-fill> tool to convert the yaml file values to a printable CT600 PDF, which makes it easier to check for errors.

**8\. Edit the config.json file to match your details**

Company type should be 0 for a limited company

Username and password are the Companies House presenter credentials.

**9\. Test runs:**

**Test run**

Use --output-ct to generate the CT XML doc. It doesn't file anything but you know you have all the configuration set up right:

python -m ct600 --config config.json --accounts report.xhtml --computations report-ct.xhtml --form-values form-values.yaml --output-ct >output.xml

**Test-in-Live submission**

This tests the submission process with HMRC server. The same source files are used and a slightly modified config file (named config-TIL.json). The command is similar:

python -m ct600 --config config-TIL.json --accounts report.xhtml --computations report-ct.xhtml --form-values form-values.yaml --submit

CRITICALLY, the thing that makes it Test In Live is the 'class' in the config-TIL.json having '-TIL' at the end. Don't get it wrong or you'll do a real filing.

username/password are your Government Gateway ID credentials (without the spaces)

The weird thing about a Test In Live filing is that if it works, you get a filing error. The way you know if it succeeds is you get an email from HMRC which says: “The submission for reference xxxxx was received on xxxxxxx was successful and would have been processed if sent under non-test conditions”.

If that works, and you're happy with everything, changing HMRC-CT-CT600-TIL to HMRC-CT-CT600 or deleting the class line at the config.json file (as HMRC-CT-CT600 is the default one) causes a live filing.

