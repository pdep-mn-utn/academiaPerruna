module Library where
import PdePreludat

data Perro = Perro {
nombre:: String,
estamina:: Number,
juguete:: Juguete,
juego :: Perro -> Bool
}
type Juguete = (String, Bool)
rechina = snd

sultan = Perro {
nombre = "Sultán",
estamina = 25,
juguete = ("azul", False),
juego = rechina . juguete
}

-- perro que quiere jugar con quien tenga juguete que rechina
perro1 = Perro { 
    nombre = "Rex", 
    estamina = 30, 
    juguete = ("rojo", True), 
    juego = rechina . juguete }

-- perro que quiere jugar con quien tenga más de 20 de estamina
perro2 = Perro { nombre = "Lola", estamina = 40, juguete = ("verde", False), juego = (> 20) . estamina }


puedenJugarJuntos :: Perro -> Perro -> Bool
puedenJugarJuntos perro1 perro2 = juego perro1 perro2 && juego perro2 perro1

type Criterio = Perro -> Bool

volverseExigente :: Criterio -> Perro -> Perro
volverseExigente nuevoCriterio perro = perro { juego = \otroPerro -> juego perro otroPerro && nuevoCriterio otroPerro }