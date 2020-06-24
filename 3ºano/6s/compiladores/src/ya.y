%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <math.h>
#include "apt.h"
#define TAMANHO_TABELA 256
#define NSYMS 20
    
int yylex (void);
void yyerror (char const *);
void prints123();

enum type_kind look(char *id);

void insertId(char *id, Type *type);
void insertIds(Ids *ids, Type *type);
enum type_kind lookid(Id *id);

%}
			
%union {

    char *string;
    int inteiro;
    float floatt;
    bool boleano;

    struct Ids *ids;
    struct IdsType *idstype;
    struct Exp *exp;
    struct Type *type;
    struct Decl *decl;
    struct Decl1 *decl1;
    struct Decls *decls;
    struct Corpo *corpo;
    struct Funcao *funcao;
    struct Mix *mix;
    struct Lits *lits;
    struct Lit *lit;
    struct Stats *stats;
    struct Stat *stat;
    struct Id *id;

}
			
/* Bison declarations.  */
%token <string> ID
%token <inteiro> INT_LIT
%token <boleano> BOOL_LIT
%token <floatt> FLOAT_LIT
%token <string> STRING_LIT
%token INT FLOAT BOOL VOID STRING
					
%token LPAR RPAR LPARR RPARR LCHAV RCHAV 
%left EQUAL LESSOREQUAL LESS DIFF GREATER GREATEROREQUAL

%token POINT
%token BREAK

%token WHILE
%token DO
%token NEXT

%left SUB ADD MUL DIV MOD AND OR NOT EXPOENT IF THEN ELSE DEFINE RETURN ENDOFSTM DOUBLEQUOTE COMMA ASSIGN
			
%type   <decls>         decls
%type   <decl>          decl
%type   <decl1>         decl1
%type   <ids>           ids
%type   <idstype>       idstype
%type   <type>          type
%type   <exp>           exp
%type   <corpo>         corpo
%type   <stats>         stats
%type   <stat>          stat
%type   <funcao>        funcao
%type   <mix>           mix
%type   <lits>          lits
%type   <lit>           lit
%type   <id>            id

%%

input:   /* empty */
        | decls       {prints123();printf("Declaração: program\n");}
;

decls:   decls decl      {$$ = new_decls($2, $1);printf("Declaração: decls-> decls decl\n");}
        | decl    {$$ = new_decls($1, NULL);printf("Declaração: decls-> decl\n");}
;

decl :    decl1 ENDOFSTM {$$ = new_decl($1);printf("Declaração: decl-> decl1\n");}
                    
;

idstype :   ID DOUBLEQUOTE type   
                {
                    $$ = new_idstype($1,$3,NULL, IDSTYPE_1);
                    printf("Declaração: idstype -> id:tipo\n");
                    insertId($1, $3);
                }               
            
            | ID DOUBLEQUOTE type COMMA idstype
                {
                    $$ = new_idstype($1,$3,$5, IDSTYPE_2);
                    printf("Declaração: idstype -> i:tipo, more\n");
                    insertId($1, $3);
                }

;

decl1:      ids DOUBLEQUOTE type           
                { 
                    $$ = new_decl1(NULL,NULL, $1,NULL, $3, NULL, NULL, DECL_1);
                    printf("Declaração:decl1 -> i,j:tipo\n");
                    insertIds($1, $3);
                }

            | ids DOUBLEQUOTE type ASSIGN exp 
                { 
                    $$ = new_decl1(NULL, NULL, $1, NULL, $3, $5, NULL, DECL_2);
                    printf("Declaração:decl1 -> i,j:tipo = exp\n");
                    insertIds($1, $3);
                }   

            |   ID LPAR  RPAR DOUBLEQUOTE type  LCHAV   corpo RCHAV   
                { 
                    $$ = new_decl1($1,NULL, NULL, NULL, $5, NULL, $7, DECL_3);
                    printf("Declaração:decl1 i(): tipo { corpo }\n");
                    insertId($1, $5);
                }   

            |   ID LPAR idstype RPAR  DOUBLEQUOTE type LCHAV corpo RCHAV 
                { 
                    $$ = new_decl1($1,NULL, NULL, $3, $6, NULL, $8, DECL_4);
                    printf("Declaração:decl1 i(i:tipo): tipo { corpo }\n");
                    insertId($1, $6);
                }      

            |  DEFINE ID ID
                { 
                    $$ = new_decl1($2, $3, NULL,  NULL, NULL,NULL, NULL, DECL_5);
                    printf("Declaração:decl1 define id id\n");
                }        

