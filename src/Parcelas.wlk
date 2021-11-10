class Parcela {
	const property largo
	const property ancho
	const property horasDeSol
	var property plantas = #{}
	
	method superficie() = largo * ancho
	method cantidadMaximaDePlantas() = if(ancho > largo) self.superficie() / 5 else self.superficie() / + largo
	method tieneComplicaciones() = plantas.any({ p => p.horasDeToleranciaAlSol() < horasDeSol })
	method seAsociaBien(planta)
	method porcentajeDePlantasBienAsociadas() = plantas.count({ p => self.seAsociaBien(p)}) * 100 / plantas.size()
	
	method plantar(planta) {
		if(self.cantidadMaximaDePlantas() == plantas.size()) {
			self.error("La parcela está al máximo de ocupación")
		}
		else if(horasDeSol - planta.horasDeToleranciaAlSol() >= 2){
			throw new Exception(message = "La planta tolera tanto sol")
		}
		else {
			plantas.add(planta)
		}
	}
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.esParcelaIdeal(self)
}


class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(planta) = plantas.size() <= 2 and planta.esFuerte()
}