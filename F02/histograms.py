#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 18 21:15:14 2018

@author: nannabarnkob
"""

import numpy as np 
import pandas as pd 

presidents = pd.read_csv('presidents.csv', header=None) 
counts = presidents.iloc[:,2].value_counts()
counts.to_csv('president_counts.csv')
