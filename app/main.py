from turtle import position
import os
import sqlalchemy as db
from sqlalchemy.orm import sessionmaker
from game_text import gametext
from combat_mechanics import *
from game_instances import game_instances
from ambient_nav import *

gi = game_instances()

engine = gi.load_game_db()

gt = gametext()
an = ambient_nav()
char_id = gt.introduction_text(engine)
char_atr = combat_mechanics.load_attributes()

while True:
    choice = gt.progression_text(engine)
    grade = choice.lootgrade[0]
    
    print("\nHealth:" + str(char_atr['health']) + " Hunger:" + str(char_atr['hunger'])+ " Thirst:" + str(char_atr['thirst'])+'\n')

    monument = an.enter_monument(choice, engine)
    
    an.load_room_content(monument, char_atr,engine, char_id, grade)

