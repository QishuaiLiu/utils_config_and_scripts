import os
import sys

def concatenate_compile_commands_file():
    workspace_path = os.popen('catkin locate --workspace $(pwd)').read().rstrip()

    if not workspace_path:
        sys.exit("\033[1;31mNo workspace found in the currrernt directory \033[0m")

    # ccjson_path = workspace_path + '/compile_commands.json'
    target_ccjson_path = workspace_path + '/build' + '/compile_commands.json'

    # for i in [ccjson_path, target_ccjson_path]:
    #     if os.path.isfile(i):
    #         os.system('rm %s' % i)
    #         print('remove previous compile_commands.json located at %s' % i)
    if os.path.isfile(target_ccjson_path):
        os.system('rm %s' % target_ccjson_path)
        print('remove previous compile_commands.json')
    
    file_path = []
    for root, dirs, files in os.walk(workspace_path + '/build'):
        for dir in dirs:
            for dir_root, dir_dirs, dir_files in os.walk(dir):
                for f in dir_files:
                    if f.endswith('compile_commands.json'):
                        file_path.append(dir)

    for file in file_path:
        print(file)

    print('get all file name finished...........')

    # concatenate the content of the files in each directory and write the merged content
    # into a file with the same name at the top directory

    f = 'compile_commands.json'
    txt = []
    for i in range(len(file_path)):
        if i == 0:
            with open(os.path.join(file_path[i], f)) as f2:
                txt.append('['+f2.read()[1:-2]+',')
            print(file_path[i])
        elif (i != len(file_path) - 1):
            with open(os.path.join(file_path[i], f)) as f2:
                txt.append(f2.read()[1:-2]+',')
            print(file_path[i])
        else:
            with open(os.path.join(file_path[i], f)) as f2:
                txt.append(f2.read()[1:-1]+']')
            with open(target_ccjson_path, 'w') as f3:
                f3.write(''.join(txt))    

    print('add all file content into a single file....')
    
    if not os.path.isfile(target_ccjson_path):
        os.system('mv ./compile_commands.json %s' % (target_ccjson_path))

    print("\033[1;32mFinished writing compile_commands.json\033[0m")



if __name__ == '__main__':
    concatenate_compile_commands_file()
    
