import ply.yacc as yacc
import aslex
import sys

tokens = aslex.tokens

precedence = (
		('left', 'NOTEQ'),
    ('left', '+' , '-'),
    ('left', '*' , '/','%'),
    ('left', '>' , '<')
)

def p_stmt_multi(p):
    '''stmt : stmt stmt '''
    p[0] = ('stmt_multi', p[1], p[2])

def p_stmt(p):
	'''stmt : assignExp "."
			| arrayExp "."
			| showExp "."
			| cmpExp "."
			| loopExp "." '''
	p[0] = p[1]

def p_assignExp(p):
	'assignExp : IDENTIFIER ASSIGN exp'
	p[0] = ("assign", p[1], p[3])

def p_assignExp_const(p):
	'assignExp : t_CONSTANT IDENTIFIER ASSIGN exp'
	p[0] = ("const_assign", p[2], p[4])

#maybe changes need
def p_arrayExp(p):
	'arrayExp : ARRAY IDENTIFIER ASSIGN "[" member "]"'
	p[0] = ("array", p[2],p[5])

def p_member(p):
	'''member : CONSTANT member2'''
	p[0] = ('member',p[1],p[2])

def p_member2(p): 
	'''member2 : "," CONSTANT member2
							| empty empty empty'''
	p[0] = ('member',p[2],p[3])

def p_loopExp(p):
	'loopExp : LOOP assignL stmt FINISH'
	p[0] = ("loop", p[2], p[3])

def p_assignExp_loop(p):
	'assignL : IDENTIFIER ASSIGN expL'
	p[0] = ('lp',p[1],p[3])

def p_expression_loop(p):
    'expL : "(" CONSTANT "," CONSTANT "," exp ")"'
    p[0] = (p[2], p[4], p[6])

def p_cmpExp(p):
	'cmpExp : CMP cond "{" stmt "}" '
	p[0] = ('cmp', p[2], p[4])

def p_val(p):
	'''val : IDENTIFIER 
			| CONSTANT
			| array_val'''
	p[0] = p[1]

def p_val_arr(p):
	'''array_val : IDENTIFIER "[" CONSTANT "]"
				| IDENTIFIER "[" IDENTIFIER "]"'''
	p[0] = ('array_val',p[1],p[3])

def p_exp_val(p):
	'exp : val'
	p[0] = p[1]

def p_showExp(p):
	'''showExp : SHOW CONSTANT 
			 | SHOW IDENTIFIER
			 | SHOW STRING'''
	p[0] = ("show", p[2])

def p_cond_less(p):
	'cond : exp "<" exp'
	p[0] = ('<', p[1], p[3])

def p_cond_more(p):
	'cond : exp ">" exp'
	p[0] = ('>', p[1], p[3])

def p_cond_eq(p):
	'cond : exp "=" exp'
	p[0] = ('=', p[1], p[3])

def p_cond_noteq(p):
	'cond : exp NOTEQ exp'
	p[0] = ('!=', p[1], p[3])

def p_exp_normal(p):
	'''exp : exp "+" exp
			| exp "-" exp
			| exp "/" exp
			| exp "*" exp
			| exp "%" exp
			| exp "+" val
			| exp "-" val
			| exp "/" val
			| exp "*" val
			| exp "%" val
			| val "+" val
			| val "-" val
			| val "/" val
			| val "*" val
			| val "%" val'''
	p[0] = (p[2], p[1], p[3])
  
def p_exp_minus(p):
	'exp : "-" exp'
	p[0] = ('minus', p[2])

def p_exp_bracket(p):
	'exp : "(" exp ")"'
	p[0] = p[2]

def p_empty(p):
    'empty :'
    pass

def p_error(p):
    if p:
        if p.value == '\n':
            print("Syntax error at line %d" % p.lineno)
        else:
            print("Syntax error at '%s' at line %d" %
                  (p.value,p.lineno))
    else:
        print("Syntax error at EOF")
    sys.exit(1)


parser = yacc.yacc()


def parse(s, debug=False):
    return parser.parse(s, tracking=True, debug=debug)