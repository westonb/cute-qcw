import pickle 
import matplotlib.pyplot as plt

with open('waves.pkl', 'rb') as f:
	time, current, voltage = pickle.load(f)

plt.figure()
plt.plot(time, voltage, time, current)
plt.show()