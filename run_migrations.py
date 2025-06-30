import glob
import importlib.util
import os

models_files = glob.glob("models/*.py")

# this will run all migration files in the migrations folder to create database schemas 
for file in models_files:
    print("Running migration:", file)
    spec = importlib.util.spec_from_file_location("models", file)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)