class Planta {
	const property anioObtencionSemilla
	const property altura
	
	method horasDeToleranciaAlSol() 
	method esFuerte() = self.horasDeToleranciaAlSol() > 10
	method daNuevasSemillas() = self.esFuerte()
	method espacioQueOcupa()
	method esParcelaIdeal(parcela)
	method seAsociaBien(parcela) = parcela.seAsociaBien(self)
}

class Menta inherits Planta {
	override method horasDeToleranciaAlSol() = 6
	override method daNuevasSemillas() = super() or altura > 0.4
	override method espacioQueOcupa() = altura * 3
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6
}

class Hierbabuena inherits Menta {
	override method espacioQueOcupa() = super() * 2
}

class Soja inherits Planta {
	override method horasDeToleranciaAlSol() {
		var tolerancia = 6
		
		if(altura <= 1 and altura >= 0.5) {
			tolerancia = 7
		} 
		if(altura > 1) {
			tolerancia = 9
		}
		
		return tolerancia
	}
	
	override method daNuevasSemillas() = super() or (anioObtencionSemilla > 2007 and altura > 1)
	override method espacioQueOcupa() = altura / 2
	override method esParcelaIdeal(parcela) = parcela.horasDeSol() == self.horasDeToleranciaAlSol()
} 

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esParcelaIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1
}

class Quinoa inherits Planta {
	var property horasDeToleranciaAlSol
	override method daNuevasSemillas() = super() or anioObtencionSemilla < 2005
	override method espacioQueOcupa() = 0.5
	override method esParcelaIdeal(parcela) = parcela.plantas().all({ p => p.altura() <= 1.5 })
}

