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
