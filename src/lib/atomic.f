c      
c  functions for atomic data, usually accessed by integer atomic number (iz).  
c  functions includes:
c   char*2  at_symbol(iz)      atomic symbol
c   integer atomic_z(sym)      atomic Z from symbol
c   double  at_weight(iz)      atomic weight (amu)
c   double  at_kedge(iz)       K  edge energy (eV)
c   double  at_l1edge(iz)      L1 edge energy (eV)
c   double  at_l2edge(iz)      L2 edge energy (eV)
c   double  at_l3edge(iz)      L3 edge energy (eV)
c   double  at_m1edge(iz)      M1 edge energy (eV)
c   double  at_m2edge(iz)      M2 edge energy (eV)
c   double  at_m3edge(iz)      M3 edge energy (eV)
c   double  at_m4edge(iz)      M4 edge energy (eV)
c   double  at_m5edge(iz)      M5 edge energy (eV)
c   double  at_n1edge(iz)      N1 edge energy (eV)
c   double  at_n2edge(iz)      N2 edge energy (eV)
c   double  at_n3edge(iz)      N3 edge energy (eV)
c   double  at_n4edge(iz)      N4 edge energy (eV)
c   double  at_n5edge(iz)      N5 edge energy (eV)
c   double  at_n6edge(iz)      N6 edge energy (eV)
c   double  at_n7edge(iz)      N7 edge energy (eV)
c   double  at_kwidth(iz)      K  edge width (eV)
c   double  at_l1width(iz)     L1 edge width (eV)
c   double  at_l2width(iz)     L2 edge width (eV)
c   double  at_l3width(iz)     L3 edge width (eV)
c   double  at_fluor_line(iz,line)  emission line for char*8 line: 
c        'kalpha'(='kalpha1'), 'kalpha2', 'kalpha3',
c        'kbeta' (='kbeta1'),  'kbeta2', 'kbeta3', 'kbeta4', 'kbeta5',
c        'lalpha'(='lalpha1'), 'lalpha2', 
c        'lbeta' (='lbeta1'),  'lbeta2', 'lbeta3', 'lbeta4', 'lbeta6',
c        'lgamma'(='lgamma1'), 'lgamma2', 'lgamma3'

c//////////////////////////////////////////////////////////////////////
c Copyright (c) 2003 Matthew Newville, The University of Chicago
c
c Permission to use and redistribute the source code or binary forms of
c this software and its documentation, with or without modification is
c hereby granted provided that the above notice of copyright, these
c terms of use, and the disclaimer of warranty below appear in the
c source code and documentation, and that none of the names of The
c University of Chicago, The University of Washington, or the authors
c appear in advertising or endorsement of works derived from this
c software without specific prior written permission from all parties.
c
c THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
c EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
c MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
c IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
c CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
c TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
c SOFTWARE OR THE USE OR OTHER DEALINGS IN THIS SOFTWARE.
c//////////////////////////////////////////////////////////////////////
c
       character*2 function at_symbol(iz)
c atomic symbol from z
       integer iz
       character*2 dat(98)
       data dat /
     $ 'H ', 'He', 'Li', 'Be', 'B ', 'C ',
     $ 'N ', 'O ', 'F ', 'Ne', 'Na', 'Mg',
     $ 'Al', 'Si', 'P ', 'S ', 'Cl', 'Ar',
     $ 'K ', 'Ca', 'Sc', 'Ti', 'V ', 'Cr',
     $ 'Mn', 'Fe', 'Co', 'Ni', 'Cu', 'Zn',
     $ 'Ga', 'Ge', 'As', 'Se', 'Br', 'Kr',
     $ 'Rb', 'Sr', 'Y ', 'Zr', 'Nb', 'Mo',
     $ 'Tc', 'Ru', 'Rh', 'Pd', 'Ag', 'Cd',
     $ 'In', 'Sn', 'Sb', 'Te', 'I ', 'Xe',
     $ 'Cs', 'Ba', 'La', 'Ce', 'Pr', 'Nd',
     $ 'Pm', 'Sm', 'Eu', 'Gd', 'Tb', 'Dy',
     $ 'Ho', 'Er', 'Tm', 'Yb', 'Lu', 'Hf',
     $ 'Ta', 'W ', 'Re', 'Os', 'Ir', 'Pt',
     $ 'Au', 'Hg', 'Tl', 'Pb', 'Bi', 'Po',
     $ 'At', 'Rn', 'Fr', 'Ra', 'Ac', 'Th',
     $ 'Pa', 'U ', 'Np', 'Pu', 'Am', 'Cm',
     $ 'Bk', 'Cf'/
       if ((iz.gt.98).or.(iz.lt.1)) then
          at_symbol='  '
       else
          at_symbol = dat(iz)
       endif
       call upper(at_symbol(1:1))
       return
       end
