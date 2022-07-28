{
    element(c):: {
	kind: "composite",
	with_id(id):: self + { id: id },
	with_elements(e):: self + { elements: e }
    }
}



