from secrets import choice
import game_instances as gi

import pandas as pd
import time
import random
import sys

class gametext():

    def print_sim(words):

        for char in words:
            time.sleep(random.choice([0.03, 0.011, 0.008, 0.007,   0.007, 0.007, 0.006, 0.006, 0.005, 0.001]))
            sys.stdout.write(char)
            sys.stdout.flush()
        time.sleep(1)


    def introduction_text(self,engine):
        print("""
        ((((((((((((((((((((((((((((((
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
        print("_____________________________________________")
        print("---------------Welcome to Rust---------------")
        print("_____________________________________________")

        gametext.print_sim("""You wake up washed upon a beach, it is morning, you remember nothing but your name.\n
You look around, you come to the conclusion you're in an Island, you can't make out how large it is, but it doesn't seem uninhabited
""")
        char_name = input('You stop for a second and think. What is it, your name?\n')
        gametext.print_sim("Oh right, your name is {}. You remember now, at least you still have that. Your name.\n".format(char_name))
        gametext.print_sim("""Well {}, quite the situation you put yourself in. You've got voices in your head talking to you,
you don't know where or what you are.\nAll you've got are your primal instincts to guide you.\n
You have an urgent feeling, the need to survive, the question is, do you have what it takes?\n""".format(char_name))
        what_it_takes = input('Yes or No\n\n')
        while(True):
            if(what_it_takes.lower()=='yes' or what_it_takes.lower() == 'y'):
                gametext.print_sim("Great, believing is the first step to survival {}, sadly it's not everything.\n We'll see how you do in the midst of famine, thirst and violence.\n".format(char_name))
                break
            elif(what_it_takes.lower()=='no' or what_it_takes.lower() == 'n'):
                gametext.print_sim("Well, selfwareness might be helpful living in society, but not believing in yourself, as once said the masterful survivalist Ed Stafford, is your gateway to death in a survival situation. Either way, you have no other choice than to try.\n")
                break
            else:
                wrong =1
                what_it_takes = input("I ASKED YOU YES OR NO, HAVE YOU LOST YOU MIND ALONG WITH YOUR MEMORIES?\n I'll give you another chance, Yes or No?\n")
                if wrong>0:
                    what_it_takes = input("I can do this all day long, it's your choice, we can get a decent answer and move on or stay here and fight this endless tug-of-war\n Yes or No?\n")
        gametext.print_sim("You look around, trying to find something that can help you survive.\n")
        gametext.print_sim("After looking, your best bet is a 2 kilogram rock you find nearby, it's not ideal but it'll have to do.\n")

        gametext.print_sim("You see yourself ready, you had to be, armed with a rock and a dream, you settle out to find resources that might help you in surviving.\n")

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
            gametext.print_sim("You have a choice to make, your life might depend on it.\n")
            gametext.print_sim("1 - " + m[0].name[0] + "| TIER 1\n")
            gametext.print_sim("2 - " + m[1].name[0] + "| TIER 2\n")
            gametext.print_sim("3 - " + m[2].name[0] + "| TIER 3\n")

            choice = input("Where you wish to go?\n 1, 2 or 3\n")

            if choice == '1':
                return m[0], 'basic'
            elif choice == '2':
                return m[1], 'military'
            elif choice == '3':
                return m[2], 'elite'
            else:
                gametext.print_sim('That option is not available\n')
                choice = input('if you wish to exit the game, enter 0')
                if choice == 0:
                    exit()
                else:
                    gametext.progression_text(engine)


    def loot_text(self, loot_tier):
        gametext.print_sim('You open the crate, inside you find some items:')

        return looted_items

    def lighthouse_text(self):
        gametext.print_sim('You decide to move towards high ground. That may be your inner animal making decisions but its a decision nonetheless.\n')
        gametext.print_sim('Immediatly a not-so-far-away lighthouse catches your eyes. You stride towards it in hope of finding something.\n')
        gametext.print_sim('You enter in hopes of finding life, but what awaits you may be death...\n')
        gametext.print_sim('Now all that is left to do is explore, but carefully.')

    def warehouse_text(self):
        gametext.print_sim('You see a building on the horizon, it seems to be empty, but better approach carefully anyway.\n')
        gametext.print_sim('When you get closer, you notice that inside this place there are several shelves and boxes scattered around.\n')
        gametext.print_sim('Now are you sure what this place is that you found by luck, it is a warehouse.')

    def harbor_text(self):
        gametext.print_sim('What is that by the water... something different from that endless beach you used to see on the coast.\n')
        gametext.print_sim('It is a harbor, it has some old ships parked at the docks, some containers scattered around...')
        gametext.print_sim('...and it is possible to notice that at least part of the energy works, it would be great.')

    def water_treatment_text(self):
        gametext.print_sim('As you walk around the island you see a large complex with several buil1dings.')
        gametext.print_sim('It has a water tank, buildings connected to the flow of fluids...')
        gametext.print_sim('It is a treatment plant.')
        gametext.print_sim('Clearly it is been idle for a while, but maybe it has some interesting supplies hihihi')

    def dome_text(self):
        gametext.print_sim('While you were walking, you came across a huge dome, it has big structures that support it to the ground')
        gametext.print_sim('You get closer you notice the huge spherical tank with walkways throughout and it probably has a way to the top.')
        gametext.print_sim('the climb does not seem to be very safe, but something so amazing might have some interesting things in it.')
        gametext.print_sim('Maybe I am in luck, let me see. -thinking this as I start to climb the dome-')

    def airfield_text(self):
        gametext.print_sim('Walking through the trees I notice a large white wall at the end of the forest.')
        gametext.print_sim('I decide to go around the wall and end up arriving at an empty entrance, when I pass through the entrance and enter the walls I am surprised by what I see.')
        gametext.print_sim('On one side there are three large aircraft hangars, at the ends four towers and on the opposite side of the hangars there is a large command center. Who knew... this strange island has an airport.')

    def excavator_text(self):
        gametext.print_sim('You are walking in a deserted region and just ahead you see a giant excavator inside a crater.')
        gametext.print_sim('It rotates around its axis while extracting minerals from the walls of this crater, you can see some boxes scattered under the excavator.')
        gametext.print_sim('Must be worth exploring.')

    def launch_site_text(self):
        gametext.print_sim('You see a big rocket launch pad from afar, you can also see something behind it...')
        gametext.print_sim('Is a large complex with several interconnected sheds and some buildings')
        gametext.print_sim('Hard to decide where to start exploring, but the platform looks like a good place.')

    def mil_tunnel_text(self):
        gametext.print_sim('You find some train tracks and decided to follow it to know where it arrives.')
        gametext.print_sim('When you reach the end you see a strange underground entrance, with some abandoned military vehicles around.')
        gametext.print_sim('It clearly does not seem to be a very friendly place, but it seems to be well protected, so it is sure to have a good loot.')
        gametext.print_sim('You decide to check... carefully.')