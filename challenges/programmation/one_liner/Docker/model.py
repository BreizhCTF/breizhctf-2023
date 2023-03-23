
from sqlalchemy import Boolean, Column, Integer, String, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker


# Create a database engine
engine = create_engine('sqlite:///dataset.db')

# Create a session factory
Session = sessionmaker(bind=engine)

# Create a base class for declarative models
Base = declarative_base()


# Define a model for the "draws" table
class Draw(Base):
    __tablename__ = 'draws'

    id = Column(Integer, primary_key=True)
    category = Column(String)
    drawing = Column(String)
    oneline_drawable = Column(Boolean)
