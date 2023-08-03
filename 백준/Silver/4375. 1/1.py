while True:
    try:
        a = input()

        if a == "q":
            break

        b = str("1")
        while True:
            c = int(b) % int(a)
            if c == 0:
                print(len(b))
                break
            b += "1"
    except:
        break
