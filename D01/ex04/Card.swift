import Foundation

class Card : NSObject {

	var color : Color
	var value : Value

	init(c: Color, v: Value) {
		self.color = c
		self.value = v
	}

	override var description : String {
		return ("(\(value), \(color))")
	}

	override func isEqual(_ object: Any?) -> Bool {
		if let card = object as? Card {
			return (card.color == self.color && card.value == self.value)
		}
		else {
			return (false)
		}
	}
}

func == (lhs: Card, rhs: Card) -> Bool {
	if (lhs.color == rhs.color && lhs.value == rhs.value) {
		return (true)
	}
	else {
		return (false)
	}
}