c
       integer function atomic_z(sym)
c atomic z from symbol
       character*2 sym, tmp, at_symbol
       external at_symbol
       integer  i
       tmp = sym
       call upper(tmp(1:1))
       atomic_z = 0
       do 10 i = 1, 98
          if (at_symbol(i).eq.tmp) atomic_z = i
 10    continue 
       return
       end
       double precision function at_weight (iz)
c  atomic weight from atom number (iz), amu
       integer iz, i
       double precision  dat(98)
       data dat /
     $    1.0079,   4.0026,    6.941,   9.0122,    10.81,   12.011,
     $   14.0067,  15.9994,  18.9984,   20.179,  22.9898,   24.305,
     $   26.9815,  28.0855,  30.9738,    32.06,   35.453,   39.948,
     $   39.0983,    40.08,  44.9559,    47.88,  50.9415,   51.996,
     $    54.938,   55.847,  58.9332,    58.69,   63.546,    65.38,
     $     69.72,    72.59,  74.9216,    78.96,   79.904,     83.8,
     $   85.4678,    87.62,  88.9059,    91.22,  92.9064,    95.94,
     $    97.907,   101.07,  102.906,   106.42,  107.868,   112.41,
     $    114.82,   118.69,   121.75,    127.6,  126.905,   131.29,
     $   132.905,   137.33,  138.906,   140.12,  140.908,   144.24,
     $   144.913,   150.36,   151.96,   157.25,  158.925,    162.5,
     $    164.93,   167.26,  168.934,   173.04,  174.967,   178.49,
     $   180.948,   183.85,  186.207,    190.2,   192.22,   195.08,
     $   196.967,   200.59,  204.383,    207.2,   208.98,  208.982,
     $   209.987,  222.018,   223.02,  226.025,  227.028,  232.038,
     $   231.036,  238.051,  237.048,  239.052,  243.061,   247.07,
     $   247.07,   251.08/
       i = min(98,max(1,iz))
       at_weight = dat(i)
       return
       end
c
       double precision function at_kedge (iz)
c  K edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $      13.6,     24.6,     54.7,    111.5,    188.0,    284.2,
     $     409.9,    543.1,    696.7,    870.2,   1070.8,   1303.0,
     $    1559.0,   1839.0,   2145.5,   2472.0,   2822.0,   3205.9,
     $    3608.4,   4038.5,   4492.0,   4966.0,   5465.0,   5989.0,
     $    6539.0,   7112.0,   7709.0,   8333.0,   8979.0,   9659.0,
     $   10367.0,  11103.0,  11867.0,  12658.0,  13474.0,  14326.0,
     $   15200.0,  16105.0,  17038.0,  17998.0,  18986.0,  20000.0,
     $   21044.0,  22117.0,  23220.0,  24350.0,  25514.0,  26711.0,
     $   27940.0,  29200.0,  30491.0,  31814.0,  33169.0,  34561.0,
     $   35985.0,  37441.0,  38925.0,  40443.0,  41991.0,  43569.0,
     $   45184.0,  46834.0,  48519.0,  50239.0,  51996.0,  53789.0,
     $   55618.0,  57486.0,  59390.0,  61332.0,  63314.0,  65351.0,
     $   67416.0,  69525.0,  71676.0,  73871.0,  76111.0,  78395.0,
     $   80725.0,  83102.0,  85530.0,  88005.0,  90526.0,  93105.0,
     $   95730.0,  98404.0, 101137.0, 103922.0, 106755.0, 109651.0,
     $  112601.0, 115606.0, 118669.0, 121791.0, 124982.0, 128241.0,
     $  131556.0, 134939.0/
       i = min(98,max(1,iz))
       at_kedge  = dat(i)
       return
       end
c
       double precision function at_l1edge (iz)
