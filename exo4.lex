import java_cup.runtime.Symbol;
%%
%unicode
%cup
%line
%column

%{
    /** Creates a new {@link Symbol} of the given type. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    /** Creates a new {@link Symbol} of the given type and value. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    
    public int getYyLine(){
		return yyline+1;
	}
	public int getYyColumn(){
		return yycolumn+1;
	}
	public String getYyText(){
		return yytext();
	}
%}

Idente = [a-zA-Z]*
Identb = "@"[a-zA-Z]*

erreur_idente = [0-9]*







%%
vrai {return new Symbol(sym.VRAI,yytext());}
faux {return new Symbol(sym.FAUX,yytext());}
et {return new Symbol(sym.ET,yytext());}
ou {return new Symbol(sym.OU,yytext());}
non {return new Symbol(sym.NON,yytext()) ;}
PRINT {return new Symbol(sym.PRINT);}
"+" { return new Symbol(sym.PLUS,yytext());}
"*" {return new Symbol(sym.MULT,yytext());}
"(" {return new Symbol(sym.LPAR);}
")" {return new Symbol(sym.RPAR);}
[0-9]+ {return new Symbol(sym.NB,Integer.valueOf(yytext()));}
{Idente} {return new Symbol(sym.VARE,yytext());}
{Identb} {return new Symbol(sym.VARB,yytext());}
"=" {return new Symbol(sym.AFF);}
"<" {return new Symbol(sym.INF);}
"==" {return new Symbol(sym.EGAL);}

[ \t\r\f\n] {}
// qqs exemples de règles de détection d'erreurs lexicales...
{erreur_idente} { System.out.println(" Erreur ligne "+(yyline+1)+" colonne "+(yycolumn+1)+" : "+yytext()+" => syntaxe identificateur non respectee ! "); }
. { System.out.println(" Erreur ligne "+(yyline+1)+" colonne "+(yycolumn+1)+" : "+yytext()+" => Symbol n'appartenant pas au language ! "); } 

