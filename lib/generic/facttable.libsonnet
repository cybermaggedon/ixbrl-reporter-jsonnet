{
    element(c):: {
	kind: "facttable",
	with_id(id):: self + { id: id },
	with_facts(f):: self + { facts: f },
	with_title(t):: self + { title: t },
	with_elements(e):: self + { elements: e }
    }
}