c  L1 edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $      0.0,      0.0,      5.3,      8.0,     12.6,     18.0,
     $      37.3,     41.6,     45.0,     48.5,     63.5,     88.6,
     $     117.8,    149.7,    189.0,    230.9,    270.0,    326.3,
     $     378.6,    438.4,    498.0,    560.9,    626.7,    696.0,
     $     769.1,    844.6,    925.1,   1008.6,   1096.7,   1196.2,
     $    1299.0,   1414.6,   1527.0,   1652.0,   1782.0,   1921.0,
     $    2065.0,   2216.0,   2373.0,   2532.0,   2698.0,   2866.0,
     $    3043.0,   3224.0,   3412.0,   3604.0,   3806.0,   4018.0,
     $    4238.0,   4465.0,   4698.0,   4939.0,   5188.0,   5453.0,
     $    5714.0,   5989.0,   6266.0,   6548.0,   6835.0,   7126.0,
     $    7428.0,   7737.0,   8052.0,   8376.0,   8708.0,   9046.0,
     $    9394.0,   9751.0,  10116.0,  10486.0,  10870.0,  11271.0,
     $   11682.0,  12100.0,  12527.0,  12968.0,  13419.0,  13880.0,
     $   14353.0,  14839.0,  15347.0,  15861.0,  16388.0,  16939.0,
     $   17493.0,  18049.0,  18639.0,  19237.0,  19840.0,  20472.0,
     $   21105.0,  21757.0,  22427.0,  23104.0,  23808.0,  24526.0,
     $   25256.0,  26010.0/
       i = min(98,max(1,iz))
       at_l1edge  = dat(i)
       return
       end
       double precision function at_l2edge (iz)
c  L2 edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      3.0,      4.7,      7.2,
     $      17.5,     18.2,     19.9,     21.7,     30.4,     49.6,
     $      72.9,     99.8,    136.0,    163.6,    202.0,    250.6,
     $     297.3,    349.7,    403.6,    460.2,    519.8,    583.8,
     $     649.9,    719.9,    793.2,    870.0,    952.3,   1044.9,
     $    1143.2,   1248.1,   1359.1,   1474.3,   1596.0,   1730.9,
     $    1864.0,   2007.0,   2156.0,   2307.0,   2465.0,   2625.0,
     $    2793.0,   2967.0,   3146.0,   3330.0,   3524.0,   3727.0,
     $    3938.0,   4156.0,   4380.0,   4612.0,   4852.0,   5107.0,
     $    5359.0,   5624.0,   5891.0,   6164.0,   6440.0,   6722.0,
     $    7013.0,   7312.0,   7617.0,   7930.0,   8252.0,   8581.0,
     $    8918.0,   9264.0,   9617.0,   9978.0,  10349.0,  10739.0,
     $   11136.0,  11544.0,  11959.0,  12385.0,  12824.0,  13273.0,
     $   13734.0,  14209.0,  14698.0,  15200.0,  15711.0,  16244.0,
     $   16785.0,  17337.0,  17907.0,  18484.0,  19083.0,  19693.0,
     $   20314.0,  20948.0,  21600.0,  22266.0,  22952.0,  23651.0,
     $   24371.0,  25108.0/
       i = min(98,max(1,iz))
       at_l2edge  = dat(i)
       return
       end
       double precision function at_l3edge (iz)
c  L3 edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      3.0,      4.7,      7.2,
     $      17.5,     18.2,     19.9,     21.6,     30.5,     49.2,
     $      72.5,     99.2,    135.0,    162.5,    200.0,    248.4,
     $     294.6,    346.2,    398.7,    453.8,    512.1,    574.1,
     $     638.7,    706.8,    778.1,    852.7,    932.7,   1021.8,
     $    1116.4,   1217.0,   1323.6,   1433.9,   1550.0,   1678.4,
     $    1804.0,   1940.0,   2080.0,   2223.0,   2371.0,   2520.0,
     $    2677.0,   2838.0,   3004.0,   3173.0,   3351.0,   3538.0,
     $    3730.0,   3929.0,   4132.0,   4341.0,   4557.0,   4786.0,
     $    5012.0,   5247.0,   5483.0,   5723.0,   5964.0,   6208.0,
     $    6459.0,   6716.0,   6977.0,   7243.0,   7514.0,   7790.0,
     $    8071.0,   8358.0,   8648.0,   8944.0,   9244.0,   9561.0,
     $    9881.0,  10207.0,  10535.0,  10871.0,  11215.0,  11564.0,
     $   11919.0,  12284.0,  12658.0,  13035.0,  13419.0,  13814.0,
     $   14214.0,  14619.0,  15031.0,  15444.0,  15871.0,  16300.0,
     $   16733.0,  17166.0,  17610.0,  18057.0,  18510.0,  18970.0,
     $   19435.0,  19907.0/
       i = min(98,max(1,iz))
       at_l3edge = dat(i)
       return
       end
       double precision function at_m1edge (iz)
