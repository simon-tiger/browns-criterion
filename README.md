# Browns Criterion
A number guessing game in Processing based on Brown's Criterion

## A Number Guessing Trick
Note: I'm trying to make the steps a little shorter, so I'm saying player 1 is the person who's showing the trick, and player 2 is the other person.

1. Player 2 thinks of a number between 1 and 31 and doesn't say what it is. 
2. Player 1 shows player 2 a card, asking whether this number is on the card or not.
3. Repeat 2. with a different card, until they run out.
4. Now, the scary bit: Now player 1 suddenly knows what player 2's number is!

### How player 1 knows player 2's number
The numbers on the cards are arranged in a certain way. They are arranged, such that:

```
It's like traveling on a binary number.

You start at the 1's place. If player 2 says yes, we'll say the number in the 1's place is a 1.
If she says no, we'll say the number in the 1's place is a 0.
Then you repeat, but with the 2's place, and then you repeat again for the 4's place, then
for the 8's place, and for the 16's place, until you can get to 31.
```

In this version of the game that is in this GitHub repo, you are player 2, and the computer is player 1.
