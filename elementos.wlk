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

