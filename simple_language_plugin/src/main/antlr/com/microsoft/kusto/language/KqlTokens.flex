/* KqlTokens.flex - generated from KqlTokens.g4, all tokens, keywords, and fragments included */
package com.microsoft.kusto.language;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import static com.microsoft.kusto.language.psi.KqlTypes.*;

%%

%public
%class KqlTokensLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType
%eof{  return;
%eof}

// Fragments and regex definitions
ESCAPE_SEQ = \\(['\"\\abfnrtuUxv]|[0-3][0-7][0-7]|[0-7][0-7]|[0-7])
ID_START = [$_a-zA-Z]
ID_PART = [_a-zA-Z0-9]
IDENTIFIER = {ID_START}{ID_PART}* | [0-9]+{ID_START}{ID_PART}*
HEX_PREFIX = 0[xX]
HEX_DIGIT = [0-9a-fA-F]
NONHEX_INT = [0-9]+
INTEGER_NUMBER = {NONHEX_INT} | {HEX_PREFIX}{HEX_DIGIT}+
PLUSORMINUS = [+-]
EXPONENT = [eE]{PLUSORMINUS}?[0-9]+
NONINTEGER_NUMBER = [0-9]+\.[0-9]*{EXPONENT}? | [0-9]+{EXPONENT}
MULTILINE_STRING_QUOTE = "```"
ALT_MULTILINE_STRING_QUOTE = "~~~"
WHITESPACE = [\t\x20\r\n\f\u00a0\u1680\u180e\u2000-\u200b\u202f\u205f\u3000\ufeff]+
COMMENT = "//"[^\n\r\u2028\u2029]*

%%

<YYINITIAL> {
  {WHITESPACE}        { yybegin(YYINITIAL); return WHITE_SPACE; }
  {COMMENT}           { yybegin(YYINITIAL); return COMMENT; }

  // Punctuation
  "*"                 { return ASTERISK; }
  "@"                 { return ATSIGN; }
  "|"                 { return BAR; }
  "}"                 { return CLOSEBRACE; }
  "]"                 { return CLOSEBRACKET; }
  "]-"                { return CLOSEBRACKET_DASH; }
  "]->"               { return CLOSEBRACKET_DASH_GREATERTHAN; }
  ")"                 { return CLOSEPAREN; }
  ","                 { return COMMA; }
  ":"                 { return COLON; }
  "-"                 { return DASH; }
  "--"                { return DASHDASH; }
  "-->"               { return DASHDASH_GREATERTHAN; }
  "-["                { return DASH_OPENBRACKET; }
  "."                 { return DOT; }
  ".."                { return DOTDOT; }
  "="                 { return EQUAL; }
  "=="                { return EQUALEQUAL; }
  "=~"                { return EQUALTILDE; }
  "!="                { return EXCLAIMATIONPOINT_EQUAL; }
  "!~"                { return EXCLAIMATIONPOINT_TILDE; }
  ">"                 { return GREATERTHAN; }
  ">="                { return GREATERTHAN_EQUAL; }
  "<"                 { return LESSTHAN; }
  "<--"               { return LESSTHAN_DASHDASH; }
  "<-\["              { return LESSTHAN_DASH_OPENBRACKET; }
  "<="                { return LESSTHAN_EQUAL; }
  "<>"                { return LESSTHAN_GREATERTHAN; }
  "{"                 { return OPENBRACE; }
  "["                 { return OPENBRACKET; }
  "("                 { return OPENPAREN; }
  "%"                 { return PERCENTSIGN; }
  "+"                 { return PLUS; }
  ";"                 { return SEMICOLON; }
  "/"                 { return SLASH; }
  "=>"                { return EQUAL_GREATERTHAN; }

  // Keywords and contextual keywords (all from KqlTokens.g4)
  "3Dchart"           { return CHART3D_; }
  "access"            { return ACCESS; }
  "accumulate"        { return ACCUMULATE; }
  "aggregations"      { return AGGREGATIONS; }
  "alias"             { return ALIAS; }
  "all"               { return ALL; }
  "and"               { return AND; }
  "anomalychart"      { return ANOMALYCHART; }
  "anomalycolumns"    { return ANOMALYCOLUMNS; }
  "areachart"         { return AREACHART; }
  "as"                { return AS; }
  "asc"               { return ASC; }
  "assert-schema"     { return ASSERTSCHEMA; }
  "axes"              { return AXES; }
  "bagexpansion"      { return BAGEXPANSION; }
  "barchart"          { return BARCHART; }
  "base"              { return BASE; }
  "between"           { return BETWEEN; }
  "bin"               { return BIN; }
  "bin_legacy"        { return BIN_LEGACY; }
  "by"                { return BY; }
  "card"              { return CARD; }
  "cluster"           { return CLUSTER; }
  "columnchart"       { return COLUMNCHART; }
  "consume"           { return CONSUME; }
  "contains"          { return CONTAINS; }
  "containscs"        { return CONTAINSCS; }
  "contains_cs"       { return CONTAINS_CS; }
  "__contextual_datatable" { return CONTEXTUAL_DATATABLE; }
  "count"             { return COUNT; }
  "__crossCluster"    { return CROSSCLUSTER__; }
  "__crossDB"         { return CROSSDB__; }
  "database"          { return DATABASE; }
  "datascope"         { return DATASCOPE; }
  "datatable"         { return DATATABLE; }
  "declare"           { return DECLARE; }
  "decodeblocks"      { return DECODEBLOCKS; }
  "default"           { return DEFAULT; }
  "delta"             { return DELTA; }
  "desc"              { return DESC; }
  "distinct"          { return DISTINCT; }
  "edges"             { return EDGES; }
  "endswith"          { return ENDSWITH; }
  "endswith_cs"       { return ENDSWITH_CS; }
  "entity_group"      { return ENTITYGROUP; }
  "evaluate"          { return EVALUATE; }
  "execute"           { return EXECUTE; }
  "__executeAndCache" { return EXECUTE_AND_CACHE; }
  "expandoutput"      { return EXPANDOUTPUT; }
  "extend"            { return EXTEND; }
  "externaldata"      { return EXTERNALDATA; }
  "external_data"     { return EXTERNAL_DATA; }
  "facet"             { return FACET; }
  "filter"            { return FILTER; }
  "find"              { return FIND; }
  "first"             { return FIRST; }
  "flags"             { return FLAGS; }
  "fork"              { return FORK; }
  "from"              { return FROM; }
  "getschema"         { return GETSCHEMA; }
  "granny-asc"        { return GRANNYASC; }
  "granny-desc"       { return GRANNYDESC; }
  "graph-mark-components" { return GRAPHMARKCOMPONENTS; }
  "graph-match"       { return GRAPHMATCH; }
  "graph-merge"       { return GRAPHMERGE; }
  "graph-shortest-paths" { return GRAPHSHORTESTPATHS; }
  "graph-to-table"    { return GRAPHTOTABLE; }
  "has"               { return HAS; }
  "has_all"           { return HAS_ALL; }
  "has_any"           { return HAS_ANY; }
  "has_cs"            { return HAS_CS; }
  "hasprefix"         { return HASPREFIX; }
  "hasprefix_cs"      { return HASPREFIX_CS; }
  "hassuffix"         { return HASSUFFIX; }
  "hassuffix_cs"      { return HASSUFFIX_CS; }
  "hidden"            { return HIDDEN_; }
  "hint.concurrency"  { return HINT_CONCURRENCY; }
  "hint.distribution" { return HINT_DISTRIBUTION; }
  "hint.materialized" { return HINT_MATERIALIZED; }
  "hint.num_partitions" { return HINT_NUM_PARTITIONS; }
  "hint.pass_filters" { return HINT_PASS_FILTERS; }
  "hint.pass_filters_column" { return HINT_PASS_FILTERS_COLUMN; }
  "hint.progressive_top" { return HINT_PROGRESSIVE_TOP; }
  "hint.remote"       { return HINT_REMOTE; }
  "hint.shufflekey"   { return HINT_SUFFLEKEY; }
  "hint.spread"       { return HINT_SPREAD; }
  "hint.strategy"     { return HINT_STRATEGY; }
  "hot"               { return HOT; }
  "hotcache"          { return HOTCACHE; }
  "hotdata"           { return HOTDATA; }
  "hotindex"          { return HOTINDEX; }
  "id"                { return ID; }
  "__id"              { return ID__; }
  "in"                { return IN; }
  "in~"               { return IN_CI; }
  "into"              { return INTO; }
  "invoke"            { return INVOKE; }
  "isfuzzy"           { return ISFUZZY; }
  "__isFuzzy"         { return ISFUZZY__; }
  "join"              { return JOIN; }
  "kind"              { return KIND; }
  "ladderchart"       { return LADDERCHART; }
  "last"              { return LAST; }
  "legend"            { return LEGEND; }
  "let"               { return LET; }
  "like"              { return LIKE; }
  "likecs"            { return LIKECS; }
  "limit"             { return LIMIT; }
  "linear"            { return LINEAR; }
  "linechart"         { return LINECHART; }
  "list"              { return LIST; }
  "lookup"            { return LOOKUP; }
  "log"               { return LOG; }
  "macro-expand"      { return MACROEXPAND; }
  "make-graph"        { return MAKEGRAPH; }
  "make-series"       { return MAKESERIES; }
  "map"               { return MAP; }
  "matches regex"     { return MATCHES_REGEX; }
  "materialize"       { return MATERIALIZE; }
  "materialized-view-combine" { return MATERIALIZED_VIEW_COMBINE; }
  "mv-apply"          { return MV_APPLY; }
  "mv-expand"         { return MV_EXPAND; }
  "mvapply"           { return MVAPPLY; }
  "mvexpand"          { return MVEXPAND; }
  "nodes"             { return NODES; }
  "none"              { return NONE; }
  "nooptimization"    { return NOOPTIMIZATION; }
  "!between"          { return NOT_BETWEEN; }
  "!contains"         { return NOT_CONTAINS; }
  "!contains_cs"      { return NOT_CONTAINS_CS; }
  "!endswith_cs"      { return NOT_ENDSWITH_CS; }
  "!endswith"         { return NOT_ENDSWITH; }
  "!has"              { return NOT_HAS; }
  "!has_cs"           { return NOT_HAS_CS; }
  "!hasprefix"        { return NOT_HASPREFIX; }
  "!hasprefix_cs"     { return NOT_HASPREFIX_CS; }
  "!hassuffix"        { return NOT_HASSUFFIX; }
  "!hassuffix_cs"     { return NOT_HASSUFFIX_CS; }
  "!in"               { return NOT_IN; }
  "!in~"              { return NOT_IN_CI; }
  "!startswith"       { return NOT_STARTSWITH; }
  "!startswith_cs"    { return NOT_STARTSWITH_CS; }
  "notcontains"       { return NOTCONTAINS; }
  "notcontainscs"     { return NOTCONTAINSCS; }
  "notlike"           { return NOTLIKE; }
  "notlikecs"         { return NOTLIKECS; }
  "null"              { return NULL; }
  "nulls"             { return NULLS; }
  "of"                { return OF; }
  "on"                { return ON; }
  "optional"          { return OPTIONAL; }
  "or"                { return OR; }
  "order"             { return ORDER; }
  "others"            { return OTHERS; }
  "output"            { return OUTPUT; }
  "pack"              { return PACK; }
  "panels"            { return PANELS; }
  "parse"             { return PARSE; }
  "parse-kv"          { return PARSEKV; }
  "parse-where"       { return PARSEWHERE; }
  "partition"         { return PARTITION; }
  "__partitionby"     { return PARTITIONBY; }
  "partitioned-by"    { return PARTITIONEDBY; }
  "pattern"           { return PATTERN; }
  "__packedColumn"    { return PACKEDCOLUMN__; }
  "piechart"          { return PIECHART; }
  "pivotchart"        { return PIVOTCHART; }
  "plugin"            { return PLUGIN; }
  "print"             { return PRINT; }
  "project"           { return PROJECT; }
  "project-away"      { return PROJECTAWAY; }
  "__projectAway"     { return PROJECTAWAY_; }
  "project-keep"      { return PROJECTKEEP; }
  "project-rename"    { return PROJECTRENAME; }
  "project-reorder"   { return PROJECTREORDER; }
  "project-smart"     { return PROJECTSMART; }
  "query_parameters"  { return QUERYPARAMETERS; }
  "range"             { return RANGE; }
  "reduce"            { return REDUCE; }
  "regex"             { return REGEX; }
  "relaxed"           { return RELAXED; }
  "render"            { return RENDER; }
  "replace"           { return REPLACE; }
  "restrict"          { return RESTRICT; }
  "sample"            { return SAMPLE; }
  "sample-distinct"   { return SAMPLE_DISTINCT; }
  "scan"              { return SCAN; }
  "scatterchart"      { return SCATTERCHART; }
  "search"            { return SEARCH; }
  "serialize"         { return SERIALIZE; }
  "series"            { return SERIES; }
  "set"               { return SET; }
  "simple"            { return SIMPLE; }
  "sort"              { return SORT; }
  "__sourceColumnIndex" { return SOURCECOLUMNINDEX__; }
  "stacked"           { return STACKED; }
  "stacked100"        { return STACKED100; }
  "stackedareachart"  { return STACKEDAREACHART; }
  "startswith"        { return STARTSWITH; }
  "startswith_cs"     { return STARTSWITH_CS; }
  "step"              { return STEP; }
  "summarize"         { return SUMMARIZE; }
  "table"             { return TABLE; }
  "take"              { return TAKE; }
  "threshold"         { return THRESHOLD; }
  "timechart"         { return TIMECHART; }
  "timeline"          { return TIMELINE; }
  "timepivot"         { return TIMEPIVOT; }
  "title"             { return TITLE; }
  "to"                { return TO; }
  "top"               { return TOP; }
  "top-hitters"       { return TOP_HITTERS; }
  "top-nested"        { return TOP_NESTED; }
  "toscalar"          { return TOSCALAR; }
  "totable"           { return TOTABLE; }
  "treemap"           { return TREEMAP; }
  "typeof"            { return TYPEOF; }
  "union"             { return UNION; }
  "unstacked"         { return UNSTACKED; }
  "uuid"              { return UUID; }
  "view"              { return VIEW; }
  "visible"           { return VISIBLE; }
  "where"             { return WHERE; }
  "with"              { return WITH; }
  "__noWithSource"    { return WITHNOSOURCE__; }
  "withsource"        { return WITHSOURCE; }
  "with_itemindex"    { return WITH_ITEM_INDEX; }
  "with_match_id"     { return WITH_MATCH_ID; }
  "with_node_id"      { return WITH_NODE_ID; }
  "with_source"       { return WITH_SOURCE; }
  "with_step_name"    { return WITH_STEP_NAME; }
  "xaxis"             { return XAXIS; }
  "xcolumn"           { return XCOLUMN; }
  "xmax"              { return XMAX; }
  "xmin"              { return XMIN; }
  "xtitle"            { return XTITLE; }
  "yaxis"             { return YAXIS; }
  "ycolumns"          { return YCOLUMNS; }
  "ymax"              { return YMAX; }
  "ymin"              { return YMIN; }
  "ysplit"            { return YSPLIT; }
  "ytitle"            { return YTITLE; }

  // Types
  "bool"              { return BOOL; }
  "boolean"           { return BOOLEAN; }
  "date"              { return DATE; }
  "datetime"          { return DATETIME; }
  "decimal"           { return DECIMAL; }
  "double"            { return DOUBLE; }
  "dynamic"           { return DYNAMIC; }
  "float"             { return FLOAT; }
  "guid"              { return GUID; }
  "int"               { return INT; }
  "int8"              { return INT8; }
  "int16"             { return INT16; }
  "int32"             { return INT32; }
  "int64"             { return INT64; }
  "long"              { return LONG; }
  "string"            { return STRING; }
  "real"              { return REAL; }
  "time"              { return TIME; }
  "timespan"          { return TIMESPAN; }
  "uint"              { return UINT; }
  "uint8"             { return UINT8; }
  "uint16"            { return UINT16; }
  "uint32"            { return UINT32; }
  "uint64"            { return UINT64; }
  "ulong"             { return ULONG; }
  "uniqueid"          { return UNIQUEID; }

  // Boolean literals
  "true"              { return BOOLEANLITERAL; }
  "false"             { return BOOLEANLITERAL; }
  "TRUE"              { return BOOLEANLITERAL; }
  "FALSE"             { return BOOLEANLITERAL; }
  "True"              { return BOOLEANLITERAL; }
  "False"             { return BOOLEANLITERAL; }

  // Identifiers
  {IDENTIFIER}         { return IDENTIFIER; }

  // Integer/real/decimal literals (simplified)
  {INTEGER_NUMBER}     { return INTLITERAL; }
  {NONINTEGER_NUMBER}  { return REALLITERAL; }

  // String literals (simplified)
  '\"'([^\"\\\r\n]|{ESCAPE_SEQ})*'\"' { return STRINGLITERAL; }
  '\''([^\'\\\r\n]|{ESCAPE_SEQ})*'\'' { return STRINGLITERAL; }

  // Fallback
  .                    { return BAD_CHARACTER; }
}
