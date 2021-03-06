
from turtle import back
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
            print('\n')
        return entry
                

    def load_room_content(self,monument,char_atr,engine,char_id,grade):
        gi = game_instances()
        slot_select = True
        room_counter = 0

        for room in monument:
            room_counter +=1
            
            gametext.print_sim('\nThis is Room N'+str(room_counter))
            while True:
                entry = ambient_nav.menu()
                if entry == '1':
                    
                    if room[0] == 'Empty':
                        gametext.print_sim('The room is empty, you get a break in the midst of this mayhem.')
                        char_atr['health'] =+10

                    elif room[0] == 'npc':
                        gametext.print_sim("You encounter a " + pd.read_sql("select name from npcs where id={}".format(room[1]),engine).name[0]+" in the room, you have no choice than to fight for your life.")
                        npc_atr = combat_mechanics.load_attributes(grade)

                        query = "SELECT equipedItems1,equipedItems2,equipedItems3,equipedItems4,equipedItems5 FROM PlayerCharacters where id = {}".format(char_id)
                        equipedItems = pd.read_sql(query, engine)

                        while(1):

                            answer = input("Which item do you want to use?\n")
                            item = equipedItems["equipeditems" + answer][0]
                            
                            try:
                                weapon = pd.read_sql("SELECT * from meleeWeapons where id = {} ".format(item), engine)
                                break

                            except:
                                gametext.print_sim("Item selected is not a weapon\nPlease select another slot.\n")

                            try:    
                                weapon = pd.read_sql("SELECT * from rangedWeapons where id = {} ".format(item), engine)
                                break

                            except:
                                gametext.print_sim("Item selected is not a weapon!\nPlease select another slot.\n")

                        weapons2 = pd.read_sql("SELECT * FROM rangedWeapons where itemName = 'Revolver'", engine)
                        
                        win = combat_mechanics.combat(char_atr, npc_atr, weapon, weapons2)

                        if win == 1:
                            gametext.print_sim("You've won, your sheer willforce and brutalness brought you through this damned challenge.")
                        
                        else:
                            gametext.print_sim("""You lost, 
                            in the end you didn't stand a chance. 
                            Maybe next time with more experience you might be able to face the dooms that await.""")
                            exit()

                    elif room[0] == 'loot_box':
                        gametext.print_sim('You encounter a loot crate, luck smiles at you, for once.')
                        crate = pd.read_sql("select * from loot_crate_instance where id = {}".format(room[1]),engine)
                        gi.lootCrate(crate,char_id,engine)

                    elif room[0] == 'structure':
                        if room[2] == True:
                            npc_atr = combat_mechanics.load_attributes(grade)

                            query = "SELECT equipedItems1,equipedItems2,equipedItems3,equipedItems4,equipedItems5 FROM PlayerCharacters where id = {}".format(char_id)
                            equipedItems = pd.read_sql(query, engine)

                            while(1):

                                answer = input("Which item do you want to use?\n")
                                item = equipedItems["equipeditems" + answer][0]
                                
                                try:
                                    weapon = pd.read_sql("SELECT * from meleeWeapons where id = {} ".format(item), engine)
                                    break

                                except:
                                    gametext.print_sim("Item selected is not a weapon\nPlease select another slot.\n")

                                try:    
                                    weapon = pd.read_sql("SELECT * from rangedWeapons where id = {} ".format(item), engine)
                                    break

                                except:
                                    gametext.print_sim("Item selected is not a weapon!\nPlease select another slot.\n")

                            weapons2 = pd.read_sql("SELECT * FROM rangedWeapons where itemName = 'Revolver'", engine)
                            
                            win = combat_mechanics.combat(char_atr, npc_atr, weapon, weapons2)

                            if win == 1:
                                gametext.print_sim("You've won, your sheer willforce and brutalness brought you through this damned challenge.")
                            
                            else:
                                gametext.print_sim("""You lost, 
                                in the end you didn't stand a chance. 
                                Maybe next time with more experience you might be able to face the dooms that await.""")
                                exit()

                        else:
                            gametext.print_sim("You find loot, no enemies around, luck smiles at you (for now..)")
                        crate = pd.read_sql("select * from loot_crate_instance where id = {}".format(gi.instance_loot_box(grade, engine)),engine)
                        gi.lootCrate(crate,char_id,engine)
                    break
            
                elif entry == '2':
                    while slot_select != '0':
                        gi.getEquipedItems(char_id,engine)

                        backpack = game_instances().getBackpack(char_id,engine)
                    
                        gametext.print_sim("To use or equip and item, enter its slot number, to exit the backpack, enter the number 0")
                        slot_select = input()
                        try:
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
                        except:
                            gametext.print_sim('That Item slot is empty, select a valid one or exit the inventory.\n')
                             
                if entry == '3':
                    return

                if entry == '4':
                    exit()

            if room_counter == len(monument):
                gametext.print_sim("You beat this challenge, congratulations, you might not be so lucky next time.")

