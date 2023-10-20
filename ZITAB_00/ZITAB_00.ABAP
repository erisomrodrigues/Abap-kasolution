REPORT ZITAB_00.

TYPES: BEGIN OF TY_SFLIGHT,
        CARRID    TYPE SFLIGHT-carrid,
        CONNID    TYPE SFLIGHT-connid,
        PRICE     TYPE SFLIGHT-PRICE,
        CURRENCY  TYPE SFLIGHT-CURRENCY,
        SEATSOCC  TYPE SFLIGHT-SEATSOCC,
  END OF TY_SFLIGHT.

  DATA: ST_SFLIGHT TYPE ty_sflight.
  DATA: LT_SFLIGHT TYPE STANDARD TABLE OF ty_sflight.

  PARAMETERS: P_CARRID TYPE SFLIGHT-carrid,
              P_CONNID TYPE SFLIGHT-connid.

  SELECT CARRID CONNID PRICE CURRENCY SEATSOCC INTO TABLE lt_sflight  FROM sflight WHERE
    CARRID =  p_carrid AND
    connid =  p_connid.

 IF SY-SUBRC = 0.

   LOOP AT lt_sflight INTO st_sflight.
     WRITE: st_sflight-carrid.
     WRITE: st_sflight-connid.
     WRITE: st_sflight-currency.
     WRITE: st_sflight-price.
     WRITE: st_sflight-seatsocc,/.

  ENDLOOP.
 ELSE.
   MESSAGE 'SEM DADOS A SER EXIBIDO' TYPE 'I'.

 ENDIF.
