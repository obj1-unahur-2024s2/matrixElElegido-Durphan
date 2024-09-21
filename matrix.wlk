object neo {
  var energia = 100
  
  method saltar() {
    energia -= energia / 2
  }
  
  method getVitalidad() = energia * 0.1
  
  method esElegido() = true
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false
  
  method saltar() {
    vitalidad = 1.max(vitalidad) - 1
    estaCansado = !estaCansado
  }
  
  method getVitalidad() = vitalidad
  
  method estaCansado() = estaCansado
  
  method esElegido() = false
}

object trinity {
  method saltar() {
    
  }
  
  method getVitalidad() = 0
  
  method esElegido() = false
}

object nave {
  const property tripulantes = [neo, morfeo, trinity]
  
  method cantidadDePasajeros() = tripulantes.size()
  
  method pasajeroConMasVitalidad() = tripulantes.max(
    { tripulante => tripulante.getVitalidad() }
  )
  
  method estaEqulibradaEnVitalidad() = self.pasajeroConMasVitalidad().getVitalidad() <= (self.pasajeroMenosVital().getVitalidad() * 2)
  
  method estaElElegido() = tripulantes.any(
    { tripulante => tripulante.esElegido() }
  )
  
  method pasajeroMenosVital() = tripulantes.min(
    { tripulante => tripulante.getVitalidad() }
  )
  
  method chocar() {
    tripulantes.forEach({ tripulante => tripulante.saltar() })
    tripulantes.clear()
  }
  
  method pasajerosSinElElegido() = tripulantes.filter(
    { tripulante => !tripulante.esElegido() }
  )
  
  method acelerar() {
    self.pasajerosSinElElegido().forEach({ tripulante => tripulante.saltar() })
  }
}