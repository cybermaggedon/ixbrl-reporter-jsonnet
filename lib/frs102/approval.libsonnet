{
    element(c, sig):: {
	"kind": "html",
	"root": {
            "tag": "div",
            "content": [
		{
                    "tag": "p",
                    "content": "expand:Approved by the board of directors " +
			"and authorised for publication on ~[authorised-date]."
		},
		{
                    "tag": "p",
                    "content": "expand:Signed on behalf of the board, by " +
			"~[signers-name]."
		},
		{
                    "tag": "img",
                    "attributes": {
			"src": sig,
			"alt": "Director's signature"
                    }
		}
            ]
	}
    }
}