;

ids :      ID 
            {
                $$= new_ids($1, NULL, IDS_1);
                printf("Declaração:ids ->id\n");
            }

           | ID COMMA ids  
            {
                $$= new_ids($1, $3, IDS_2);
                printf("Declaração:ids   id, ids\n");
            }

;

id:     ID
            {
                $$ = new_id($1);
                printf("Declaração:id   id\n");
            }

;

type :        INT           
                {
                    $$ = new_type(NULL, 0, INT_);
                    printf("Declaração:type  int\n");
                }


            | FLOAT
                {
                    $$ = new_type(NULL, 0, FLOAT_);
                    printf("Declaração:type  float\n");
                }


            | BOOL
                {
                    $$ = new_type(NULL, 0, BOOL_);
                    printf("Declaração:type  bool\n");
                }


            | VOID
                {
                    $$ = new_type(NULL, 0, VOID_);
                    printf("Declaração:type  void\n");
                } 


            | STRING
                {
                    $$ = new_type(NULL, 0, STRING_);
                    printf("Declaração:type  string\n");
                }


            | type LPARR  exp   RPARR
                {
                    $$ = new_type($1, $3, ARRAY_);
                    printf("Declaração:type  array\n");
                }
;

exp:         LPAR exp RPAR
                {
                    $$ = new_exp($2, NULL, NULL,NULL,NULL,0,0,NULL,NULL, EXP_PAR);
                    printf("Declaração:exp -> (exp)\n");
                }



            |   id ASSIGN exp
                {
                    $$ = new_exp($3,NULL,$1,NULL,NULL, 0,0,NULL,NULL, EXP_ASSIGN);
                    printf("Declaração:exp -> id=exp\n");
                    lookid($1);

                } 


            |   funcao
                {
                    $$ = new_exp(NULL, NULL, NULL,$1,NULL,0,0,NULL,NULL, EXP_FUNC);
                    printf("Declaração:exp -> funcao\n");
                }


            |   exp ADD exp           
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_ADD);
                        printf("Declaração:exp -> exp add exp\n"); 
                    } 


            |   exp SUB exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_SUB);
                        printf("Declaração:exp -> exp sub exp\n");  
                    } 


            |   exp MUL exp 
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_MUL);
                        printf("Declaração:exp ->  exp mul exp\n");  
                    } 
                     

            |   exp DIV exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_DIV);
                        printf("Declaração:exp ->  exp div exp\n");  
                    } 
                     
   
            |   exp MOD exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_MOD);
                        printf("Declaração:exp ->  exp mod exp\n");  
                    } 
                     
    
            |   exp EXPOENT exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_EXPOENT);
                        printf("Declaração:exp -> exp expoente exp\n");  
                    } 
                     

            
  
            |   SUB exp
                    { 
                        $$ = new_exp($2, NULL, NULL,NULL,NULL,0,0,NULL,NULL, EXP_NEG);
                        printf("Declaração:exp -> negativo exp\n");  
                    } 


            



            | exp EQUAL exp     
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_EQUAL);
                        printf("Declaração:exp-> exp equal exp\n");  
                    } 


            |  exp DIFF exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_DIFF);
                        printf("Declaração:exp -> exp diff exp\n");   
                    }  


            |   exp AND exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_AND);
                        printf("Declaração:exp -> exp and exp\n");   
                    }


            |   exp OR exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_OR);
                        printf("Declaração:exp -> exp or exp\n");   
                    }  


            |   NOT exp  
                    { 
                        $$ = new_exp($2, NULL, NULL,NULL,NULL,0,0,NULL,NULL, EXP_NOT);
                        printf("Declaração:exp-> not exp\n");   
                    } 


            


            |   exp LESSOREQUAL exp   
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_LESSOREQUAL);
                        printf("Declaração:exp -> exp <= exp \n");   
                    } 


            |   exp LESS exp             
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_LESS);
                        printf("Declaração:exp -> exp < exp\n");    
                    } 


            |   exp GREATEROREQUAL exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_GREATEROREQUAL);
                        printf("Declaração:exp -> exp >= exp \n");   
                    } 


            |   exp GREATER exp
                    { 
                        $$ = new_exp($1, $3, NULL,NULL,NULL,0,0,NULL,NULL, EXP_GREATER); 
                        printf("Declaração:exp -> exp > exp\n");   
                    }




            |   id 
                {
                    $$ = new_exp(NULL, NULL, $1,NULL,NULL,0,0,NULL,NULL, EXP_ID);
                    printf("Declaração:exp -> id\n"); 
                    lookid($1);
                }


            |   BOOL_LIT  
                    { 
                        $$ = new_exp(NULL, NULL, NULL,NULL,NULL,0,0,$1,NULL, EXP_BOOL_LIT);
                        printf("Declaração:exp -> boolliteral\n");  
                    }

            |   INT_LIT 
                    { 
                        $$ = new_exp(NULL, NULL, NULL,NULL,NULL,$1,0,NULL,NULL, EXP_INT_LIT);
                        printf("Declaração:exp -> intliteral\n"); 
                    }   


            |   FLOAT_LIT   
                    { 
                        $$ = new_exp(NULL, NULL, NULL,NULL,NULL,0,$1,NULL,NULL, EXP_FLOAT_LIT);
                        printf("Declaração:exp -> floatliteral\n"); 
                    }


            |   STRING_LIT     
                    { 
                        $$ = new_exp(NULL, NULL, NULL,NULL,NULL,0,0,NULL,$1, EXP_STRING_LIT);
                        printf("Declaração:exp -> stringliteral\n");
                    } 

            |   type LPARR exp RPARR
                    {
                        $$ = new_exp($3, NULL, NULL,NULL,$1,0,0,NULL,NULL, EXP_ARRAY_LIT);
                        printf("Declaração:exp -> array\n");
                    } 

