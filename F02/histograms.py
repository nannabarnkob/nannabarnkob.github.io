#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 18 21:15:14 2018

@author: nannabarnkob
"""

import numpy as np 
import pandas as pd 
import json

presidents = pd.read_csv('presidents.csv') 

counts = presidents.iloc[:,2].value_counts()
r = pd.Series(range(0,147))
counts = counts.align(r, join='outer', fill_value=0)
counts = counts[0].astype(int)
counts.sort_index().to_csv('president_counts.csv',header=True)
cdict = counts.to_dict()
with open('president_counts.json', 'w') as f:
    json.dump(str(cdict), f)
presidents.drop('president',axis=1, inplace=True)
pdict = presidents.iloc[:,1].to_dict()
with open('president_data.json', 'w') as f:
    json.dump(str(pdict), f)