c  M1 edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      2.0,
     $       4.0,      8.0,     12.0,     14.0,     18.0,     29.3,
     $      34.8,     44.3,     51.1,     58.7,     66.3,     74.1,
     $      82.3,     91.3,    101.0,    110.8,    122.5,    139.8,
     $     159.5,    180.1,    204.7,    229.6,    257.0,    292.8,
     $     326.7,    358.7,    392.0,    430.3,    466.6,    506.3,
     $     544.0,    586.1,    628.1,    671.6,    719.0,    772.0,
     $     827.2,    884.7,    940.0,   1006.0,   1072.0,   1148.7,
     $    1211.0,   1293.0,   1362.0,   1436.0,   1511.0,   1575.0,
     $    1650.0,   1723.0,   1800.0,   1881.0,   1968.0,   2047.0,
     $    2128.0,   2206.0,   2307.0,   2398.0,   2491.0,   2601.0,
     $    2708.0,   2820.0,   2932.0,   3049.0,   3174.0,   3296.0,
     $    3425.0,   3562.0,   3704.0,   3851.0,   3999.0,   4149.0,
     $    4317.0,   4482.0,   4652.0,   4822.0,   5002.0,   5182.0,
     $    5367.0,   5548.0,   5739.0,   5933.0,   6133.0,   6337.0,
     $    6545.0,   6761.0/
       i = min(98,max(1,iz))
       at_m1edge = dat(i)
       return
       end
       double precision function at_m2edge (iz)
c  M2 edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      1.0,
     $       2.0,      2.0,      7.0,      8.0,     10.0,     15.9,
     $      18.3,     25.4,     28.3,     32.6,     37.2,     42.2,
     $      47.2,     52.7,     58.9,     68.0,     77.3,     91.4,
     $     103.5,    124.9,    146.2,    166.5,    189.0,    222.2,
     $     248.7,    280.3,    310.6,    343.5,    376.1,    411.6,
     $     447.6,    483.3,    521.3,    559.9,    603.8,    652.6,
     $     703.2,    756.5,    812.7,    870.8,    931.0,   1002.1,
     $    1071.0,   1137.0,   1209.0,   1274.0,   1337.0,   1403.0,
     $    1471.4,   1541.0,   1614.0,   1688.0,   1768.0,   1842.0,
     $    1923.0,   2006.0,   2090.0,   2173.0,   2264.0,   2365.0,
     $    2469.0,   2575.0,   2682.0,   2792.0,   2909.0,   3027.0,
     $    3148.0,   3279.0,   3416.0,   3554.0,   3696.0,   3854.0,
     $    4008.0,   4159.0,   4327.0,   4490.0,   4656.0,   4830.0,
     $    5001.0,   5182.0,   5366.0,   5547.0,   5739.0,   5937.0,
     $    6138.0,   6345.0/
       i = min(98,max(1,iz))
       at_m2edge = dat(i)
       return
       end
       double precision function at_m3edge (iz)
c  M3 edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      1.0,
     $       2.0,      2.0,      6.0,      7.0,     10.0,     15.7,
     $      18.3,     25.4,     28.3,     32.6,     37.2,     42.2,
     $      47.2,     52.7,     59.9,     66.2,     75.1,     88.6,
     $     100.0,    120.8,    141.2,    160.7,    182.0,    214.4,
     $     239.1,    270.0,    298.8,    329.8,    360.6,    394.0,
     $     417.7,    461.5,    496.5,    532.3,    573.0,    618.4,
     $     665.3,    714.6,    766.4,    820.8,    875.0,    940.6,
     $    1003.0,   1063.0,   1128.0,   1187.0,   1242.0,   1297.0,
     $    1357.0,   1419.8,   1481.0,   1544.0,   1611.0,   1676.0,
     $    1741.0,   1812.0,   1885.0,   1950.0,   2024.0,   2107.0,
     $    2194.0,   2281.0,   2367.0,   2457.0,   2551.0,   2645.0,
     $    2743.0,   2847.0,   2957.0,   3066.0,   3177.0,   3302.0,
     $    3426.0,   3538.0,   3663.0,   3792.0,   3909.0,   4046.0,
     $    4174.0,   4303.0,   4435.0,   4563.0,   4698.0,   4838.0,
     $    4976.0,   5116.0/
       i = min(98,max(1,iz))
       at_m3edge  = dat(i)
       return
       end
       double precision function at_m4edge (iz)
