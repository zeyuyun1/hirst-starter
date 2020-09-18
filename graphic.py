import numpy as np
from scipy.ndimage.filters import gaussian_filter1d
from PIL import Image
import matplotlib.pyplot as plt
import argparse

def optimization(dir,p,sigma,learning_rate=25,num_iterations=600):
    x = np.random.randn(224,224,3)
    n=0
    for t in range(num_iterations):
        x += learning_rate*(np.abs(x)**(p-1))*np.sign(x)*((np.sum(np.abs(x)**p))**(1/p-1))
        
        if t%25== 0:
            x = gaussian_filter1d(x, sigma, axis=0)
            x = gaussian_filter1d(x, sigma, axis=1)
        
        if t == 0 or (t + 1) % 10 == 0 or t == num_iterations - 1:
            to_show = Image.fromarray((x*255).astype(np.uint8))
            to_show.save(dir+"{}.bmp".format(n))
            # plt.imshow(to_show)
            # plt.gcf().set_size_inches(4, 4)
            # plt.axis('off')
            # plt.show()
            n+=1
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('dir',help="directory of where you wnat to save the image")
    parser.add_argument('--p', default=2, help="lp norm that will be used")
    parser.add_argument('--sigma', default=0.5, help="std for guassian filtering")
    parser.add_argument('--learning_rate',default=25, help="learning rate for gradient ascend")
    parser.add_argument('--num_interations',default=600)
    args = parser.parse_args()
    dir,p,simga,learning_rate,num_iterations= args.dir,args.p,args.sigma,args.learning_rate,args.num_interations
    optimization(dir,p,simga,learning_rate=learning_rate,num_iterations=num_iterations)
if __name__ == "__main__":
    main()