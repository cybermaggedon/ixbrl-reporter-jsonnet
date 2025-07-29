[
    {
        "id": "rnd-proj1-enhanced-staffing",
        "description": "Staffing (@ 130%)",
        "kind": "round",
        "direction": "down",
        "period": "in-year",
        "segments": [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "ct-detailed-analysis": "item1" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ],
        "input": {
            "kind": "line",
            "period": "in-year",
            "accounts": [
                "R&D Enhanced Expenditure:Expenditure:Project Iguana:Staffing Costs"
            ]
        }
    },
    {
        "id": "rnd-proj1-enhanced-external",
        "description": "External workers (@ 130%)",
        "kind": "round",
        "period": "in-year",
        "direction": "down",
        "segments":  [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "ct-detailed-analysis": "item1" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ],
        "input": {
            "kind": "line",
            "period": "in-year",
            "accounts": [
                "R&D Enhanced Expenditure:Expenditure:Project Iguana:External Workers"
            ]
        }
    },
    {
        "id": "rnd-proj1-enhanced-software",
        "description": "Software/Consumables (@ 130%)",
        "kind": "round",
        "period": "in-year",
        "direction": "down",
        "segments": [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "ct-detailed-analysis": "item1" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ],
        "input": {
            "kind": "line",
            "period": "in-year",
            "accounts": [
                "R&D Enhanced Expenditure:Expenditure:Project Iguana:Software/Consumables"
            ]
        }
    },
    {
        "id": "rnd-proj1-enhanced-expenditure",
        "kind": "group",
        "description": "Project Iguana",
        "period": "in-year",
        "segments": [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "ct-detailed-analysis": "item1" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ],
        "inputs": [
            "rnd-proj1-enhanced-staffing",
            "rnd-proj1-enhanced-software",
            "rnd-proj1-enhanced-external"
        ]
    },
    {
        "id": "rnd-enhanced-expenditure",
        "kind": "group",
        "description": "SME R&D tax relief (130%)",
        "period": "in-year",
        "segments": [
            { "business-name": "metadata.business.company-name" },
            { "business-type": "trade" },
            { "loss-reform": "post-loss-reform" },
            { "territory": "uk" }
        ],
        "inputs": [
            "rnd-proj1-enhanced-expenditure"
        ]
    }
]
