       identification division.
       program-id. SPTRIGL.
       
       data division.
       working-storage section.
       01 ws-pair pic 9 value 0.

       LINKAGE SECTION.
       01 param pic 99.
       01 res pic 999.
       
       procedure division using  param res.
       compute ws-pair = function mod(param 2)
       if ws-pair = 0
          compute res = (param + 1) * param / 2 
       else
          compute res = (param - 1) * param / 2 + param
       end-if
       goback.

       end program SPTRIGL.