;

funcao:     ID LPAR funcao RPAR
                {
                    $$ = new_funcao($1, $3,NULL,NULL, FUNC_FUNC);
                    printf("Declaração:funcao  id(funcao)\n");
                }


            | ID LPAR mix RPAR
                {
                    $$ = new_funcao($1, NULL, $3,NULL, FUNC_MIX);
                    printf("Declaração:funcao  id(mix)\n");
                }   

            | ID LPAR idstype RPAR
                {
                    $$ = new_funcao($1, NULL, NULL, $3, FUNC_IDSTYPE);
                    printf("Declaração:funcao  id(mix)\n");
                }  

;

mix:    lits
            {
                $$ = new_mix($1, NULL, LITS_);
                printf("Declaração:mix  lits\n");
            }
 

        | ids
            {
                $$ = new_mix(NULL, $1, IDS_);
                printf("Declaração:mix  ids\n");
            }


;

lits:   lit
            {
                $$ = new_lits($1, NULL, LIT_);
                printf("Declaração:lits  lit\n");
            }


        | lit COMMA lits
            {
                $$ = new_lits($1, $3, LIT_LITS);
                printf("Declaração:lits  lit,lits\n");
            }


;

lit:    INT_LIT
            {
                $$ = new_lit(NULL, $1, false, 0, "",NULL, INT_LITE);
                printf("Declaração:lit  intliteral\n");
            }


        | BOOL_LIT
            {
                $$ = new_lit(NULL, 0, $1, 0, "", NULL,BOOL_LITE);
                printf("Declaração:lit  boolliteral\n");
            }


        | FLOAT_LIT
            {
                $$ = new_lit(NULL, 0, false,$1, "",NULL, FLOAT_LITE);
                printf("Declaração:lit  floatliteral\n");
            }


        | STRING_LIT
            {
                $$ = new_lit(NULL, 0, false, 0, $1,NULL, STRING_LITE);
                printf("Declaração:lit  stringliteral\n");
            }


        | type LPARR exp RPARR
            {
                $$ = new_lit($1, 0, false, 0, "", $3, ARRAY_LITE);
                printf("Declaração:lit  arrayliteral\n");
            } 

;

corpo:    stats { $$ = new_corpo($1);
                        printf("Declaração:corpo->  stats\n");} 
;

