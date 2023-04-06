import random
import sys
import os

max_val = int(sys.argv[1])
max_student_count = int(sys.argv[2])

def generate_set():
    # if os.path.exists('marks/'):
    #     os.removedirs('marks/')

    os.makedirs('marks/')

    with open('./courses.txt', 'w') as f:
        for i in range(1, max_val+1):
            course_name = f'CSE{1000+i}'
            f.write(f"{course_name}\n")

            with open(f'marks/{course_name}.csv', 'w') as f1:
                f1.write('Student ID,Marks\n')
                for stu_id in range(10_000, max_student_count+10_000):
                    marks = random.randint(0, 100)
                    f1.write(f'{stu_id},{marks}\n')

    


if __name__ == "__main__":
    generate_set()
        