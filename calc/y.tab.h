/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     VARIABLE = 258,
     ASSIGN = 259,
     INTEGER = 260,
     NEWLINE = 261,
     HEX = 262,
     LPAREN = 263,
     RPAREN = 264,
     MIN = 265,
     MAX = 266,
     AVG = 267,
     COMMA = 268,
     IF = 269,
     ELSE = 270,
     MOD = 271,
     MINUS = 272,
     PLUS = 273,
     DIVIDE = 274,
     TIMES = 275,
     LESS = 276,
     LESS_EQUAL = 277,
     EQUAL = 278,
     GR_EQUAL = 279,
     GREATER = 280
   };
#endif
/* Tokens.  */
#define VARIABLE 258
#define ASSIGN 259
#define INTEGER 260
#define NEWLINE 261
#define HEX 262
#define LPAREN 263
#define RPAREN 264
#define MIN 265
#define MAX 266
#define AVG 267
#define COMMA 268
#define IF 269
#define ELSE 270
#define MOD 271
#define MINUS 272
#define PLUS 273
#define DIVIDE 274
#define TIMES 275
#define LESS 276
#define LESS_EQUAL 277
#define EQUAL 278
#define GR_EQUAL 279
#define GREATER 280




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