c  M4 edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      2.0,      2.0,      2.0,
     $       2.0,      2.0,      3.0,      4.0,      5.0,     10.2,
     $      18.7,     29.8,     41.7,     55.5,     70.0,     95.0,
     $     113.0,    136.0,    157.7,    181.1,    205.0,    231.1,
     $     257.6,    284.2,    311.9,    340.5,    374.0,    411.9,
     $     451.4,    493.2,    537.5,    583.4,    630.8,    689.0,
     $     740.5,    795.7,    853.0,    902.4,    948.3,   1003.3,
     $    1052.0,   1110.9,   1158.6,   1221.9,   1276.9,   1333.0,
     $    1392.0,   1453.0,   1515.0,   1576.0,   1639.0,   1716.0,
     $    1793.0,   1872.0,   1949.0,   2031.0,   2116.0,   2202.0,
     $    2291.0,   2385.0,   2485.0,   2586.0,   2688.0,   2798.0,
     $    2909.0,   3022.0,   3136.0,   3248.0,   3370.0,   3491.0,
     $    3611.0,   3728.0,   3849.0,   3970.0,   4096.0,   4224.0,
     $    4353.0,   4484.0/
       i = min(98,max(1,iz))
       at_m4edge  = dat(i)
       return
       end
       double precision function at_m5edge (iz)
c  M5 edge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      2.0,      2.0,      2.0,
     $       2.0,      2.0,      3.0,      4.0,      5.0,     10.1,
     $      18.7,     29.2,     41.7,     54.6,     69.0,     93.8,
     $     112.0,    134.2,    155.8,    178.8,    202.3,    227.9,
     $     253.9,    280.0,    307.2,    335.2,    368.3,    405.2,
     $     443.9,    484.9,    528.2,    573.0,    619.3,    676.4,
     $     726.6,    780.5,    836.0,    883.8,    928.8,    980.4,
     $    1027.0,   1083.4,   1127.5,   1189.6,   1241.1,   1292.0,
     $    1351.0,   1409.0,   1468.0,   1528.0,   1589.0,   1662.0,
     $    1735.0,   1809.0,   1883.0,   1960.0,   2040.0,   2122.0,
     $    2206.0,   2295.0,   2389.0,   2484.0,   2580.0,   2683.0,
     $    2787.0,   2892.0,   3000.0,   3105.0,   3219.0,   3332.0,
     $    3442.0,   3552.0,   3664.0,   3775.0,   3890.0,   4009.0,
     $    4127.0,   4247.0/
       i = min(98,max(1,iz))
       at_m5edge  = dat(i)
       return
       end 
       double precision function at_n1edge (iz)
c  N1 dge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       1.0,      5.0,      8.0,     12.0,     27.0,     27.5,
     $      30.5,     38.9,     43.8,     50.6,     56.4,     63.2,
     $      69.5,     75.0,     81.4,     87.1,     97.0,    109.8,
     $     122.9,    137.1,    153.2,    169.4,    186.0,    213.2,
     $     232.3,    253.5,    274.7,    291.0,    304.5,    319.2,
     $     331.0,    347.2,    360.0,    378.6,    396.0,    414.2,
     $     432.4,    449.8,    470.9,    480.5,    506.8,    538.0,
     $     563.4,    594.1,    625.4,    658.2,    691.1,    725.4,
     $     762.1,    802.2,    846.2,    891.8,    939.0,    995.0,
     $    1042.0,   1097.0,   1153.0,   1208.0,   1269.0,   1330.0,
     $    1387.0,   1439.0,   1501.0,   1559.0,   1620.0,   1684.0,
     $    1748.0,   1813.0/
       i = min(98,max(1,iz))
       at_n1edge = dat(i)
       return
       end
       double precision function at_n2edge (iz)
c  N2 dge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      1.0,
     $       2.0,      3.0,      3.0,      3.0,      3.0,     14.1,
     $      16.3,     21.6,     24.4,     28.5,     32.6,     37.6,
     $      42.3,     46.3,     50.5,     55.7,     63.7,     63.9,
     $      73.5,     83.6,     95.6,    103.3,    123.0,    146.7,
     $     172.4,    192.0,    205.8,    223.2,    236.3,    243.3,
     $     242.0,    265.6,    284.0,    286.0,    322.4,    333.5,
     $     343.5,    366.2,    385.9,    388.7,    412.4,    438.2,
     $     463.4,    490.4,    518.7,    549.1,    577.8,    609.1,
     $     642.7,    680.2,    720.5,    761.9,    805.2,    851.0,
     $     886.0,    929.0,    980.0,   1058.0,   1080.0,   1168.0,
     $    1224.0,   1271.0,   1328.0,   1380.0,   1438.0,   1498.0,
     $    1558.0,   1620.0/
       i = min(98,max(1,iz))
       at_n2edge = dat(i)
       return
       end
       double precision function at_n3edge (iz)
