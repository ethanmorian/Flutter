while True:
    p = input()
    if p == '0':
        break
    elif p == p[::-1]:
        print('yes')
    else:
        print('no')