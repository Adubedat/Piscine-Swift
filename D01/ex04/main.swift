var deck = Deck(sorted: false)

print(deck.description)

print("\n/**************************************\\\n")

let card = deck.draw()
print("crad drawed : ")
print(card!)
print("actual deck : ")
print(deck.description)

print("\n/**************************************\\\n")

let card2 = deck.draw()
let card3 = deck.draw()
let card4 = deck.draw()
let card5 = deck.draw()
let card6 = deck.draw()
print(deck.outsDescription)
print(deck.discardsDescription)

print("\n/**************************************\\\n")

deck.fold(c: card2!)
deck.fold(c: card5!)
deck.fold(c: card5!)
print(deck.outsDescription)
print(deck.discardsDescription)
