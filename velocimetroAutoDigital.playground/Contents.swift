//: Velocímetro de un aotomóvil digital

import UIKit

// enumeración Velocidades, de tipo Int

enum Velocidades : Int {
    case Apagado = 0, VelocidadBaja = 20, VelocidadMedia = 50, VelocidadAlta = 120
    
    init( velocidadInicial : Velocidades ) {
        self = velocidadInicial
    }
}

class Auto {
    var velocidad : Velocidades
    
    init() {
        velocidad = Velocidades.init(velocidadInicial : Velocidades.Apagado)
    }
    
    /*
        La función cambioDeVelocidad regresa la tupla correspondiente al valor entero de la
        velocidad actual y su representación en cadena.  Tomando en cuenta que el estado inicial
        del carro es Apagado y que de acuerdo a la salida ejemplo en las instrucciones de la tarea
        la iteración comienza precisamente con el estado Apagado, esta función obtiene primero los
        valores actuales (rawValue del enumerado y su valor en cadena) y después hace el cambio de
        valor en el enumerado.
    
        (LFGC, 15 de octubre de 2015)
    */
    func cambioDeVelocidad() -> ( actual : Int, velocidadEnCadena : String ){
        var actual : Int
        var velocidadEnCadena : String
        
        actual = velocidad.rawValue
        
        switch velocidad {
        case .Apagado:
            velocidad = Velocidades.VelocidadBaja
            velocidadEnCadena = "Apagado"
        case .VelocidadBaja:
            velocidad = Velocidades.VelocidadMedia
            velocidadEnCadena = "Velocidad Baja"
        case .VelocidadMedia:
            velocidad = Velocidades.VelocidadAlta
            velocidadEnCadena = "Velocidad Media"
        case .VelocidadAlta:
            velocidad = Velocidades.Apagado
            velocidadEnCadena = "Velocidad Alta"
        }
        
        return (actual, velocidadEnCadena)
    }
    
    /*
        La función cambioDeVelocidad2 regresa la tupla correspondiente al valor entero de la
        velocidad actual y su representación en cadena.  Tomando en cuenta que el estado inicial
        del carro es Apagado y que de acuerdo a la salida ejemplo en las instrucciones de la tarea
        la iteración comienza precisamente con el estado Apagado, esta función obtiene primero los
        valores actuales (rawValue del enumerado y su valor en cadena) y después hace el cambio de
        valor en el enumerado.
    
        Esta función, además, cumple con lo especificado en las instrucciones de que si el velocímetro
        llega a VelocidadAlta, entonces cambia a Velocidad Media.  De esta forma, el listado que
        arroja la iteración nunca vuelve al punto de apagado, tal y como muestra el ejemplo de las
        instrucciones, pero cumple con la especificación dada en cuanto al cambio de velocidades.
    
        (LFGC, 15 de octubre de 2015)
    */
    func cambioDeVelocidad2() -> ( actual : Int, velocidadEnCadena : String ){
        var actual : Int
        var velocidadEnCadena : String
        
        actual = velocidad.rawValue
        
        switch velocidad {
        case .Apagado:
            velocidad = Velocidades.VelocidadBaja
            velocidadEnCadena = "Apagado"
        case .VelocidadBaja:
            velocidad = Velocidades.VelocidadMedia
            velocidadEnCadena = "Velocidad Baja"
        case .VelocidadMedia:
            velocidad = Velocidades.VelocidadAlta
            velocidadEnCadena = "Velocidad Media"
        case .VelocidadAlta:
            velocidad = Velocidades.VelocidadMedia
            velocidadEnCadena = "Velocidad Alta"
        }
        
        return (actual, velocidadEnCadena)
    }

}

// Pruebas
var miAuto = Auto() // Declaración del objeto tipo Auto


// Ciclo para probar la función cambioDeVelocidad (listado tal como en el ejemplo)
print("Prueba de cambioDeVelocidad")
for var n = 1; n <= 20; n++ {
    var tupla = miAuto.cambioDeVelocidad()
    print("\(n).\t\(tupla.actual), \(tupla.velocidadEnCadena)")
}

// Regreso miAuto al estado Apagado
miAuto.velocidad = Velocidades.Apagado

print("\n\nPrueba de cambioDeVelocidad2")
// Ciclo para probar la función cambioDeVelocidad (de VelocidadAlta pasa a VelocidadMedia)
for var n = 1; n <= 20; n++ {
    var tupla = miAuto.cambioDeVelocidad2()
    print("\(n).\t\(tupla.actual), \(tupla.velocidadEnCadena)")
}