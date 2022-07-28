{
    element(c):: {
	kind: "page",
	with_id(id):: self + { id: id },
	with_elements(e):: self + { elements: e }
    }
}



