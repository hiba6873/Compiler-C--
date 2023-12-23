%%

letter = [a-zA-Z]
digit = [0-9]
underbar = _
letdig = {digit}|{letter}|{underbar}
ID = {letter}{letdig}*
NUM = {digit}+


%%


<YYINITIAL> {

    /* Keywords */

    "declList"         { return symbol(sym.DECLLIST); }
    "declList + decl | decl"              { return symbol(sym.DECLLIST); }
    "varDecl | funDecl"              { return symbol(sym.DECL); }
    "typeSpec + varDeclList"              { return symbol(sym.VARDECL); }
    "varDecllist  varDeclid | varDeclid"               { return symbol(sym.VARDECLLIST); }
    "{{ID}| {ID}+{NUM}}"               { return symbol(sym.VARDECLID); }
    "{int}|{void}|{bool}"                { return symbol(sym.TYPESPEC); }
    "paramlist | e"                { return symbol(sym.PARAM); }
    "{ID} | {ID[]}"                { return symbol(sym.PARAMID); }
    " localDecls varDecl | e"                 { return symbol(sym.LOCALDECLS); }
    "this"                  { return symbol(sym.THIS); }
    
    "expression ; | ;"                  { return symbol(sym.EXPRESSIONSTMT); }
    "return ; | return expression ;"                 { return symbol(sym.RETURNSTMT); }
    "{ID} | {ID [ expression ]} | * {ID}"                  { return symbol(sym.VAR); }
    "<= | < | > | >= | == | ! ="                 { return symbol(sym.RELOP); }
    "NUM | true | false"                  { return symbol(sym.CONST); }
    "{ID ( args )}"                  { return symbol(sym.Call); }
    "argList | e"              { return symbol(sym.ARGS); }
    " argList ; expression | expression"                    { return symbol(sym.ARGLIST); }
    
    /* Access modifiers */
    
    "protected"             { return symbol(sym.PROTECTED); }
    "public"                { return symbol(sym.PUBLIC); }

    /* Literals */

    "false"                 { return symbol(sym.FALSE, new String(yytext())); }
    "true"                  { return symbol(sym.TRUE, new String(yytext())); }
    "null"                  { return symbol(sym.NULLPTR); }

    /* Class Definition */

    "struct"                { return symbol(sym.STRUCT); }
    "class"                 { return symbol(sym.CLASS); }
    "union"                 { return symbol(sym.UNION); }

    /* Virt Specifiers */

    "explicit"              { return symbol(sym.EXPLICIT); }
    "final"                 { return symbol(sym.FINAL); }

    /* Qualifiers */

    "volatile"              { return symbol(sym.VOLATILE); }
    "const"                 { return symbol(sym.CONST); }

    /* Unary Operators */

    "!"                     { return symbol(sym.LOGNEGATION); }
    "++"                    { return symbol(sym.AUTOINCRM); }
    "--"                    { return symbol(sym.AUTODECRM); }
    "~"                     { return symbol(sym.BINNEG); }

    /* Assignment */

    ">>="                   { return symbol(sym.RSHIFTASSIGN, new String(yytext())); }
    "<<="                   { return symbol(sym.LSHIFTASSIGN, new String(yytext())); }
    "-="                    { return symbol(sym.MINUSASSIGN, new String(yytext())); }
    "="                     { return symbol(sym.ASSIGNMENT, new String(yytext())); }
    "+="                    { return symbol(sym.PLUSASSIGN, new String(yytext())); }
    "*="                    { return symbol(sym.MULTASSIGN); }
    "/="                    { return symbol(sym.DIVASSIGN); }
    "%="                    { return symbol(sym.MODASSIGN); }
    "&="                    { return symbol(sym.ANDASSIGN); }
    "^="                    { return symbol(sym.XORASSIGN); }
    "|="                    { return symbol(sym.ORASSIGN); }

    /* PM Operators */

    "->*"                   { return symbol(sym.ARROWSTAR); }
    ".*"                    { return symbol(sym.DOTSTAR); }

    /* Shift Operators */

    "<<"                    { return symbol(sym.LSHIFT); }
    ">>"                    { return symbol(sym.RSHIFT); }

    /* Relational and Logical Operators */

    "^"                     { return symbol(sym.XOROP, new String(yytext())); }
    "||"                    { return symbol(sym.OROP, new String(yytext())); }
    "|"                     { return symbol(sym.SOROP, new String(yytext())); }
    "!="                    { return symbol(sym.NEQOP, new String(yytext())); }
    "=="                    { return symbol(sym.EQOP, new String(yytext())); }
    "<="                    { return symbol(sym.LTE, new String(yytext())); }
    ">="                    { return symbol(sym.GTE, new String(yytext())); }
    "<"                     { return symbol(sym.LT, new String(yytext())); }
    ">"                     { return symbol(sym.GT, new String(yytext())); }

    /* Arithmetic Operators */

    "-"                     { return symbol(sym.MINUSOP); }
    "+"                     { return symbol(sym.PLUSOP); }
    "/"                     { return symbol(sym.DIVOP); }
    "%"                     { return symbol(sym.MODOP); }

    /* Overloaded Lexemes */

    "&&"                    { return symbol(sym.DOUBLEAND); }
    "&"                     { return symbol(sym.SINGLEAND); }
    "*"                     { return symbol(sym.STAR); }

    /* Separators */

    ";"                     { return symbol(sym.SEMICOLON, new String(yytext())); }
    "?"                     { return symbol(sym.QUESTION); }
    "["                     { return symbol(sym.LSQRBRK); }
    "]"                     { return symbol(sym.RSQRBRK); }
    "::"                    { return symbol(sym.SEPPTR); }
    ","                     { return symbol(sym.COMMA); }
    "->"                    { return symbol(sym.ARROW); }
    ":"                     { return symbol(sym.COLON); }
    "}"                     { return symbol(sym.RBRK, new String(yytext())); }
    "{"                     { return symbol(sym.LBRK, new String(yytext())); }
    "("                     { return symbol(sym.LPAR, new String(yytext())); }
    ")"                     { return symbol(sym.RPAR, new String(yytext())); }
    "."                     { return symbol(sym.DOT, new String(yytext())); }

 
 

    {BlankSpace}            { /* skip it */ }
    {Comments}              { /* skip it */ }



}


 %%