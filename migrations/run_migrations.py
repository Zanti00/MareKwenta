import glob
import importlib.util
import os

migration_files = glob.glob("migrations/*.py")

# this will run all migration files in the migrations folder to create database schemas 
for file in migration_files:
    print("Running migration:", file)
    spec = importlib.util.spec_from_file_location("migration", file)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)