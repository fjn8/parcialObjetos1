object inta {
	var property parcelas = #{}
	
	method agregarParcela(parcela) { parcelas.add(parcela) }
	method promedioPlantasPorParcela() = parcelas.sum({ p => p.plantas().size()}) / parcelas.size()
	method parcelaMasAutosustentable() = parcelas.filter({ p => p.plantas().size() > 4}).max({ p => p.porcentajeDePlantasBienAsociadas()})
}
//obtener la parcela más autosustentable. Para esto, solo consideraremos aquellas parcelas con más de 4 plantas
//y elegiremos aquella que tenga mayor porcentaje de plantas "bien asociadas