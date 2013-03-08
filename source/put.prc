create or replace procedure put(i_msg in varchar2) as
begin
  dbms_output.put_line(a => substr(i_msg, 1, 255));
end put;
/
