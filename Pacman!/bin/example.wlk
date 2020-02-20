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
	}


}
class Rivales{
	const numero = 1
	var property position = game.at(4,5)
	var previousPosition = position
	
	method image() = "rival" + numero.toString() + ".png"
	
	method position() = game.at(numero + 1, numero + 2)
	
	method movete(){
	const x = 0.randomUpTo(game.width()).truncate(0)
	const y = 0.randomUpTo(game.height()).truncate(0)
	position = game.at(x,y) 
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
	var property position = game.at(7,4)
	
	method image() = "fruta" + numero.toString() + ".png"
	
	method position() = game.at(numero + 1, numero + 5)
}