stats:    stat stats    {$$ = new_stats($1, $2, STAT_STATS);
                        printf("Declaração:stats-> stat stats\n");}
        
        |  stat           {$$ = new_stats($1, NULL, STAT_);
                          printf("Declaração:stats-> stat\n");}

;

stat:   decl
            {
                $$ = new_stat($1, NULL, NULL,NULL, STAT_DECL);
                printf("Declaração:stat-> decl\n");
            }
        
        | exp  ENDOFSTM 
            {
                $$ = new_stat(NULL, $1, NULL,NULL, STAT_EXP);
                printf("Declaração:stat-> exp\n");
            }
        
        | RETURN exp  ENDOFSTM 
            {
                $$ = new_stat(NULL, $2, NULL,NULL, STAT_RETURN);
                printf("Declaração:stat-> return exp\n");
            }

        | IF exp  THEN  LCHAV  corpo RCHAV  ENDOFSTM 
            {
                $$ = new_stat(NULL,$2, $5,NULL, STAT_IF);
                printf("Declaração:stat-> if expbool then corpo\n");
            }

        | IF exp  THEN  LCHAV  corpo   RCHAV  ELSE  LCHAV  corpo  RCHAV  ENDOFSTM 
            {
                $$ = new_stat(NULL, $2, $5,$9, STAT_IF_ELSE);
                printf("Declaração:stat-> if expbool then corpo else corpo\n");
            }

        | WHILE exp DO  LCHAV  corpo RCHAV   ENDOFSTM 
            {
                $$ = new_stat(NULL, $2, $5,NULL, STAT_WHILE);
                printf("Declaração:stat-> while expbool corpo\n");
            }

        | BREAK  ENDOFSTM 
            {
                $$ = new_stat(NULL, NULL, NULL,NULL, STAT_BREAK);
                printf("Declaração:stat-> break\n");
            }

        | NEXT  ENDOFSTM 
            {
                $$ = new_stat(NULL, NULL, NULL,NULL, STAT_NEXT);
                printf("Declaração:stat-> next\n");
            }

;

%%

struct valor{

    char *nomeId;
    enum type_kind tipo;

};

struct valor TABELA[256];  /* 256 vars seems enough... */
int CURR = 0;

void insertId(char *id, Type *type){



    TABELA[CURR].nomeId = strdup(id);

    TABELA[CURR].tipo = type->kind;

    CURR++;

}

void insertid(Id *id, Type *type){

    char *nomeId = id->nome;

    TABELA[CURR].nomeId = strdup(nomeId);

    TABELA[CURR].tipo = type->kind;

    CURR++;


}

void insertIds(Ids *ids, Type *type){

    Ids *novo = ids;
    while(novo!= NULL){
        insertId(novo->nome, type);
        if(novo->ids != NULL){
            novo = novo->ids;
        }
        else{
            break;
        }
        
    }
}

enum type_kind look(char *id){

    int i;
    for(i = 0; i < CURR; i++){
        if (strcmp(id, TABELA[i].nomeId) == 0) {
            return TABELA[i].tipo;
        }
    }  
    return -1 ; 
   
}

enum type_kind lookid(Id *id){

    char *nome = id->nome;
    int i;
    for(i = 0; i < CURR; i++){
        if (strcmp(nome, TABELA[i].nomeId) == 0) {
            return TABELA[i].tipo;
        }
    }  
    return -1 ; 
   
}

void prints123(){
    printf("\n\nSYMBOL TABLE:\n\n");
    int i;
    for (i=0; i< CURR; i++){
        printf("%10s  ", TABELA[i].nomeId);
        if(TABELA[i].tipo == 0){
            printf("INT\n");
        }
        else if(TABELA[i].tipo == 1){
            printf("FLOAT\n");
        }
        else if(TABELA[i].tipo == 2){
            printf("STRING\n");
        }
        else if(TABELA[i].tipo == 3){
            printf("BOOL\n");
        }
        else if(TABELA[i].tipo == 4){
            printf("ARRAY\n");
        }
        else if(TABELA[i].tipo == 5){
            printf("VOID\n");
        }
    }
    printf("--------------------\n\n");

}

void yyerror (char const *s)
{
  fprintf (stderr, "%s\n", s);
}

int main (void)
{

  return yyparse();
}