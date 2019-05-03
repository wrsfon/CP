import ply.lex as lex

tokens = ['IDENTIFIER','STRING','CONSTANT','ASSIGN','NOTEQ']

reserved = {
  'array':'ARRAY',
  'cmp':'CMP',
  'show':'SHOW',
  'loop':'LOOP',
  'fin':'FINISH',
  'const':'t_CONSTANT'
}

tokens += reserved.values()

t_ignore = ' \t\v\f'
t_ASSIGN = r'->'
t_NOTEQ = r'!='
t_STRING = r'\"(\\.|[^"\\])*\"'


literals = ['+','-','*','/','%','<','>','(',')',
            '{','}','[',']','.',',','=']

def t_COMMENT(t):
     r'//.*'
     pass

def t_IDENTIFIER(t):
    r'[a-zA-Z_][a-zA-Z0-9_]*'
    if t.value in reserved:
        t.type = reserved[t.value]
    return t


def t_error(t):
    # print('Illegal character')
    t.lexer.skip(1)


def t_NEWLINE(t):
    r'\n+'
    t.lexer.lineno += len(t.value)
    pass


def t_CONSTANT(t):
    r'0[xX][0-9a-fA-F]+|[0-9]+'
    if t.value[:2] == '0x':
        t.value = str(int(t.value.replace('0h', '0x'), 16))
    t.type = 'CONSTANT'
    return t


lexer = lex.lex()