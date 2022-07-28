{

    element(c)::
    {

	logo:: null,
	signature:: null,

	"title-page":: import "title-page.libsonnet",
	"company-info":: import "company-info.libsonnet",
	"balance-sheet-unaudited-micro":: import "balance-sheet-unaudited-micro.libsonnet",
	"simple-notes":: import "simple-notes.libsonnet",


	with_id(id):: self + { id: id },
	with_logo(logo):: self + { logo: logo },
	with_signature(sig):: self + { signature: sig },

	kind: "composite",

	elements: [
	    self["title-page"].element(c).with_logo(self.logo),
	    self["company-info"].element(c),
	    self["balance-sheet-unaudited-micro"].element(c)
		.with_signature(self.signature),
	    self["simple-notes"].element(c)
	]

    }

}

