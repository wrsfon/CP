import asbison

lines = open('test.x', 'r').read()

print(asbison.parse(lines, debug=True))

while True:
    try:
        s = input('[cmd] :')
    except EOFError:
        break
    if not s:
        continue
    result = asbison.parse(s, debug=True)
    print(result)
