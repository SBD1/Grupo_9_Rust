from secrets import choice
from game_instances import game_assets
import pandas as pd
class gametext():
    
    def introduction_text(self,engine):

        print("Welcome to Rust")
        print("""((((((((((((((((((((((((((((((
        ((((((((((((((((((((((((((((((
        (((((((((((((&&&&&&(((((((((((
        ((((((((((((((&&&&&(((((((((((
        ((((((((((((((((((((((((((((((
        ((((%(((((((((&&&&((((((((((((
        ((((&&&&&&(&&%(&&(((((((((((((
        ((((&&&&&&(&&%((((&&&(((((((((
        (((((((((((((((((#&(&&&&((((((
        ((((((((((((((((((((&&&&&&&(((
        (((((((((((((((((((((%&&((((((
        ((((((((((((((((((((((((((((((
        """)
        print("""You wake up washed upon a beach, it is morning, you remember nothing but your name.\n 
        You look around, you come to the conclusion you're in an Island, you can't make out how large it is, but it doesn't seem uninhabited
        """)
        char_name = input('What is it, your name?\n')
        print("""Well {}, quite the situation you put yourself in. You've got voices in your head talking to you,
        you don't know who, where or what you are, all you've got are your primal instincts to guide you.\n
        You have an urgent feeling, the need to survive, the question is, do you have what it takes?\n""".format(char_name))
        what_it_takes = input('Yes or No\n\n')
        while(True):
            if(what_it_takes.lower()=='yes' or what_it_takes.lower() == 'y'):
                print("Great, believing is the first step to survival {}, sadly it's not everything.\n We'll see how you do in the midst of famine, thirst and violence.\n".format(char_name))
                break
            elif(what_it_takes.lower()=='no' or what_it_takes.lower() == 'n'):
                print("Well, selfwareness might be helpful living in society, but not believing in yourself, as once said the masterful survivalist Ed Stafford, is your gateway to death in a survival situation. Either way, you have no other choice than to try.\n")
                break
            else:
                wrong =1
                what_it_takes = input("I ASKED YOU YES OR NO, HAVE YOU LOST YOU MIND ALONG WITH YOUR MEMORIES?\n I'll give you another chance, Yes or No?\n")
                if wrong>0:
                    what_it_takes = input("I can do this all day long, it's your choice, we can get a decent answer and move on or stay here and fight this endless tug-of-war\n Yes or No?\n")
        print("You look around, trying to find something that can help you survive.\n")
        print("After looking, your best bet is a 2 kilogram rock you find nearby, it's not ideal but it'll have to do.\n")

        print("You see yourself ready, you had to be, armed with a rock and a dream, you settle out to find resources that might help you in surviving.\n")
        
        insertion = "INSERT INTO playercharacters(name, type, hydration, poisoned, hunger, equipeditems1) VALUES('{}', 'player', 100, 0, 120, 43 )".format(char_name)
        with engine.begin() as conn:     # TRANSACTION
            conn.execute(insertion)
        conn.close()

        return pd.read_sql('select id from playercharacters order by id desc limit 1',engine).id
    
    def progression_text(self,engine):
        m = {}
        m[0] = pd.read_sql("""SELECT * FROM monuments WHERE lootgrade = '{}' ORDER BY random() LIMIT 1;  """.format('basic'),engine)
        m[1] = pd.read_sql("""SELECT * FROM monuments WHERE lootgrade = '{}' ORDER BY random() LIMIT 1;  """.format('military'),engine)
        m[2] = pd.read_sql("""SELECT * FROM monuments WHERE lootgrade = '{}' ORDER BY random() LIMIT 1;  """.format('elite'),engine)

        while True:
            print("You have a choice to make, your life might depend on it.\n ")
            print("1 - " + m[0].name[0] + "| TIER 1")
            print("2 - " + m[1].name[0] + "| TIER 2")
            print("3 - " + m[2].name[0] + "| TIER 3")

            choice = input("Where you wish to go?\n 1, 2 or 3\n or do you wish to end this? To do so, input 9\n")

            if choice == '1':
                return m[0]
            elif choice == '2':
                return m[1]
            elif choice == '3':
                return m[2]
            elif choice == '9':
                return choice

    def loot_text(self, loot_tier):
        print('You open the crate, inside you find some items:')

        return looted_items

    def lighthouse_text(self):
        print('You decide to move towards high ground. That may be your inner animal making decisions but its a decision nonetheless.\n')
        print('Immediatly a not-so-far-away lighthouse catches your eyes. You stride towards it in hope of finding something.\n')
        print('You enter in hopes of finding life, but what awaits you may be death.')

    def warehouse_text(self):
        pass

    def harbor_text(self):
        pass
    
    def water_treatment_text(self):
        pass

    def dome_text(self):
        pass

    def airfield_text(self):
        pass

    def excavator_text(self):
        pass

    def launch_site_text(self):
        pass

    def mil_tunnel_text(self):
        pass