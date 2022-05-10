%module p_hash_go

%{
#include "p_hash_go.h"
%}

%include <typemaps.i>
%apply unsigned char *INOUT { unsigned char *output };

%include "p_hash_go.h"