c  N3 dge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      1.0,
     $       2.0,      3.0,      3.0,      3.0,      3.0,     14.1,
     $      15.3,     20.1,     23.1,     27.1,     30.8,     35.5,
     $      39.9,     43.2,     47.3,     50.9,     58.3,     63.9,
     $      73.5,     83.6,     95.6,    103.3,    123.0,    145.5,
     $     161.3,    178.6,    196.0,    206.5,    217.6,    224.6,
     $     242.0,    247.4,    257.0,    271.0,    284.1,    293.2,
     $     308.2,    320.2,    332.6,    339.7,    359.2,    380.7,
     $     400.9,    423.6,    446.8,    470.7,    495.8,    519.4,
     $     546.3,    576.6,    609.5,    643.5,    678.8,    705.0,
     $     740.0,    768.0,    810.0,    879.0,    890.0,    966.4,
     $    1007.0,   1043.0,   1085.0,   1123.0,   1165.0,   1207.0,
     $    1249.0,   1292.0/
       i = min(98,max(1,iz))
       at_n3edge = dat(i)
       return
       end
       double precision function at_n4edge (iz)
c  N4 dge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      2.0,      2.0,      4.0,     11.7,
     $      17.7,     24.9,     33.3,     41.9,     50.6,     69.5,
     $      79.8,     92.6,    105.3,    109.0,    115.1,    120.5,
     $     120.0,    129.0,    133.0,    142.6,    150.5,    153.6,
     $     160.0,    167.6,    175.5,    191.2,    206.1,    220.0,
     $     237.9,    255.9,    273.9,    293.1,    311.9,    331.6,
     $     353.2,    378.2,    405.7,    434.3,    464.0,    500.0,
     $     533.0,    567.0,    603.0,    636.0,    675.0,    712.1,
     $     743.0,    778.3,    816.0,    846.0,    880.0,    916.0,
     $     955.0,    991.0/
       i = min(98,max(1,iz))
       at_n4edge = dat(i)
       return
       end
       double precision function at_n5edge (iz)
c  N5 dge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      2.0,      2.0,      4.0,     10.7,
     $      16.9,     23.9,     32.1,     40.4,     48.9,     67.5,
     $      77.5,     89.9,    102.5,    109.0,    115.1,    120.5,
     $     120.0,    129.0,    127.7,    142.6,    150.5,    153.6,
     $     160.0,    167.6,    175.5,    182.4,    196.3,    211.5,
     $     226.4,    243.5,    260.5,    278.5,    296.3,    314.6,
     $     335.1,    358.8,    385.0,    412.2,    440.1,    473.0,
     $     507.0,    541.0,    577.0,    603.0,    639.0,    675.2,
     $     708.0,    736.2,    771.0,    798.0,    829.0,    862.0,
     $     898.0,    930.0/
       i = min(98,max(1,iz))
       at_n5edge = dat(i)
       return
       end
       double precision function at_n6edge (iz)
c  N6 dge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.1,      2.0,      1.5,
     $       4.0,      5.2,      6.0,      8.6,      7.7,      8.0,
     $       8.6,      4.7,      4.6,      2.5,      8.9,     15.9,
     $      23.5,     33.6,     42.9,     53.4,     63.8,     74.5,
     $      87.6,    104.0,    122.2,    141.7,    162.3,    184.0,
     $     210.0,    238.0,    268.0,    299.0,    319.0,    342.4,
     $     371.0,    388.2,    414.0,    436.0,    461.0,    484.0,
     $     511.0,    538.0/
       i = min(98,max(1,iz))
       at_n6edge = dat(i)
       return
       end
       double precision function at_n7edge (iz)
c  N7 dge energy atom number (iz). eV
       integer iz, i
       double precision dat(98)
       data dat /
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.0,      0.0,      0.0,
     $       0.0,      0.0,      0.0,      0.1,      2.0,      1.5,
     $       4.0,      5.2,      6.0,      8.6,      2.4,      4.3,
     $       5.2,      4.7,      4.6,      1.3,      7.5,     14.2,
     $      21.6,     31.4,     40.5,     50.7,     60.8,     71.2,
     $      83.9,     99.9,    117.8,    136.9,    157.0,    184.0,
     $     210.0,    238.0,    268.0,    299.0,    319.0,    333.1,
     $     360.0,    377.4,    403.0,    424.0,    446.0,    470.0,
     $     495.0,    520.0/
       i = min(98,max(1,iz))
       at_n7edge = dat(i)
       return
       end

       double precision function at_kwidth(iz)
