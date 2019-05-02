import aslex
# try:
#     lines = open('test.bcc', 'r').read()
#     bcclex.lexer.input(lines)
#     token = bcclex.lexer.token()
#     while token != None:
#         print(token)
#         token = bcclex.lexer.token()
# except:
#     pass
while True:
    try:
        line = input("[cmd] : ")
    except EOFError:
        raise SystemExit
    aslex.lexer.input(line + '\n')
    token = aslex.lexer.token()
    while token != None:
        print(token)
        token = aslex.lexer.token()