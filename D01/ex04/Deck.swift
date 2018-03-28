import Foundation

class Deck : NSObject {

	static let	allSpades : [Card] = Value.allValues.map { Card(c:Color.Spade, v:$0) }
	static let	allHearts : [Card] = Value.allValues.map { Card(c:Color.Heart, v:$0) }
	static let	allDiamonds : [Card] = Value.allValues.map { Card(c:Color.Diamond, v:$0) }
	static let	allClubs : [Card] = Value.allValues.map { Card(c:Color.Club, v:$0) }
	static let	allCards : [Card] = allSpades + allHearts + allDiamonds + allClubs

	var cards : [Card] = allCards
	var discards : [Card] = [Card]()
	var outs : [Card] = [Card]()

	init(sorted: Bool) {
		
		if !sorted {
			cards.shuffle()
		}
	}

	override var description : String {
		return ("[" + cards.map { $0.description }.joined(separator: ", ") + "]")
	}

	var outsDescription : String {
		return ("[" + outs.map { $0.description }.joined(separator: ", ") + "]")
	}

	var discardsDescription : String {
		return ("[" + discards.map { $0.description }.joined(separator: ", ") + "]")
	}

	func draw() -> Card? {
		if !cards.isEmpty {
			let drawCard = cards.removeFirst()
			outs.append(drawCard)
			return drawCard
		}
		else {
			return nil
		}
	}

	func fold(c: Card) {
		
		if let i = outs.index(of: c) {
			discards.append(c)
			outs.remove(at: i)
		}
	}
}

extension Array {
	mutating func shuffle() {
		var temp = [Element]()
		while !isEmpty {
			let i = Int(arc4random_uniform(UInt32(count)))
			let obj = remove(at: i)
			temp.append(obj)
		}
		self = temp
	}
}
