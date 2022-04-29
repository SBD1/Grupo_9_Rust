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
    
    # def combat(player_character, npcs[]):
        
