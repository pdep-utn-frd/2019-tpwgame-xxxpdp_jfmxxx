import wollok.game.*

object pacman{
	var property image = "pacman.png"
	var property position = game.origin()
	var vidas = 3
	
	method perderVida() {
		vidas-=1
		position = game.origin()	
	}
	method juegoTerminado() = vidas == 0

	method resetearPosition(){
		position = game.origin()
	}
	method chocarCon(rival){
		vidas-= 1
		game.say(self,"Perdiste una vida!")
		self.resetearPosition()
		rival.resetearPosition()
		if(self.juegoTerminado()){
		game.stop()
	}
	}
	method ganarVida(fruta){
		vidas += 1
	}
	method chocarConFrutas(fruta){
		vidas += 1
		game.say(self,"Ganaste una vida!")
		self.resetearPosition()
		fruta.resetarPosition()
	}
	

}
class Rivales{
	const numero = 1
	var property position = game.at(4,5)
	var previousPosition = position
	
	method image() = "rival" + numero.toString() + ".png"
	
	
	method acercarseA(personaje) {
		var otroPosicion = personaje.position()
		var newX = position.x() + if (otroPosicion.x() > position.x()) 1 else -1
		var newY = position.y() + if (otroPosicion.y() > position.y()) 1 else -1
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		position = game.at(newX, newY)
	}
	
	method resetearPosition(){
		position = game.at(numero +1 ,numero +1)
	}
	method chocarCon(otro) {
		self.resetPreviousPosition()
	}
	method resetPreviousPosition() {
		position = previousPosition 
	}
	
}
	
class Frutas{
	const numero = 1
	var property position = game.at(1,4)
	
	method image() = "fruta" + numero.toString() + ".png"
	
	method position() = game.at(numero + 9, numero + 2)
	
}
