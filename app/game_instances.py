import os
import struct
from turtle import back
import pandas as pd
import sqlalchemy as db
import random


class game_instances():
    def load_game_db(self):
        DBUSER= os.getenv('DBUSER','postgres')
        DBPASSWORD = os.getenv('DBPASSWORD','postgres')
        DBHOST = os.getenv('DBHOST','localhost')
        DBPORT = os.getenv('DBPORT','5432')
        DBNAME = os.getenv('DBNAME','rust-2')

        engine = db.create_engine(
            f"postgresql+psycopg2://{DBUSER}:{DBPASSWORD}@{DBHOST}:{DBPORT}/{DBNAME}", client_encoding='utf8')
        return engine
        

    def monument_gen(self,monument_size, loot_grade,engine):
        monument_content = []
        for square in range(monument_size):
            if(square == 4 or square == 9 or square == 14 or square == 19):
                structure = pd.read_sql("select * from structures ORDER BY random() LIMIT 1;",engine)
                monument_content.append(['structure',structure.id[0],structure.combat_enemy[0],structure.name[0]])
            elif(square ==  0):
                monument_content.append(['loot_box',game_instances.instance_loot_box(self,loot_grade,engine)])
            else:
                randomizer = random.randint(1,100)
                if randomizer <= 40:
                    monument_content.append(['Empty'])
                elif randomizer <= 70 and randomizer > 40:
                    monument_content.append(['npc',pd.read_sql("select id from npcs where grade = '{}' and isagressive = true ORDER BY random() LIMIT 1;".format(loot_grade),engine).id[0]])
                elif randomizer > 70 and randomizer <= 100:
                    if loot_grade == 'basic':
                        loot_boxes = ['primary','resource','barrel','basic','tool','food']
                    elif loot_grade == 'military':
                        loot_boxes = ['primary','resource','barrel','basic','tool','food','military']
                    elif loot_grade == 'elite':
                        loot_boxes = ['primary','resource','barrel','basic','tool','food','military','elite']
                    monument_content.append(['loot_box',game_instances.instance_loot_box(self,random.choice(loot_boxes),engine)])
        return monument_content


    def instance_loot_box(self,loot_grade,engine):
        query = "select * from lootcrates where grade = '{}'".format(loot_grade)
        qoi = pd.read_sql(query,engine).item_quantity.get(key=0)

        # try:
        #     iqoi = random.randint(1,qoi)
        # except:
        #     iqoi = 1

        iqoi = 1

        query = """SELECT id FROM items WHERE lootgrade = '{}' ORDER BY random() LIMIT {};  """.format(loot_grade,iqoi)
        
        lootbox_items = pd.read_sql(query, engine)
        try:
            if iqoi == 1:
                insertion = "INSERT INTO loot_crate_instance(loot_grade,item1_id) VALUES ('{}',{})".format(loot_grade, lootbox_items.id[0])
            elif iqoi == 2:
                insertion = "INSERT INTO loot_crate_instance(loot_grade,item1_id,item2_id) VALUES ('{}',{},{})".format(loot_grade, lootbox_items.id[0],lootbox_items.id[1])
            elif iqoi == 3:
                insertion = "INSERT INTO loot_crate_instance(loot_grade,item1_id,item2_id,item3_id) VALUES ('{}',{},{},{})".format(loot_grade, lootbox_items.id[0],lootbox_items.id[1],lootbox_items.id[2])
            elif iqoi == 4:
                insertion = "INSERT INTO loot_crate_instance(loot_grade,item1_id,item2_id,item3_id,item4_id) VALUES ('{}',{},{},{},{})".format(loot_grade, lootbox_items.id[0],lootbox_items.id[1],lootbox_items.id[2],lootbox_items.id[3])
            elif iqoi == 5:
                insertion = "INSERT INTO loot_crate_instance(loot_grade,item1_id,item2_id,item3_id,item4_id,item5_id) VALUES ('{}',{},{},{},{},{})".format(loot_grade, lootbox_items.id[0],lootbox_items.id[1],lootbox_items.id[2],lootbox_items.id[3],lootbox_items.id[4])
            elif iqoi == 6:
                insertion = "INSERT INTO loot_crate_instance(loot_grade,item1_id,item2_id,item3_id,item4_id,item5_id,item6_id) VALUES ('{}',{},{},{},{},{},{})".format(loot_grade, lootbox_items.id[0],lootbox_items.id[1],lootbox_items.id[2],lootbox_items.id[3],lootbox_items.id[4],lootbox_items.id[5])
            elif iqoi == 7:
                insertion = "INSERT INTO loot_crate_instance(loot_grade,item1_id,item2_id,item3_id,item4_id,item5_id,item6_id,item7_id) VALUES ('{}',{},{},{},{},{},{},{})".format(loot_grade, lootbox_items.id[0],lootbox_items.id[1],lootbox_items.id[2],lootbox_items.id[3],lootbox_items.id[4],lootbox_items.id[5],lootbox_items.id[6])        
        except:
            insertion = "INSERT INTO loot_crate_instance(loot_grade,item1_id) VALUES ('{}',{})".format(loot_grade, lootbox_items.id[0])

        with engine.begin() as conn:     # TRANSACTION
            conn.execute(insertion)
            
        return int(pd.read_sql("select id from loot_crate_instance order by id desc limit 1;",engine).id)

    def quit_game(self,engine):
        drop_query = 'DELETE FROM loot_crate_instance;'
        with engine.begin() as conn:     # TRANSACTION
            conn.execute(drop_query)
        engine.dispose()

    def getBackpack(self, characterId, engine):
        backpack = pd.read_sql("select * from Backpack where ownerID={} LIMIT 1;".format(characterId),engine)
        return backpack
    
    def getEquipedItems(self, characterId, engine):
        equiped = pd.read_sql("select equipedItems1,equipedItems2,equipedItems3,equipedItems4,equipedItems5 from playercharacters where id={}".format(characterId),engine)
        print(equiped)

    def equipBackpackItem(self, characterId, itemId, engine,slot):
        item = pd.read_sql("select equipedItems1 from PlayerCharacters where id={} LIMIT 1;".format(characterId),engine).equipeditems1[0]

        if item != None:
            item = (pd.read_sql("select equipedItems2 from PlayerCharacters where id={};".format(characterId),engine)).equipeditems2[0]
            if item != None:
                item = (pd.read_sql("select equipedItems3 from PlayerCharacters where id={};".format(characterId),engine)).equipeditems3[0]
                if item != None:
                    item = (pd.read_sql("select equipedItems4 from PlayerCharacters where id={};".format(characterId),engine)).equipeditems4[0]
                    if item != None:
                        item = "update PlayerCharacters set equipedItems5={} where id={};update backpack set slot{}=null where ownerid={};".format(itemId,characterId,slot,characterId).equipeditems5[0]
                    else:
                        item = "update PlayerCharacters set equipedItems4={} where id={};update backpack set slot{}=null where ownerid={};".format(itemId,characterId,slot,characterId)
                else:
                    item = "update PlayerCharacters set equipedItems3={} where id={};update backpack set slot{}=null where ownerid={};".format(itemId,characterId,slot,characterId)
            else:
                item = "update PlayerCharacters set equipedItems2={} where id={}; update backpack set slot{}=null where ownerid={};".format(itemId,characterId,slot,characterId)
        else:
            item = "update PlayerCharacters set equipedItems1={} where id={}; update backpack set slot{}=null where ownerid={};".format(itemId,characterId,slot,characterId)

        with engine.begin() as conn:     # TRANSACTION
            conn.execute(item)

    def lootCrate(self,crate,char_id,engine):
        print(crate)
        print("What do you wish to do?")
        loot = input("""
1 - Loot
2 - Discard
""")
        backpack = pd.read_sql('select * from backpack where ownerid = {}'.format(char_id),engine)
        print(backpack.iloc[0])
        counter = -1
        with engine.begin() as conn:
            if loot == '1':
                
                for slotCheck in backpack.iloc[0]:
                    if slotCheck == None:
                        break
                    else:
                        counter+=1
                for loot_item in crate.iloc[0,2:]:

                    if loot_item !=None:    
                        if counter == 10:
                            query = "update backpack set slot10={} where ownerid = {};".format(loot_item,char_id)
                            counter +=1
                            conn.execute(query)
                        
                        elif counter > 0 and counter <10:
                            query = "update backpack set slot0{}={} where ownerid = {};".format(counter,loot_item,char_id)
                            counter+=1
                            conn.execute(query)                    
                    else:
                        break
                
                conn.execute("delete from loot_crate_instance where id={}".format(crate.id[0]))

            elif loot=='2':
                query = "delete from loot_crate_instance where id={}".format(crate.id[0])
                conn.execute(query)
