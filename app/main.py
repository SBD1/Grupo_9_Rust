from turtle import position
import os
import sqlalchemy as db
from sqlalchemy.orm import sessionmaker
from game_text import gametext

from game_instances import game_assets


gi = game_assets()

engine = gi.load_game_db()

gt = gametext()

char_id = gt.introduction_text(engine)

while True:
    choice = gt.progression_text(engine)
    
    try:
        if choice == '9':
            gi.quit_game(engine)
            break
    except:
        if(choice.name[0] == 'Lighthouse'):  
            gt.lighthouse_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)

        elif(choice.name[0] == 'Warehouse' ):
            gt.warehouse_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)

        elif(choice.name[0] == 'Harbour' ):
            gt.harbor_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)

        elif(choice.name[0] == 'Water Treatment Plant' ):
            gt.water_treatment_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)

        elif(choice.name[0] == 'The Dome'):
            gt.dome_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)

        elif(choice.name[0] == 'Airfield'):
            gt.airfield_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)

        elif(choice.name[0] == 'Giant Excavator'):
            gt.excavator_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)

        elif(choice.name[0] == 'Launch Site'):
            gt.launch_site_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)

        elif(choice.name[0] == 'Military Tunnel'):
            gt.mil_tunnel_text()
            monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)
            print(monument)