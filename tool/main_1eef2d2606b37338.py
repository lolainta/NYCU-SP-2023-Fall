#!/usr/bin/env python3

import time
from timeit import timeit
import random
import hashlib
import re
import sys
import signal

from secret import *
sys.setrecursionlimit(10010)


def get_evidence(data: str):
    r = str(random.randint(0, 2**32 - 1))
    h = hashlib.sha256(f'{r}||{data}||{secretkey}'.encode()).hexdigest()
    return f'{r}||{data}||{h}'


def handler(signum, frame):
    raise TimeoutError

signal.signal(signal.SIGALRM, handler)


def test_slow(func, *args, flag):
    try:
        measure = timeit(lambda: hashlib.md5(str(random.randint(0, 2**24)).encode()), number=10000)
        wait = measure * 80
        signal.alarm(int(wait))
        ret = func(*args)
        time.sleep(wait % 1)
        signal.alarm(0)
    except TimeoutError:
        print(f'Good for you! The flag is {flag}')
        exit()

    return ret


def proof_of_work():
    r = random.randint(0, 2**24 - 1)
    h = hashlib.md5(f'{r}'.encode()).hexdigest()[0:8]
    print(f'give me `i` such that md5(i)[0:8] == "{h}" : ', end='')
    i = input()
    if hashlib.md5(f'{i}'.encode()).hexdigest()[0:8] != h:
        print('nope')
        exit()


def menu():
    print('-------------------------------------------------')
    print('|   Welcome to my service! I am Sophia. Working |')
    print('| is my favorite things to do. You should work  |')
    print('| hard to catch up with me. I mean, work very,  |')
    print('| very hard.                                    |')
    print("|   Hurry up! I don't have any time to waste on |")
    print('| you!                                          |')
    print('|                                               |')
    print('|  1) the funniest and quickest sorting service |')
    print('|  2) send your love letter to me               |')
    print('|  3) doing work is my favorite pasttime <3     |')
    print('-------------------------------------------------')


def happy_qsort():
    def qsort(arr: list):
        n = len(arr)
        if n == 0:
            return arr
        pivot = arr[n // 2]
        l = [ i for i in arr if i < pivot ]
        g = [ i for i in arr if i > pivot ]
        cnt = arr.count(pivot)
        return qsort(l) + [pivot] * cnt + qsort(g)

    print('Give me the array to be sorted (blank separated) : ', end='')
    s = input()
    try:
        assert len(s) < 35000 # need tuning
        arr = [ int(i) for i in s.split() ]
    except:
        print('bad')
        exit()
    ret = test_slow(qsort, arr, flag=flag)
    print(f'Here is the sorted array: {ret}')


def marvelous_regex():
    print('What do you want to tell Sophia?')
    print('format: "Dear Sophia, `blahblahblah`. Best wishes, `yourname`."')
    print(': ', end='')
    s = input()
    if len(s) > 1000:
        print('Sophia has no time to read such long letter!')
        exit()
    pattern = re.compile(r'^Dear Sophia, (.*柴魚){10,15}.*\. Best wishes, ([a-zA-Z0-9]+ ?)+\.$')
    if test_slow(pattern.match, s, flag=flag):
        print('Okay, got your message. But Sophia fed her 柴魚 with your letter QQ')
    else:
        print('You don\'t even know how to write a letter!')


def want_more_POW():
    n = 10
    rate = n / timeit(proof_of_work, number=n)
    rate_str = str(rate)
    print(f'Wow! You can finish {rate_str} POWs per second!')
    print(f'Here is the certificate: {get_evidence(rate_str)}')
    if rate > 150:
        print(f'Good for you! The flag is {flag}')


def main():
    try:
        proof_of_work()
        menu()
        op = input('your choice: ')
        if op == '1':
            happy_qsort()
        elif op == '2':
            marvelous_regex()
        elif op == '3':
            want_more_POW()
        else:
            print('bye~')
    except EOFError:
        pass


if __name__ == '__main__':
    main()
