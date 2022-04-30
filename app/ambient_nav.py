
from turtle import back
from game_text import gametext
from game_instances import game_instances
from combat_mechanics import combat_mechanics
import pandas as pd

class ambient_nav():

    def enter_monument(self,choice,engine):
        gt = gametext()
        gi = game_instances()
        # if(choice.name[0] == 'Lighthouse'):  
        #     gt.lighthouse_text()
        # elif(choice.name[0] == 'Warehouse' ):
        #     gt.warehouse_text()
        # elif(choice.name[0] == 'Harbour' ):
        #     gt.harbor_text()
        # elif(choice.name[0] == 'Water Treatment Plant' ):
        #     gt.water_treatment_text()
        # elif(choice.name[0] == 'The Dome'):
        #     gt.dome_text()
        # elif(choice.name[0] == 'Airfield'):
        #     gt.airfield_text()
        # elif(choice.name[0] == 'Giant Excavator'):
        #     gt.excavator_text()
        # elif(choice.name[0] == 'Launch Site'):
        #     gt.launch_site_text()
        # elif(choice.name[0] == 'Military Tunnel'):
        #     gt.mil_tunnel_text()
        monument = gi.monument_gen(choice.monumentsize[0],choice.lootgrade[0],engine)

        return monument

    def menu():
        print('\n1: Enter Room  2: Open Backpack\n3: Leave Monument 4: Leave Game\n' )
        entry = 0
        while(entry not in ['1','2','3','4']):
            entry = input()
            print('\n')
        return entry
                

    def load_room_content(self,monument,char_atr,engine,char_id,grade):
        gi = game_instances()
        slot_select = True

        for room in monument:
            entry = ambient_nav.menu()
            if entry == '1':
                print(room)        
                if room == 'Empty':
                    print('The room is empty, you get a break in the midst of this mayhem.')
                    char_atr.health =+10

                elif room[0] == 'npc':
                    print("You encounter a " + pd.read_sql("select name from npcs where id={}".format(room[1]),engine).name[0]+" in the room, you have no choice than to fight for your life.")
                    npc_atr = combat_mechanics.load_attributes(grade)

                elif room[0] == 'loot_box':
                    print('You encounter a loot box')
                    crate = pd.read_sql("select * from loot_crate_instance where id = {}".format(room[1]),engine)
                    gi.lootCrate(crate,char_id,engine)

                elif room[0] == 'structure':
                    if room[2] == True:
                        print("You encounter a " + pd.read_sql("select name from npcs where id={}".format(room[1]),engine).name[0]+" in the room, you have no choice than to fight for your life.")
                        npc_atr = combat_mechanics.load_attributes(grade)
                    else:
                        print("You find loot, no enemies around, luck smiles at you (for now..)")
                    crate = pd.read_sql("select * from loot_crate_instance where id = {}".format(gi.instance_loot_box(grade, engine)),engine)
                    gi.lootCrate(crate,char_id,engine)

            elif entry == '2':
                backpack = game_instances().getBackpack(char_id,engine)

                backpack_items = backpack[['slot01','slot02','slot03','slot04','slot05','slot06','slot07','slot08','slot09','slot10']]
                print("{}'s, Backpack:".format(pd.read_sql('select name from playercharacters where id={}'.format(char_id),engine).name[0]))
                i = 1
                gi.getEquipedItems(char_id,engine)
                for slot in backpack_items:
                    print(str(i) + ':' + str(backpack_items[slot].iloc[0]))
                    i+=1
                while slot_select != '0':
                    print("To use or equip and item, enter its slot number, to exit the backpack, enter the number 0")
                    slot_select = input()
                    if slot_select == '1':
                        gi.equipBackpackItem(char_id, backpack.slot01[0],engine,'01')
                    if slot_select == '2':
                        gi.equipBackpackItem(char_id, backpack.slot02[0],engine,'02')
                    if slot_select == '3':
                        gi.equipBackpackItem(char_id, backpack.slot03[0],engine,'03')
                    if slot_select == '4':
                        gi.equipBackpackItem(char_id, backpack.slot04[0],engine,'04')
                    if slot_select == '5':
                        gi.equipBackpackItem(char_id, backpack.slot05[0],engine,'05')
                    if slot_select == '6':
                        gi.equipBackpackItem(char_id, backpack.slot06[0],engine,'06')
                    if slot_select == '7':
                        gi.equipBackpackItem(char_id, backpack.slot07[0],engine,'07')
                    if slot_select == '8':
                        gi.equipBackpackItem(char_id, backpack.slot08[0],engine,'08')
                    if slot_select == '9':
                        gi.equipBackpackItem(char_id, backpack.slot09[0],engine,'09')
                    if slot_select == '10':
                        gi.equipBackpackItem(char_id, backpack.slot10[0],engine,'10')
                    
            elif entry == '3':
                break

            elif entry == '4':
                exit()
