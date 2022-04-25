import os
import pandas as pd
import sqlalchemy as db
import random


class game_assets():
    def load_game_db(self):
        DBUSER= os.getenv('DBUSER','postgres')
        DBPASSWORD = os.getenv('DBPASSWORD','shadow954')
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
                monument_content.append(['structure',pd.read_sql("select id from structures ORDER BY random() LIMIT 1;".format(loot_grade),engine)])
            elif(square ==  0):
                monument_content.append(['loot_box',game_assets.instance_loot_box(self,loot_grade,engine)])
            else:
                randomizer = random.randint(1,100)
                if randomizer <= 40:
                    monument_content.append('Empty')
                elif randomizer <= 70 and randomizer > 40:
                    monument_content.append(['npc',pd.read_sql("select id from npcs where grade = '{}' and isagressive = true ORDER BY random() LIMIT 1;".format(loot_grade),engine).id[0]])
                elif randomizer > 70 and randomizer <= 100:
                    if loot_grade == 'basic':
                        loot_boxes = ['primary','resource','barrel','basic','tool','food']
                    elif loot_grade == 'military':
                        loot_boxes = ['primary','resource','barrel','basic','tool','food','military']
                    elif loot_grade == 'elite':
                        loot_boxes = ['primary','resource','barrel','basic','tool','food','military','elite']
                    monument_content.append(['loot_box',game_assets.instance_loot_box(self,random.choice(loot_boxes),engine)])
        return monument_content


    def instance_loot_box(self,loot_grade,engine):
        query = "select * from lootcrates where grade = '{}'".format(loot_grade)
        qoi = pd.read_sql(query,engine).item_quantity
        
        iqoi = random.randint(2,int(qoi))
        
        query = """SELECT id FROM items WHERE lootgrade = '{}' ORDER BY random() LIMIT {};  """.format(loot_grade,iqoi)
        
        lootbox_items = pd.read_sql(query, engine)
        
        columns = pd.read_sql('select * from loot_crate_instance',engine).columns
        
        if iqoi == 2:
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
                             
        with engine.begin() as conn:     # TRANSACTION
            conn.execute(insertion)
            
        return int(pd.read_sql("select id from loot_crate_instance order by id desc limit 1;",engine).id)
    
    def quit_game(self,engine):
        drop_query = 'DELETE FROM loot_crate_instance;'
        with engine.begin() as conn:     # TRANSACTION
            conn.execute(drop_query)
        engine.dispose()
