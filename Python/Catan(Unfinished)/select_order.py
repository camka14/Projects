from roll_dice import *

roll = []

def select_order(number_of_players):
    players = {}
    count = 0
    for i in range(0,number_of_players):
        count += 1
        roll = roll_dice() #calls dice function
        total = roll[0]+roll[1] #adds both die
        while total in players.values(): #checks if roll has already been rolled
            roll = roll_dice() #re-rolls
            total = roll[0]+roll[1]
        players["player%s" % count] = total #gives players a number
    ordered_players = sorted(players, key = lambda name: players[name], reverse=True) #sorts players by their rolls
    return ordered_players
