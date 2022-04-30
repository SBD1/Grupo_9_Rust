import pandas as pd
import random

class combat_mechanics():
    
    def __init__(self,):
        self.health_points = 100
        self.chest_armour = 0
        self.head_armour = 0
        self.leg_armour = 0
        self.accuracy = 1
        self.range = 0

    def load_attributes(grade = 'basic'):
        char_atr = {}
        if grade == 'basic':
            multiplier = 1
        elif grade == 'military':
            multiplier = 1.5
        elif grade == 'elite':
            multiplier = 2

        char_atr['health'] = 100 * multiplier
        char_atr['hunger'] = 100
        char_atr['thirst'] = 100 
        return char_atr

    def hit(p2life, weapon, attack):
        place = ["Head", "Chest", "Leg", "Arms"]
        h = random.choice(place)
        init_health = p2life["health"]

        head_damage = weapon.headdamage[0]
        chest_damage = weapon.chestdamage[0]
        leg_damage = weapon.legdamage[0]
        arms_damage = weapon.armsdamage[0]

        if h == "Head":
            p2life["health"] -= head_damage

            
            print("The attack hit the head!\n")
            
        elif h == "Chest":
            p2life["health"] -= chest_damage
            print("The attack hit the Chest!\n")

        elif h == "Leg":
            p2life["health"] -= leg_damage
            print("The attack hit the Leg!\n")

        elif h == "Arms":
            p2life["health"] -= arms_damage
            print("The attack hit the Arms!\n")

        if attack == True:
            print("You dealt {} damage!\n".format(init_health - p2life["health"]))
        
        else:
            print("You took {} damage!\n".format(init_health - p2life["health"]))

        return p2life["health"]

    def combat(playerlife, npclife, weapon_player, weapon_npc):

        while(True):
            h = combat_mechanics.hit(playerlife, weapon_npc, False)

            if h <= 0:
                return 1

            h = combat_mechanics.hit(npclife, weapon_player, True)

            if h <= 0:
                return 0



        
        
