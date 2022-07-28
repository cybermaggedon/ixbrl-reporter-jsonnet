{
    element(c):: {
	kind: "html",
	with_id(id):: self + { id: id },
	with_elements(e):: self + { elements: e },
	with_root(r):: self + { root: r }
    }
}



