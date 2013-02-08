## Basic game

Make an account, you level up every ln(x^x) + x^2 seconds, where x is the integer level you are trying to reach.
Players start at level 1.

  As an example, level 2 is reached in 5.4 seconds, level 3 is reached 12.3 seconds, level 4 in 21.5 seconds.

You have to be on the website in order to level up.

## RPG System

Per the basic game, players already have levels. Next, we'll add a bunch of RPG characteristics to be utilized in different ways.

* Current HP - The player's current health
* Maximum HP - The player's maxiumum health
* Current Mana - The player's current mana (utilized for magic, etc)
* Maximum Mana - The player's maximum mana
* STR - Strength, attack power
* VIT - Vitality, amount of max HP
* DEX - Dexterity, ability to evade or block hits
* INT - Intelligence, power of magic spells

### Calculating effective stats from character stats

* Maxiumum HP = Ceiling(90 + 6*ln(VIT^LVL))
* Maximum Mana = Ceiling(45 + 3*ln(INT^LVL))
* Attack Power = 
* Damage absorbed = 
* Evade chance = 
* Block chance = 