c  K edge core width, eV
       integer iz, i
       double precision  dat(98)
       data dat /
     $      0.240,   0.240,   0.240,   0.240,   0.240,   0.240,
     $      0.240,   0.240,   0.240,   0.240,   0.300,   0.360,
     $      0.420,   0.480,   0.530,   0.590,   0.640,   0.680,
     $      0.740,   0.810,   0.860,   0.940,   1.010,   1.080,
     $      1.160,   1.250,   1.330,   1.440,   1.550,   1.670,
     $      1.820,   1.960,   2.140,   2.330,   2.520,   2.750,
     $      2.990,   3.250,   3.520,   3.840,   4.140,   4.520,
     $      4.910,   5.330,   5.770,   6.240,   6.750,   7.280,
     $      7.910,   8.490,   9.160,   9.890,   10.600,  11.400,
     $      12.300,  13.200,  14.100,  15.100,  16.200,  17.300,
     $      18.500,  19.700,  21.000,  22.300,  23.800,  25.200,
     $      26.800,  28.400,  30.100,  31.900,  33.700,  35.700,
     $      37.700,  39.900,  42.100,  44.400,  46.800,  49.300,
     $      52.000,  54.600,  57.400,  60.400,  63.400,  66.600,
     $      69.800,  73.300,  76.800,  80.400,  84.100,  88.000,
     $      91.900,  96.100,  96.100,  96.100,  96.100,  96.100,
     $      96.100,  96.100 /
       i = min(98,max(1,iz))
       at_kwidth = dat(i)
       return
       end
       double precision function at_l1width(iz)
c  L1 edge core width, eV
       integer iz, i
       double precision  dat(98)
       data dat /
     $      0.000,  0.000,  0.000,   0.000,   0.000,    0.000,
     $      0.000,  0.000,  0.000,   0.000,   0.200,    0.410,
     $      0.730,  1.030,  1.260,   1.490,   1.580,    1.630,
     $      1.920,  2.070,  2.210,   2.340,   2.410,    2.540,
     $      2.620,  2.760,  2.790,   2.890,   3.060,    3.280,
     $      3.380,  3.530,  3.790,   3.940,   4.110,    4.280,
     $      4.440,  4.670,  4.710,   4.780,   3.940,    4.250,
     $      4.360,  4.580,  4.730,   4.930,   4.880,    4.870,
     $      5.000,  2.970,  3.130,   3.320,   3.460,    3.640,
     $      3.780,  3.920,  4.060,   4.210,   4.340,    4.520,
     $      4.670,  4.800,  4.910,   5.050,   5.190,    5.250,
     $      5.330,  5.430,  5.470,   5.530,   5.540,    5.630,
     $      5.580,  5.610,  6.180,   7.250,   8.300,    9.390,
     $      10.500, 11.300, 12.000,  12.200,  12.400,   12.600,
     $      12.800, 13.100, 13.300,  13.400,  13.600,   13.700,
     $      14.300, 14.000, 14.000,  14.000,  14.000,   14.000,
     $      14.000, 14.000/
       i = min(98,max(1,iz))
       at_l1width = dat(i)
       return
       end
       double precision function at_l2width(iz)
c  L2 edge core width, eV
       integer iz, i
       double precision  dat(98)
       data dat /
     $      0.000,   0.000,   0.000,   0.000,   0.000,   0.000,
     $      0.000,   0.000,   0.000,   0.000,   0.000,   0.001,
     $      0.004,   0.015,   0.032,   0.054,   0.083,   0.126,
     $      0.152,   0.170,   0.190,   0.240,   0.260,   0.290,
     $      0.340,   0.370,   0.430,   0.520,   0.620,   0.720,
     $      0.830,   0.950,   1.030,   1.130,   1.210,   1.310,
     $      1.430,   1.540,   1.650,   1.780,   1.870,   1.970,
     $      2.080,   2.230,   2.350,   2.430,   2.570,   2.620,
     $      2.720,   2.840,   3.000,   3.120,   3.250,   3.400,
     $      3.510,   3.570,   3.680,   3.800,   3.890,   3.970,
     $      4.060,   4.150,   4.230,   4.320,   4.430,   4.550,
     $      4.660,   4.730,   4.790,   4.820,   4.920,   5.020,
     $      5.150,   5.330,   5.480,   5.590,   5.690,   5.860,
     $      6.000,   6.170,   6.320,   6.480,   6.670,   6.830,
     $      7.010,   7.200,   7.470,   7.680,   7.950,   8.180,
     $      8.750,   9.320,   9.320,   9.320,   9.320,   9.320,
     $      9.320,   9.320 /
       i = min(98,max(1,iz))
       at_l2width = dat(i)
       return
       end
       double precision function at_l3width(iz)
