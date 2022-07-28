{
    element(c):: {
	kind: "worksheet",
	with_id(id):: self + { id: id },
	with_worksheet(w):: self + { worksheet: w },
	with_title(t):: self + { title: t },
	with_elements(e):: self + { elements: e }
    }
}

