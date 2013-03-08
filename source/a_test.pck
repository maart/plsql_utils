create or replace package a_test as
  /*=========================================================================*/
  procedure put(i_msg in varchar2);
  /*=========================================================================*/
  procedure get_sysdate;
  /*=========================================================================*/
end;
/
create or replace package body a_test as
  /*=========================================================================*/
  procedure put(i_msg in varchar2) is
  begin
    dbms_output.put_line(a => i_msg);
  end put;
  /*=========================================================================*/
  procedure get_sysdate is
  begin
    put(to_char(sysdate, 'dd.mm.rr hh24:mi:ss'));
  end get_sysdate;
  /*=========================================================================*/
end;
/