c  L3 edge core width, eV
       integer iz, i
       double precision  dat(98)
       data dat /
     $      0.000,   0.000,   0.000,   0.000,   0.000,   0.000,
     $      0.000,   0.000,   0.000,   0.000,   0.000,   0.001,
     $      0.004,   0.014,   0.033,   0.054,   0.087,   0.128,
     $      0.156,   0.170,   0.190,   0.220,   0.240,   0.270,
     $      0.320,   0.360,   0.430,   0.480,   0.560,   0.650,
     $      0.760,   0.820,   0.940,   1.000,   1.080,   1.170,
     $      1.270,   1.390,   1.500,   1.570,   1.660,   1.780,
     $      1.910,   2.000,   2.130,   2.250,   2.400,   2.500,
     $      2.650,   2.750,   2.870,   2.950,   3.080,   3.130,
     $      3.250,   3.320,   3.410,   3.480,   3.600,   3.650,
     $      3.750,   3.860,   3.910,   4.010,   4.120,   4.170,
     $      4.260,   4.350,   4.480,   4.600,   4.680,   4.800,
     $      4.880,   4.980,   5.040,   5.160,   5.250,   5.310,
     $      5.410,   5.500,   5.650,   5.810,   5.980,   6.130,
     $      6.290,   6.410,   6.650,   6.820,   6.980,   7.130,
     $      7.330,   7.430,   7.430,   7.430,   7.430,   7.430,
     $      7.430,   7.430 /
       i = min(98,max(1,iz))
       at_l3width = dat(i)
       return
       end
       double precision function at_fluor_line(iz,line)
c
c return energy of fluorescence line
       integer iz
       character*(*) line, lt*8
       double precision x, y, at_kedge, at_l1edge, at_l2edge
       double precision at_l3edge, at_m2edge
       double precision at_m3edge, at_m4edge, at_m5edge
       double precision at_n1edge, at_n2edge, at_n3edge
       double precision at_n4edge
       lt = line
       call lower(lt)
       at_fluor_line = 0
c
       if (lt(1:1) .eq. 'k') x = at_kedge(iz) 
       if (lt(1:1) .eq. 'l') x = at_l3edge(iz)
c
       if (lt.eq.'kalpha'     .or. lt.eq.'kalpha1') then
          y = at_l3edge(iz)
       elseif (lt.eq.'kbeta'  .or. lt.eq.'kbeta1') then
          y = at_m3edge(iz)
       elseif (lt.eq.'lalpha' .or. lt.eq.'lalpha1') then
          y = at_m5edge(iz)
       elseif (lt.eq.'lbeta'  .or. lt.eq.'lbeta1') then
          x = at_l2edge(iz)
          y = at_m4edge(iz)
       elseif (lt.eq.'lgamma' .or. lt.eq.'lgamma1') then
          x = at_l2edge(iz)
          y = at_n4edge(iz)
       elseif (lt.eq.'kalpha2') then
          y = at_l2edge(iz)
       elseif (lt.eq.'kalpha3') then
          y = at_l1edge(iz)
       elseif (lt.eq.'kbeta2') then
          y = at_n3edge(iz)
       elseif (lt.eq.'kbeta3') then
          y = at_m2edge(iz)
       elseif (lt.eq.'kbeta4') then
          y = at_n4edge(iz)
       elseif (lt.eq.'kbeta5') then
          y = at_m4edge(iz)
       elseif (lt.eq.'lalpha2') then
          y = at_m4edge(iz)
       elseif (lt.eq.'lbeta2') then
          y = at_n4edge(iz)
       elseif (lt.eq.'lbeta3') then
          x = at_l1edge(iz)
          y = at_m3edge(iz)
       elseif (lt.eq.'lbeta4') then
          x = at_l1edge(iz)
          y = at_m2edge(iz)
       elseif (lt.eq.'lbeta6') then
          y = at_n1edge(iz)
       elseif (lt.eq.'lgamma2') then
          x = at_l1edge(iz)
          y = at_n2edge(iz)
       elseif (lt.eq.'lgamma3') then
          x = at_l1edge(iz)
          y = at_n3edge(iz)
       endif
       if (x.gt.0 .and. y.gt.0) at_fluor_line = x - y
       return
       end
