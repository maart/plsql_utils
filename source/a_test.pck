create or replace package a_test as
  /*=========================================================================*/
  -- returns system date in format 'dd.mm.rr hh24:mi:ss'
  procedure get_sysdate;
  /*=========================================================================*/
end;
/
create or replace package body a_test as
  /*=========================================================================*/
  -- returns system date in format 'dd.mm.rr hh24:mi:ss'
  procedure get_sysdate is
  begin
    put(to_char(sysdate, 'dd.mm.rr hh24:mi:ss'));
  end get_sysdate;
  /*=========================================================================*/
end;
/
