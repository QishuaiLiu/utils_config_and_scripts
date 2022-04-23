import matplotlib.pyplot as plt
from matplotlib.pyplot import MultipleLocator
import sys


def get_usage(file_name, cpuid = 2):
    with open(file_name, 'r') as f:
        cpu_usage = []
        lists = f.readlines()
        string = 'CPU' + str(cpuid) + ':'
        print(string)
        for line in lists:
            if string in line:
                line_list = line.split()
                cpu_usage.append(float(line_list[1].strip('%')))
    #     for i in range(len(cpu_usage)):
    #         print(cpu_usage[i])
    #     x_value = list(range(len(cpu_usage)))
    #     y_value = cpu_usage


    return cpu_usage

if __name__ == '__main__':
    
    if len(sys.argv) < 2:
        print("usage: python3 cpu_usage.py file_name")
        sys.exit()
    cpu_usage_list = get_usage(sys.argv[1], sys.argv[2])

#     plt.xlim(0, len(cpu_usage))
#     plt.ylim(0, 100)
    x_locator = MultipleLocator(1)
    y_locator = MultipleLocator(5)

    ax = plt.gca()
    ax.xaxis.set_major_locator(x_locator)
    ax.yaxis.set_major_locator(y_locator)
    plt.xticks(range(0,len(cpu_usage_list)+1, 6))
    
    plt.plot(cpu_usage_list, ls='-', c='r', marker='o')
    plt.xlabel('times')
    plt.ylabel('cpu' + sys.argv[2] +'  usage( %)')
    plt.tight_layout()
    plt.show()
