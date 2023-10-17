REPORT zstr_00.


TYPES: BEGIN OF t_flight,
      carrid    TYPE sflight-carrid,
      connid    TYPE sflight-connid,
      fldate    TYPE sflight-fldate,
      price     TYPE sflight-price,
      currency  TYPE sflight-currency,
      seatsocc  TYPE sflight-seatsocc,
      END OF t_flight.

DATA: wa_flight TYPE t_flight.

PARAMETERS: p_carrid TYPE sflight-carrid,
           p_connid TYPE sflight-connid,
           p_fldate TYPE sflight-fldate.

SELECT SINGLE carrid connid fldate price currency seatsocc
  INTO wa_flight
  FROM sflight
  WHERE carrid = p_carrid
  AND   connid = p_connid
  AND fldate   = p_fldate.

 IF sy-subrc = 0.
   WRITE: wa_flight-carrid,
          wa_flight-connid,
          wa_flight-currency,
          wa_flight-fldate,
          wa_flight-price,
          wa_flight-seatsocc.

  ENDIF.
