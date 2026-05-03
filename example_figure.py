import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure(figsize=(5, 4))
ax = fig.add_axes([0.15, 0.15, 0.8, 0.75])

fig.suptitle("Simple Sinusoidal Functions", fontsize=16, y=0.98)
ax.set_xlabel("x", fontsize=14, labelpad=2)
ax.set_ylabel("y", fontsize=14)

x = np.linspace(-1.5*np.pi, 1.5*np.pi, 200)
sin = np.sin(x)
cos = np.cos(x)

ax.plot(x, sin, label=r"$\sin x$", color="tab:blue")
ax.plot(x, cos, label=r"$\cos x$", color="tab:red")
ax.legend(fontsize=14)

xticks = np.linspace(-1.5, 1.5, 7) * np.pi
xticklabels = [r"$-\frac{3\pi}{2}$", r"$-\pi$", r"$-\frac{\pi}{2}$", r"$0$", r"$\frac{\pi}{2}$", r"$\pi$", r"$\frac{3\pi}{2}$"]
yticks = [-1, -0.5, 0, 0.5, 1]
ax.set_xticks(xticks, xticklabels, fontsize=12)
ax.set_yticks(yticks, labels=yticks, fontsize=12)

plt.savefig("example_figure_matplotlib.pdf")
