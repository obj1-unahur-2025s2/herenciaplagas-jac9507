//---------------- Elementos -----------------
// Hogar
class Hogar{
  var mugre
  const confort

  method mugre(){
    return mugre
  }
  method esBueno(){
    return mugre <= confort * 0.5
  }
  method recibirAtaque(unaPlaga) {
    mugre = mugre + unaPlaga.nivelDeDanio()
  }
}

// Huerta
class Huerta{
  var produccion

  method produccion() {
    return produccion    
  }
  method esBueno() {
    return produccion > nivelMinimoDeProduccion.valor()
  }
  method recibirAtaque(unaPlaga) {
    produccion = (produccion - unaPlaga.nivelDeDanio() * 0.1 - if(unaPlaga.transmiteEnfermedades()) 10 else 0).max(0)
  }
}

object nivelMinimoDeProduccion {
  var property valor = 10
}

// Mascota
class Mascota{
  var salud

  method salud() {
    return salud
  }
  method esBueno() {
    return salud > 250
  }
  method recibirAtaque(unaPlaga) {
    if(unaPlaga.transmiteEnfermedades()) {
      salud = (salud-unaPlaga.nivelDeDanio()).max(0)
    }
  }
}

// Barrio
class Barrio {
  const property elementos = []

  method agregar(unElemento) {
    elementos.add(unElemento)
  }
  method quitar(unElemento) {
    elementos.remove(unElemento)
  }
  method cantElementosBuenos() { 
    return elementos.count{e => e.esBueno()}
  }
  method cantElementosNoBuenos() {
    return elementos.size() - self.cantElementosBuenos()
  }
  method esCopado() {
    return self.cantElementosBuenos() > self.cantElementosNoBuenos()
  }
}

//---------------- Plagas -----------------
class Plaga{
  var poblacion

  method poblacion() {
    return poblacion    
  }
  method transmiteEnfermedades() {
    return poblacion >= 10    
  }
  method atacarA(unElemento) {
    return unElemento.recibirAtaque(self)
    self.efectosDeAtacar()
  }
  method efectosDeAtacar() {
    poblacion *= 2
  }
}

class Cucarachas inherits Plaga {
    var pesoPromedioBicho
    method nivelDeDanio() = poblacion * 0.5
    override method transmiteEnfermedades() {
        return super() && pesoPromedioBicho >= 10
    }
    override method efectosDeAtacar() {
        super()
        pesoPromedioBicho += 2
    }
}

class Mosquitos inherits Plaga {
    method nivelDeDanio() = poblacion
    override method transmiteEnfermedades() {
        return super() && poblacion % 3 == 0
    }
}

class Pulgas inherits Plaga {
    method nivelDeDanio() = poblacion * 2
}

class Garrapatas inherits Pulgas {  
    override method efectosDeAtacar() {
        poblacion *= 1.2
    }
}
