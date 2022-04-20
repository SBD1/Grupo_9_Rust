import os
import pandas as pd
import sqlalchemy as db

class game_assets():
    def load_game_db(self):
        DBUSER= os.getenv('DBUSER','postgres')
        DBPASSWORD = os.getenv('DBPASSWORD','shadow954')
        DBHOST = os.getenv('DBHOST','localhost')
        DBPORT = os.getenv('DBPORT','5432')
        DBNAME = os.getenv('DBNAME','rust-items')

        engine = db.create_engine(
            f"postgresql+psycopg2://{DBUSER}:{DBPASSWORD}@{DBHOST}:{DBPORT}/{DBNAME}", client_encoding='utf8')
        return engine
    
    # def start_game(self):
    #     print('Welcome to Rust!')
        
    #     conta_ex = 0 
    #     while(conta_ex!='S' or conta_ex!='N'):
    #         print('Já possui uma conta? S ou N')
    #         conta_ex = input()
    #         if(conta_ex == 'S'):
    #             print('ótimo, qual o id da sua conta?')
    #             maincharacterlist = pd.read_sql('select * from maincharacter',engine)
    #             print(maincharacterlist)
    #             idConta = input()
    #             return idConta
    #         elif(conta_ex == 'N'):
    #             print('deseja criar uma? S ou N')
    #             createAcc = input()
    #             if(createAcc == 'S'):
    #                 print('qual será o nome da conta?')
    #                 owner = input()
    #                 print('Ótimo! Sua conta foi criada com o nome {}'.format(owner))
    #                 insertion = "INSERT INTO maincharacter(owner) VALUES('{}')".format(owner)
    #                 with engine.begin() as conn:     # TRANSACTION
    #                     conn.execute(insertion)
    #                 return pd.read_sql('select id from maincharacter order by id desc limit 1',engine).id
    #             elif(createAcc== 'N'):
    #                 print('Conta não criada')     

    #     return owner
    
    def instance_loot_box(self,loot_grade):
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
    
#       def instanciate_backpack(self, ownerID):
#         query = "INSERT INTO backpack(ownerID, slot01,slot02) VALUES({},) ".format(ownerID)    
#         with engine.begin() as conn:     # TRANSACTION
#             conn.execute(drop_query)

    def quit_game(self):
        drop_query = 'DELETE FROM loot_crate_instance;'
        with engine.begin() as conn:     # TRANSACTION
            conn.execute(drop_query)
        engine.dispose()
