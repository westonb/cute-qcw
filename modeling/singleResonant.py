#python3
from scipy import signal
import matplotlib.pyplot as plt
import numpy as np

#parameters
R = 1.0
C = 10E-9
L = 15.8E-6

sys = signal.lti([1,0],[L, R, 1/C])

t = np.linspace(0, 5E-4, 10000)
u = np.ones_like(t)
tout, y, x = signal.lsim(sys, u, t)
plt.plot(t, y)
plt.show()

#w, mag, phase = sys.bode()

#plt.figure()
#plt.semilogx(w, mag)    # Bode magnitude plot
#plt.figure()
#plt.semilogx(w, phase)  # Bode phase plot
#plt.show()