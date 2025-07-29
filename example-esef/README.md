# ESEF (European Single Electronic Format) Examples

This directory contains example configurations for generating **ESEF-compliant annual financial reports** for companies with securities admitted to trading on EU regulated markets. ESEF is the mandatory electronic reporting format required by ESMA (European Securities and Markets Authority).

## Files Overview

| File | Purpose |
|------|---------|
| `example-en.jsonnet` | **English language ESEF report** - Configuration for English-language annual financial reports |
| `example-fr.jsonnet` | **French language ESEF report** - Configuration for French-language annual financial reports |
| `metadata.jsonnet` | **Company metadata** - Contains European company information including LEI and domicile |
| `logo.jsonnet` | **Company logo** - Base64-encoded PNG image for report branding |

## About ESEF

**ESEF (European Single Electronic Format)** is the electronic reporting format required for annual financial reports of companies with securities admitted to trading on EU regulated markets. Key features:

- **Mandatory since 2021** for listed EU companies
- **XHTML format** with inline XBRL tagging
- **ESEF taxonomy** based on IFRS standards
- **Multi-language support** with standardized taxonomies
- **Regulatory compliance** across all EU member states

## Report Structure

Both language examples include:

### Core Financial Statements
- **Balance Sheet** (Statement of Financial Position)
- **Income Statement** (Statement of Comprehensive Income) 
- **Cash Flow Statement**
- **Statement of Changes in Equity**

### Notes and Disclosures
- **Notes to the Accounts** with proper ESEF tagging
- **Compliance statements** for regulatory requirements
- **Company information** and business activities
- **Accounting policies** and significant judgments

## Language Variants

### English Version (`example-en.jsonnet`)
- Uses ESEF English taxonomy labels
- Suitable for international reporting
- Standard English financial reporting terminology
- Compliance with UK/International presentation standards

### French Version (`example-fr.jsonnet`)
- Uses ESEF French taxonomy labels  
- Suitable for French domestic and EU reporting
- French financial reporting terminology
- Compliance with French accounting presentation standards

## Metadata Configuration

The `metadata.jsonnet` file includes ESEF-specific fields:

```jsonnet
{
    "business": {
        "company-name": "Exemple d'Entreprise SARL",
        "company-number": "0AAAAAAAAAAAAA0AAA40",          // LEI identifier
        "entity-scheme": "http://standards.iso.org/iso/17442", // LEI scheme
        "domicile-of-entity": "France",
        "legal-form-of-entity": "Société à responsabilité limitée",
        "country-of-incorporation": "France",
        "address-of-entitys-registered-office": "1281 Boulevard du leon, 75000 Paris",
        "principal-place-of-business": "PARIS, France",
        "nature-of-entitys-principal-activities": "Services de blockchain"
    }
}
```

## Key ESEF Features

### Regulatory Compliance
- **ESMA requirements** - Complies with ESEF Regulatory Technical Standards
- **IFRS taxonomy** - Uses official ESEF taxonomy for standardized tagging
- **Validation ready** - Compatible with ESMA validation tools
- **Machine readable** - Inline XBRL enables automated processing

### Technical Standards
- **XHTML format** - Human-readable with embedded XBRL tags
- **UTF-8 encoding** - Full Unicode support for international characters
- **CSS styling** - Professional presentation formatting
- **Hyperlink navigation** - Interactive document structure

### Multi-language Support
- **Localized labels** - Native language financial terms
- **Cultural formatting** - Date, number, and currency formats
- **Regulatory alignment** - Matches domestic accounting standards presentation

## Usage

### English ESEF Report
```bash
# Generate English ESEF configuration
jsonnet -J . example-esef/example-en.jsonnet > esef-en.json

# Generate ESEF XHTML report
ixbrl-reporter esef-en.json report ixbrl > annual-report-en.html
```

### French ESEF Report
```bash
# Generate French ESEF configuration  
jsonnet -J . example-esef/example-fr.jsonnet > esef-fr.json

# Generate ESEF XHTML report
ixbrl-reporter esef-fr.json report ixbrl > annual-report-fr.html
```

## Customization

To adapt these examples for your company:

1. **Update metadata.jsonnet** - Replace with your company's LEI, registered office, and business details
2. **Choose language variant** - Select appropriate language file (EN/FR) for your reporting requirements  
3. **Modify company information** - Update business activities, legal form, and domicile
4. **Replace logo.jsonnet** - Use your company's official logo
5. **Review compliance notes** - Ensure notes section matches your regulatory requirements

## Regulatory Notes

- **LEI Required** - Legal Entity Identifier mandatory for all ESEF filings
- **IFRS Compliance** - Reports must comply with applicable IFRS standards
- **Filing Deadlines** - Check local regulator requirements for submission timing
- **Validation** - Use ESMA validation tools before official submission
- **Archive Format** - Final submission typically requires specific ZIP packaging

These examples provide a solid foundation for ESEF-compliant annual financial reporting across EU jurisdictions.