var deck = Deck.allCards

for elem in deck {
	print(elem)
}

print("\n/**************************************\\\n")
deck.shuffle()

for elem in deck {
	print(elem)
}
