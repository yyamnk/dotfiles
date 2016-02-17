#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ****************** 00-init.py *******************
# Created	 : 2015-Sep-02
# Last Change: 2016-Feb-17.
# -----------------------------------
# ipython 起動時に自動実行
# ************************************************************

from imp import reload
import numpy as np
import matplotlib
import matplotlib.pyplot as plt

from pandas import Series, DataFrame
import pandas as pd
from pprint import pprint as pp
import sys
import pickle
import math
# import oprc
from oprc import optimizers
# figure settings
import matplotlib as mpl
import seaborn as sns
sns.set_context('poster', rc={'figure.figsize': [8.0, 6.0], "lines.linewidth": 1.75})
mpl.rcParams['legend.frameon'] = True
mpl.rcParams['legend.shadow'] = True
