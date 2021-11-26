prog : parser.class test1

	java parser < test1

parser.class : parser.java sym.java Yylex.java

	javac parser.java sym.java Yylex.java

parser.java : exo4.cup

	cup exo4.cup

sym.java : exo4.cup

	cup exo4.cup

Yylex.java : exo4.lex

	jflex exo4.lex

clean :

	rm -rf *.class *.java
