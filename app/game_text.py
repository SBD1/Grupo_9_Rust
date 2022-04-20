from game_instances import game_assets

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
        what_it_takes = input('Yes or No\n')
        while(True):
            if(what_it_takes.lower()=='yes' or what_it_takes.lower() == 'y'):
                print("Great, believing is the first step to survival {}, sadly it's not everything.\n We'll see how you do in the midst of famine, thirst and violence.".format(char_name))
                break
            elif(what_it_takes.lower()=='no' or what_it_takes.lower() == 'n'):
                print("Well, selfwareness might be helpful living in society, but not believing in yourself, as once said the masterful survivalist Ed Stafford, is your gateway to death in a survival situation. Either way, you have no other choice than to try.\n")
                break
            else:
                wrong =1
                what_it_takes = input("I ASKED YOU YES OR NO, HAVE YOU LOST YOU MIND ALONG WITH YOUR MEMORIES?\n I'll give you another chance, Yes or No?\n")
                if wrong>0:
                    what_it_takes = input("I can do this all day long, it's your choice, we can get a decent answer and move on or stay here and fight this endless tug-of-war\n Yes or No?")
        print("You look around, trying to find something that can help you survive.\n")
        print("After looking, your best bet is a 2 kilogram rock you find nearby, it's not ideal but it'll have to do.\n")

        print("You see yourself ready, you had to be, armed with a rock and a dream, you settle out to find resources that might help you in surviving.\n")
        
        insertion = "INSERT INTO maincharacter(owner) VALUES('{}')".format(char_name)
        with engine.begin() as conn:     # TRANSACTION
            conn.execute(insertion)
        conn.close()

        return pd.read_sql('select id from maincharacter order by id desc limit 1',engine).id
    
    def progression_text(self,coordinates):
        print("You have a choice to make, where you wish to go?")


    def loot_text(self, loot_tier):
        print('You open the crate, inside you find some items:')

        return looted_items
