
from game_text import gametext
from game_instances import game_instances
from combat_mechanics import combat_mechanics
import pandas as pd

class ambient_nav():

    def enter_monument(self,choice,engine):
        gt = gametext()
        gi = game_instances()
        if(choice.name[0] == 'Lighthouse'):  
            gt.lighthouse_text()
        elif(choice.name[0] == 'Warehouse' ):
            gt.warehouse_text()
        elif(choice.name[0] == 'Harbour' ):
            gt.harbor_text()
        elif(choice.name[0] == 'Water Treatment Plant' ):
            gt.water_treatment_text()
        elif(choice.name[0] == 'The Dome'):
            gt.dome_text()
        elif(choice.name[0] == 'Airfield'):
            gt.airfield_text()
        elif(choice.name[0] == 'Giant Excavator'):
            gt.excavator_text()
        elif(choice.name[0] == 'Launch Site'):
            gt.launch_site_text()
        elif(choice.name[0] == 'Military Tunnel'):
            gt.mil_tunnel_text()
        monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)

        return monument

    def menu():
        print('\n1: Enter Room  2: Open Backpack\n3: Leave Monument 4: Leave Game\n' )
        entry = 0
        while(entry not in ['1','2','3','4']):
            entry = input()
        return entry
                

    def load_room_content(self,monument,char_atr,engine,char_id,grade):

        for room in monument:
            entry = ambient_nav.menu()
            if entry == '1':            
                if room == 'Empty':
                    print('The room is empty, you get a break in the midst of this mayhem.')
                    char_atr.health =+10

                elif room[0] == 'npc':
                    print("You encounter a " + pd.read_sql("select name from npcs where name={}".format(room[1]).name[0])+" in the room, you have no choice than to fight for your life.")
                    npc_atr = combat_mechanics.load_attributes(grade)

                elif room[0] == 'loot-box':
                    pass

                elif room[0] == 'structure':
                    if room[2] == True:
                        print("You encounter a " + pd.read_sql("select name from npcs where name={}".format(room[1]).name[0])+" in the room, you have no choice than to fight for your life.")
                        npc_atr = combat_mechanics.load_attributes(grade)
                    else:
                        print("You find loot, no enemies around, luck smiles at you (for now...)")
                    lootbox = pd.read_sql("select * from loot_crate_instance where id = {}".format(game_instances.instance_loot_box(grade, engine)),engine)
                    print(lootbox)

            elif entry == '2':
                backpack = game_instances().getBackpack(char_id,engine)
                print(backpack)

            elif entry == '3':
                break

            elif entry == '4':
                exit()
